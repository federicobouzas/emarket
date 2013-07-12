<?php

App::uses('CakeEmail', 'Network/Email');
App::uses('View', 'View');
App::import('Helper', 'Html');

class EnviarCampaniaShell extends AppShell {

    public $uses = array('Campania', 'Persona', 'Messaging.Mensaje');

    public function main() {
        $this->out("CRON DE ENVIO DE CAMPAÑAS (" . date("H:i:s") . " DEL " . date("d/m/Y") . ")");

        /*
          $sql = "SELECT Campania.*, GROUP_CONCAT(CampaniasPoblaciones.poblacion_id) AS Poblaciones
          FROM cam_campanias AS Campania
          JOIN cam_campanias_poblaciones AS CampaniasPoblaciones ON (CampaniasPoblaciones.campania_id = Campania.id)
          WHERE Campania.activa = 'Si' AND
          Campania.estado = 'Sin enviar' AND
          Campania.email = 'Si' AND
          Campania.fecha_envio <= '" . date("Y-m-d H:i:s") . "'
          GROUP BY Campania.id
          ORDER BY Campania.prioridad DESC, Campania.fecha_envio DESC
          LIMIT 1";
         */
        $sql = "SELECT * FROM cam_campanias AS Campania 
                WHERE activa = 'Si' AND  estado = 'Sin enviar' AND email = 'Si' AND 
                      fecha_envio <= '" . date("Y-m-d H:i:s") . "' 
                ORDER BY prioridad DESC, fecha_envio DESC LIMIT 1";
        $query = $this->Campania->Query($sql);

        if (empty($query)) {
            $this->out("ENVIADA: NINGUNA");
            return;
        }

        $campania = $query[0]['Campania'];
        //$poblaciones = $query[0][0]['Poblaciones'];
        
        try {
            $this->Campania->Query("UPDATE cam_campanias SET estado='Enviada', fecha_envio=NOW() WHERE id=" . $campania['id']);

            /*
              $personas = $this->Campania->Query("SELECT DISTINCT p.*
              FROM per_personas p
              JOIN per_personas_poblaciones pp ON pp.persona_id = p.id
              WHERE p.activa='Si' AND pp.poblacion_id IN (" . $poblaciones . ")");
             */

            $where = "";
            $join = "";
            if (!empty($campania['personas_sexo'])) {
                $where.= " AND per_personas.sexo='" . $campania['personas_sexo'] . "' ";
            }
            if (!empty($campania['personas_comuna'])) {
                $where.= " AND per_personas.comuna IN (" . $campania['personas_comuna'] . ") ";
            }
            if (!empty($campania['personas_barrio'])) {
                $where.= " AND per_personas.barrio IN ('" . implode("','", explode(",", $campania['personas_barrio'])) . "') ";
            }
            if (!empty($campania['personas_poblaciones'])) {
                $join.= " JOIN per_personas_poblaciones ON per_personas_poblaciones.persona_id=per_personas.id ";
                $where.= " AND per_personas_poblaciones.poblacion_id IN (" . $campania['personas_poblaciones'] . ") ";
            }
            if (!empty($campania['personas_edad'])) {
                $array_edad = explode(",", $campania['personas_edad']);
                if (count($array_edad) == 2) {
                    if (is_numeric($array_edad[1])) {
                        //$fecha_hasta = date("Y-m-d", 60 * 60 * 24 * 365 * $array_edad[1]);
                        //$where.= " AND per_personas.fecha_nacimiento <= '" . $fecha_hasta . "' ";
                        $where.= " AND per_personas.fecha_nacimiento > '" . (date("Y") - $array_edad[1]) . "-" . date("m") . "-" . date("d") . "' ";
                    }
                    if (is_numeric($array_edad[0])) {
                        //$fecha_desde = date("Y-m-d", 60 * 60 * 24 * 365 * $array_edad[0]);
                        //$where.= " AND per_personas.fecha_nacimiento >= '" . $fecha_desde . "' ";
                        $where.= " AND per_personas.fecha_nacimiento <= '" . (date("Y") - $array_edad[0] - 1) . "-" . date("m") . "-" . date("d") . "' ";
                    }
                }
            }

            $personas = $this->Campania->Query("SELECT DISTINCT per_personas.* 
                                                FROM per_personas " . $join . " 
                                                WHERE per_personas.activa='Si' " . $where);
            
            $cuerpo = htmlspecialchars_decode($campania['cuerpo_email']);
            $links = $this->Campania->trackLinks($campania['id'], $cuerpo);

            foreach ($personas as $persona) {
                $hash = md5("GCBA|" . $campania['id'] . "|" . $persona['per_personas']['id']);

                $this->Campania->Query("INSERT INTO cam_campanias_personas (campania_id, persona_id, estado)
                                    VALUES (" . $campania['id'] . ", " . $persona['per_personas']['id'] . ", 'Enviada')");

                $unsubscribe_link = $this->Campania->generateUnsubscribeLink($campania['id'], $persona['per_personas']['id'], $hash);

                $replace = array(
                    $persona['per_personas']['nombre'],
                    $persona['per_personas']['apellido'],
                    $unsubscribe_link,
                );

                $cuerpo_links = $this->Campania->replaceLinks($campania['id'], $persona['per_personas']['id'], $cuerpo, $links);

                $asunto_persona = $this->Campania->replaceVars($campania['asunto_email'], $replace);
                $cuerpo_persona = $this->Campania->replaceVars($cuerpo_links, $replace);

                if ($campania['tipo'] == "Encuesta") {
                    $email_data = array(
                        "destino" => $persona['per_personas']['email'],
                        "asunto" => $this->Campania->Encuesta->replaceVars($campania['id'], $persona['per_personas']['id'], $hash, $asunto_persona),
                        "cuerpo" => $this->Campania->Encuesta->replaceVars($campania['id'], $persona['per_personas']['id'], $hash, $cuerpo_persona)
                    );
                } elseif ($campania['tipo'] == "Evento") {
                    $email_data = array(
                        "destino" => $persona['per_personas']['email'],
                        "asunto" => $this->Campania->Evento->replaceVars($campania['id'], $persona['per_personas']['id'], $hash, $asunto_persona),
                        "cuerpo" => $this->Campania->Evento->replaceVars($campania['id'], $persona['per_personas']['id'], $hash, $cuerpo_persona)
                    );
                } else {
                    $email_data = array(
                        "destino" => $persona['per_personas']['email'],
                        "asunto" => $asunto_persona,
                        "cuerpo" => $cuerpo_persona
                    );
                }

                $get_config = $this->Campania->Query("SELECT * FROM sys_configurations LIMIT 1");
                $config = $get_config[0]['sys_configurations'];
                $web = 'http://' . $config['web'] . WWW;

                $tracker_path = array('controller' => 'campanias', 'action' => 'lectura', $campania['id'], $persona['per_personas']['id'], $hash);

                $htmlHelper = new HtmlHelper(new View());

                $tracker = '';
                $tracker.= '<img src="' . substr($web, 0, strlen($web) - 1) . $htmlHelper->url($tracker_path) . '" style="border:0;width:1px;height:1px;" />';
                //$tracker.= '<bgsound src="' . substr($web, 0, strlen($web) - 1) . $htmlHelper->url($tracker_path) . '" volume="-10000" />';

                $headers = array(
                    "X-Hash" => md5("GCBA|" . $campania['id'] . "|" . $persona['per_personas']['id']),
                    "X-Campania" => $campania['id'],
                    "X-Persona" => $persona['per_personas']['id'],
                    "List-Unsubscribe" => "<" . $unsubscribe_link . ">",
                );

                $email_data["cuerpo"].= $tracker;
                $email_data["prioridad"] = $campania['prioridad'];
                $email_data["server_id"] = $campania['server_id'];
                $email_data["headers"] = json_encode($headers);

                $msj = new Mensaje();
                $msj->send($email_data);
            }

            $this->out("ENVIADA: " . $campania['nombre']);
        } catch (SocketException $e) {
            $this->log("SE PRODUJO UN ERROR AL INTENTAR ENVIAR LA CAMPAÑA : " . $campania['nombre']);
            $this->out("SE PRODUJO UN ERROR AL INTENTAR ENVIAR LA CAMPAÑA : " . $campania['nombre']);
        }
    }

}
<?php

App::uses('CakeEmail', 'Network/Email');
App::uses('View', 'View');
App::import('Helper', 'Html');

class EnviarCampaniaShell extends AppShell {

    public $uses = array('Campania', 'Persona', 'FmwMessaging.Mensaje');

    public function main() {
        $this->out("CRON DE ENVIO DE CAMPAÑAS (" . date("H:i:s") . " DEL " . date("d/m/Y") . ")");

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

        try {
            $this->Campania->Query("UPDATE cam_campanias SET estado='Enviada', fecha_envio=NOW() WHERE id=" . $campania['id']);

            $personas = getPersonasFromParams((object) $campania, "all");
            $cuerpo = htmlspecialchars_decode($campania['cuerpo_email']);
            $links = $this->Campania->trackLinks($campania['id'], $cuerpo);

            foreach ($personas as $persona) {
                $hash = md5("EIDEOS|EMARKET|" . $campania['id'] . "|" . $persona['Persona']['id']);

                $this->Campania->Query("INSERT INTO cam_campanias_personas (campania_id, persona_id, estado)
                                        VALUES (" . $campania['id'] . ", " . $persona['Persona']['id'] . ", 'Enviada')");

                $unsubscribe_link = $this->Campania->generateUnsubscribeLink($campania['id'], $persona['Persona']['id'], $hash);

                $replace = array(
                    $persona['Persona']['nombre'],
                    $persona['Persona']['apellido'],
                    $unsubscribe_link,
                );

                $cuerpo_links = $this->Campania->replaceLinks($campania['id'], $persona['Persona']['id'], $cuerpo, $links);

                $asunto_persona = $this->Campania->replaceVars($campania['asunto_email'], $replace);
                $cuerpo_persona = $this->Campania->replaceVars($cuerpo_links, $replace);

                if ($campania['tipo'] == "Encuesta") {
                    $email_data = array(
                        "destino" => $persona['Persona']['email'],
                        "asunto" => $this->Campania->Encuesta->replaceVars($campania['id'], $persona['Persona']['id'], $hash, $asunto_persona),
                        "cuerpo" => $this->Campania->Encuesta->replaceVars($campania['id'], $persona['Persona']['id'], $hash, $cuerpo_persona)
                    );
                } elseif ($campania['tipo'] == "Evento") {
                    $email_data = array(
                        "destino" => $persona['Persona']['email'],
                        "asunto" => $this->Campania->Evento->replaceVars($campania['id'], $persona['Persona']['id'], $hash, $asunto_persona),
                        "cuerpo" => $this->Campania->Evento->replaceVars($campania['id'], $persona['Persona']['id'], $hash, $cuerpo_persona)
                    );
                } else {
                    $email_data = array(
                        "destino" => $persona['Persona']['email'],
                        "asunto" => $asunto_persona,
                        "cuerpo" => $cuerpo_persona
                    );
                }

                $web = 'http://' . getSystemConfiguration('web') . WWW;
                $tracker_path = array('controller' => 'campanias', 'action' => 'lectura', $campania['id'], $persona['Persona']['id'], $hash);
                $htmlHelper = new HtmlHelper(new View());

                $tracker = '';
                $tracker.= '<img src="' . substr($web, 0, strlen($web) - 1) . $htmlHelper->url($tracker_path) . '" style="border:0;width:1px;height:1px;" />';
                //$tracker.= '<bgsound src="' . substr($web, 0, strlen($web) - 1) . $htmlHelper->url($tracker_path) . '" volume="-10000" />';

                $headers = array(
                    "X-Hash" => md5("GCBA|" . $campania['id'] . "|" . $persona['Persona']['id']),
                    "X-Campania" => $campania['id'],
                    "X-Persona" => $persona['Persona']['id'],
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

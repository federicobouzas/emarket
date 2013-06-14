<?php

App::uses('Presentation', 'Presentation');

class pst_reportes_campania extends Presentation {

    public function ajaxGetInfo($params) {
        if (empty($params->campania)) {
            return "";
        }

        $ret = array();
        $db = ConnectionManager::getDataSource('default');

        $info = $db->Query("SELECT * FROM cam_campanias WHERE id=" . $params->campania);
        $ret['tipo'] = $info[0]['cam_campanias']['tipo'];

        // Total de Suscriptores
        $cant_total = $db->Query("SELECT COUNT(*) AS cant FROM cam_campanias_personas WHERE campania_id=" . $params->campania);
        $ret['personas']['total'] = (int) $cant_total[0][0]['cant'];

        // Total de Aperturas
        $cant_lecturas = $db->Query("SELECT COUNT(*) AS cant FROM cam_campanias_personas WHERE lectura IS NOT NULL AND campania_id=" . $params->campania);
        $ret['personas']['leidos'] = (int) $cant_lecturas[0][0]['cant'];

        // Errores
        $ret['personas']['error']['hard'] = 0;
        $ret['personas']['error']['soft'] = 0;
        $cant_error = $db->Query("SELECT error_tipo, COUNT(*) AS cant FROM cam_campanias_personas WHERE error IS NOT NULL AND campania_id=" . $params->campania . " GROUP BY error_tipo");
        foreach ($cant_error as $error) {
            if ($error[0] == 'Hard' || empty($error[0]['error_tipo'])) {
                $ret['personas']['error']['hard'] = (int) $error[0]['cant'];
            } else {
                $ret['personas']['error']['soft'] = (int) $error[0]['cant'];
            }
        }
        $ret['personas']['error']['total'] = $ret['personas']['error']['hard'] + $ret['personas']['error']['soft'];

        // Entregados
        $ret['personas']['entregados'] = $ret['personas']['total'] - $ret['personas']['error']['total'];

        // No Leidos
        $ret['personas']['no_leidos'] = $ret['personas']['total'] - $ret['personas']['leidos'] - $ret['personas']['error']['total'];

        // Ultima Apertura
        $ultima_lectura = $db->Query("SELECT lectura FROM cam_campanias_personas WHERE lectura IS NOT NULL AND campania_id=" . $params->campania . " ORDER BY lectura DESC LIMIT 1");
        if (empty($ultima_lectura)) {
            $ret['personas']['ultima_lectura'] = "Nunca";
        } else {
            $ret['personas']['ultima_lectura'] = date("d/m/Y H:i:s", strtotime($ultima_lectura[0]['cam_campanias_personas']['lectura']));
        }

        // Clicks
        $clicks = $db->Query("SELECT COUNT(*) as cant FROM cam_links_personas p JOIN cam_links l ON l.id=p.link_id WHERE l.campania_id=" . $params->campania);
        $ret['personas']['clicks'] = (int) $clicks[0][0]['cant'];

        // Ultimo Click
        $ultimo_click = $db->Query("SELECT p.fecha_acceso FROM cam_links_personas p JOIN cam_links l ON l.id=p.link_id WHERE l.campania_id=" . $params->campania . " ORDER BY fecha_acceso DESC LIMIT 1");
        if (empty($ultimo_click)) {
            $ret['personas']['ultimo_click'] = "Nunca";
        } else {
            $ret['personas']['ultimo_click'] = date("d/m/Y H:i:s", strtotime($ultimo_click[0]['p']['fecha_acceso']));
        }

        $links = $db->Query("SELECT l.link, COUNT(p.id) AS totales, COUNT(distinct p.persona_id) AS unicos
                             FROM cam_links l
                             LEFT JOIN cam_links_personas p ON l.id= p.link_id
                             WHERE l.campania_id=" . $params->campania . "
                             GROUP BY l.id");
        $ret['links'] = array(
            'data' => array(
                0 => array('name' => 'Totales', 'data' => array()),
                1 => array('name' => 'Únicos', 'data' => array())
            ),
            'categories' => array());
        foreach ($links as $link) {
            $ret['links']['categories'][] = $link['l']['link'];
            $ret['links']['data'][0]['data'][] = (int) $link[0]['totales'];
            $ret['links']['data'][1]['data'][] = (int) $link[0]['unicos'];
        }

        if ($ret['tipo'] == "Encuesta") {
            $cant_accesos = $db->Query("SELECT COUNT(*) AS cant FROM cam_campanias_personas WHERE acceso IS NOT NULL AND campania_id=" . $params->campania);
            $cant_respuestas = $db->Query("SELECT COUNT(*) AS cant FROM cam_campanias_personas WHERE respuesta IS NOT NULL AND campania_id=" . $params->campania);
            $ret['personas']['accesos'] = (int) $cant_accesos[0][0]['cant'];
            $ret['personas']['respuestas'] = (int) $cant_respuestas[0][0]['cant'];
        } elseif ($ret['tipo'] == "Evento") {
            $cant_si_asiste = $db->Query("SELECT COUNT(*) AS cant FROM cam_eventos_asistencias WHERE asiste='Si' AND evento_id=" . $info[0]['cam_campanias']['evento_id']);
            $cant_no_asiste = $db->Query("SELECT COUNT(*) AS cant FROM cam_eventos_asistencias WHERE asiste='No' AND evento_id=" . $info[0]['cam_campanias']['evento_id']);
            $ret['personas']['asistencias']['si'] = (int) $cant_si_asiste[0][0]['cant'];
            $ret['personas']['asistencias']['no'] = (int) $cant_no_asiste[0][0]['cant'];
        }

        return $ret;
    }

    public function ajaxGetGraficoEncuestas($params) {
        if (empty($params->campania)) {
            return "";
        }

        if (empty($params->dias)) {
            $params->dias = 10;
        }

        $ret = array();
        $db = ConnectionManager::getDataSource('default');

        $info = $db->Query("SELECT * FROM cam_campanias WHERE id=" . $params->campania);

        $desde = strtotime($info[0]['cam_campanias']['fecha_envio']);
        $hasta = ($params->dias * 86400) + $desde;
        $lecturas = array();
        $accesos = array();
        $respuestas = array();

        $l = $db->Query("SELECT DATE_FORMAT(lectura, '%Y%m%d') AS dia, COUNT(*) AS cant
                         FROM cam_campanias_personas
                         WHERE lectura BETWEEN '" . date("Y-m-d", $desde) . " 00:00:00' AND '" . date("Y-m-d", $hasta) . " 23:59:59' AND campania_id =" . $params->campania . "
                         GROUP BY dia");
        if (count($l)) {
            foreach ($l[0] as $row) {
                $lecturas[$row['dia']] = $row['cant'];
            }
        }

        $a = $db->Query("SELECT DATE_FORMAT(acceso, '%Y%m%d') AS dia, COUNT(*) AS cant
                         FROM cam_campanias_personas
                         WHERE acceso BETWEEN '" . date("Y-m-d", $desde) . " 00:00:00' AND '" . date("Y-m-d", $hasta) . " 23:59:59' AND campania_id =" . $params->campania . "
                         GROUP BY dia");
        if (count($a)) {
            foreach ($a[0] as $row) {
                $accesos[$row['dia']] = $row['cant'];
            }
        }

        $r = $db->Query("SELECT DATE_FORMAT(respuesta, '%Y%m%d') AS dia, COUNT(*) AS cant
                         FROM cam_campanias_personas
                         WHERE respuesta BETWEEN '" . date("Y-m-d", $desde) . " 00:00:00' AND '" . date("Y-m-d", $hasta) . " 23:59:59' AND campania_id =" . $params->campania . "
                         GROUP BY dia");
        if (count($r)) {
            foreach ($r[0] as $row) {
                $respuestas[$row['dia']] = $row['cant'];
            }
        }

        $ret['data'] = array(
            array(
                'name' => 'Lecturas',
                'data' => array()
            ),
            array(
                'name' => 'Accesos',
                'data' => array()
            ),
            array(
                'name' => 'Respuestas',
                'data' => array()
            )
        );


        for ($i = $desde; $i <= $hasta; $i+=86400) {
            $dia = date("Ymd", $i);
            $ret['categories'][] = date("d/m/Y", $i);
            foreach ($ret['data'] as $key => $value) {
                if ($value['name'] == "Lecturas") {
                    $ret['data'][$key]['data'][] = (int) (isset($lecturas[$dia]) ? $lecturas[$dia] : 0);
                } elseif ($value['name'] == "Accesos") {
                    $ret['data'][$key]['data'][] = (int) (isset($accesos[$dia]) ? $accesos[$dia] : 0);
                } else {
                    $ret['data'][$key]['data'][] = (int) (isset($respuestas[$dia]) ? $respuestas[$dia] : 0);
                }
            }
        }

        return $ret;
    }

    public function ajaxGetGraficoCampanias($params) {
        if (empty($params->campania)) {
            return "";
        }

        if (empty($params->dias)) {
            $params->dias = 10;
        }

        $ret = array();
        $db = ConnectionManager::getDataSource('default');

        $info = $db->Query("SELECT * FROM cam_campanias WHERE id=" . $params->campania);

        switch ($info[0]['cam_campanias']['tipo']) {
            case 'Encuesta':
                $ret['title'] = 'Comparativo diario de Lecturas, Accesos y Respuestas';
                break;
            case 'Evento':
                $ret['title'] = 'Comparativo diario de Lecturas y Accesos';
                break;
            default:
                $ret['title'] = 'Comparativo diario de Lecturas';
                break;
        }

        $desde = strtotime($info[0]['cam_campanias']['fecha_envio']);
        $hasta = ($params->dias * 86400) + $desde;

        $ret['data'] = array(
            array(
                'name' => 'Lecturas',
                'data' => array()
            )
        );

        $lecturas = array();
        $l = $db->Query("SELECT DATE_FORMAT(lectura, '%Y%m%d') AS dia, COUNT(*) AS cant
                         FROM cam_campanias_personas
                         WHERE lectura BETWEEN '" . date("Y-m-d", $desde) . " 00:00:00' AND '" . date("Y-m-d", $hasta) . " 23:59:59' AND campania_id =" . $params->campania . "
                         GROUP BY dia");
        if (count($l)) {
            foreach ($l[0] as $row) {
                $lecturas[$row['dia']] = $row['cant'];
            }
        }

        if ($info[0]['cam_campanias']['tipo'] == "Encuesta" || $info[0]['cam_campanias']['fecha_envio'] == "Evento") {
            $accesos = array();
            $a = $db->Query("SELECT DATE_FORMAT(acceso, '%Y%m%d') AS dia, COUNT(*) AS cant
                         FROM cam_campanias_personas
                         WHERE acceso BETWEEN '" . date("Y-m-d", $desde) . " 00:00:00' AND '" . date("Y-m-d", $hasta) . " 23:59:59' AND campania_id =" . $params->campania . "
                         GROUP BY dia");
            if (count($a)) {
                foreach ($a[0] as $row) {
                    $accesos[$row['dia']] = $row['cant'];
                }
            }

            $ret['data'][] = array(
                'name' => 'Accesos',
                'data' => array()
            );
        }

        if ($info[0]['cam_campanias']['tipo'] == "Encuesta") {
            $respuestas = array();
            $r = $db->Query("SELECT DATE_FORMAT(respuesta, '%Y%m%d') AS dia, COUNT(*) AS cant
                         FROM cam_campanias_personas
                         WHERE respuesta BETWEEN '" . date("Y-m-d", $desde) . " 00:00:00' AND '" . date("Y-m-d", $hasta) . " 23:59:59' AND campania_id =" . $params->campania . "
                         GROUP BY dia");
            if (count($r)) {
                foreach ($r[0] as $row) {
                    $respuestas[$row['dia']] = $row['cant'];
                }
            }

            $ret['data'][] = array(
                'name' => 'Respuestas',
                'data' => array()
            );
        }

        for ($i = $desde; $i <= $hasta; $i+=86400) {
            $dia = date("Ymd", $i);
            $ret['categories'][] = date("d/m/Y", $i);
            foreach ($ret['data'] as $key => $value) {
                if ($value['name'] == "Lecturas") {
                    $ret['data'][$key]['data'][] = (int) (isset($lecturas[$dia]) ? $lecturas[$dia] : 0);
                } elseif ($value['name'] == "Accesos") {
                    $ret['data'][$key]['data'][] = (int) (isset($accesos[$dia]) ? $accesos[$dia] : 0);
                } else {
                    $ret['data'][$key]['data'][] = (int) (isset($respuestas[$dia]) ? $respuestas[$dia] : 0);
                }
            }
        }

        return $ret;
    }

    public function ajaxGetGraficoCampanias2($params) {
        if (empty($params->campania)) {
            return "";
        }

        $ret = array();
        $db = ConnectionManager::getDataSource('default');
        $info = $db->Query("SELECT * FROM cam_campanias WHERE id=" . $params->campania);

        // LECTURAS
        $lecturas = array();
        $l = $db->Query("SELECT DATE_FORMAT(lectura, '%Y-%m-%d %H:%i') AS fecha, COUNT(*) AS cant
                         FROM cam_campanias_personas
                         WHERE lectura IS NOT NULL AND campania_id=" . $params->campania . "
                         GROUP BY fecha");
        if (count($l)) {
            foreach ($l as $row) {
                $lecturas[] = array(strtotime($row[0]['fecha']) * 1000, (int) $row[0]['cant']);
            }
        }
        $ret[] = array(
            'name' => 'Aperturas',
            'data' => $lecturas,
        );

        // CLICKS
        $clicks = array();
        $c = $db->Query("SELECT DATE_FORMAT(fecha_acceso, '%Y-%m-%d %H:%i') AS fecha, COUNT(*) AS cant
                         FROM cam_links_personas p 
                         JOIN cam_links l ON l.id=p.link_id
                         WHERE l.campania_id=" . $params->campania . "
                         GROUP BY fecha");
        if (count($l)) {
            foreach ($c as $row) {
                $clicks[] = array(strtotime($row[0]['fecha']) * 1000, (int) $row[0]['cant']);
            }
        }
        $ret[] = array(
            'name' => 'Clicks',
            'data' => $clicks,
        );
        
        // RESPUESTAS
        if ($info[0]['cam_campanias']['tipo'] == "Encuesta") {
            $respuestas = array();
            $r = $db->Query("SELECT DATE_FORMAT(respuesta, '%Y-%m-%d %H:%i') AS fecha, COUNT(*) AS cant
                             FROM cam_campanias_personas
                             WHERE respuesta IS NOT NULL AND campania_id =" . $params->campania . "
                             GROUP BY fecha");
            if (count($r)) {
                foreach ($r as $row) {
                    $respuestas[] = array(strtotime($row[0]['fecha']) * 1000, (int) $row[0]['cant']);
                }
            }
            $ret[] = array(
                'name' => 'Respuestas',
                'data' => $respuestas,
            );
        }



        return $ret;
    }

    public function ajaxGetPreguntas($params) {
        if (empty($params->campania)) {
            return "";
        }

        $ret = array();
        $db = ConnectionManager::getDataSource('default');

        $info = $db->Query("SELECT * FROM cam_campanias WHERE id=" . $params->campania);

        $preguntas = $db->Query("SELECT id, pregunta, tipo FROM cam_encuestas_preguntas 
                                 WHERE encuesta_id =" . $info[0]['cam_campanias']['encuesta_id'] . " AND tipo != 'TEXTO'
                                 ORDER BY orden ASC, id ASC");

        foreach ($preguntas as $pregunta) {
            $ret[] = array(
                'id' => $pregunta['cam_encuestas_preguntas']['id'],
                'pregunta' => $pregunta['cam_encuestas_preguntas']['pregunta']
            );
        }

        return $ret;
    }

    public function ajaxGetGraficoRespuestas($params) {
        if (empty($params->campania) || empty($params->pregunta)) {
            return "";
        }

        $ret = array();
        $db = ConnectionManager::getDataSource('default');

        $pregunta = $db->Query("SELECT opciones FROM cam_encuestas_preguntas WHERE id =" . $params->pregunta);

        if (!empty($pregunta[0]['cam_encuestas_preguntas'])) {
            $opciones = array_map("trim", explode(",", $pregunta[0]['cam_encuestas_preguntas']['opciones']));
        }
        $ret['categories'] = $opciones;
        for ($i = 0; $i < count($opciones); $i++) {
            $ret['data'][$i] = 0;
        }

        $respuestas = $db->Query("SELECT respuesta, COUNT(*) AS cant FROM cam_encuestas_respuestas 
                                  WHERE campania_id =" . $params->campania . " AND pregunta_id =" . $params->pregunta . " 
                                  GROUP BY respuesta");

        foreach ($respuestas as $respuesta) {
            $ret['data'][array_search($respuesta['cam_encuestas_respuestas']['respuesta'], $opciones)] = (int) $respuesta[0]['cant'];
        }

        return $ret;
    }

    public function ajaxGetGraficoAsistencias($params) {
        if (empty($params->campania)) {
            return "";
        }

        $ret = array();

        $db = ConnectionManager::getDataSource('default');

        $info = $db->Query("SELECT * FROM cam_campanias WHERE id=" . $params->campania);
        $evento_id = $info[0]['cam_campanias']['evento_id'];

        $evento = $db->Query("SELECT asiste, COUNT(*) AS cant FROM cam_eventos_asistencias WHERE evento_id=" . $evento_id . " AND asiste IS NOT NULL GROUP BY asiste");

        foreach ($evento as $value) {
            $ret[] = array(
                'name' => $value['cam_eventos_asistencias']['asiste'],
                'color' => ($value['cam_eventos_asistencias']['asiste'] == "Si" ? "#89a54e" : "#aa4643"),
                'y' => (int) $value[0]['cant']
            );
        }

        return $ret;
    }

}

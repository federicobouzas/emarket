<?php

App::uses('Sanitize', 'Utility');

class EncuestasController extends AppController {

    public function beforeFilter() {
        parent::beforeFilter();
        $this->Auth->allow('answer');
    }

    public function add() {
        $this->maint = getData('Encuestas/EncuestasMaint');
        parent::add();
    }

    public function edit($id = null) {
        $this->maint = getData('Encuestas/EncuestasMaint');
        parent::edit($id);
    }

    public function index($last = false) {
        $this->search_list = getData('Encuestas/EncuestasSL');
        parent::index($last);
    }

    public function view($id = null) {
        $this->maint = getData('Encuestas/EncuestasMaint');
        parent::view($id);
    }

    public function delete($id = null) {
        $cant = $this->Encuesta->Campania->find('count', array('conditions' => array('encuesta_id' => $id)));
        if ($cant > 0) {
            throw new MethodNotAllowedException(__('No se puede eliminar la encuesta, esta siendo utilizada por ' . $cant . ' campañas.'));
        }
        parent::delete($id);
    }

    public function test($id = null) {
        $preguntas = $this->Encuesta->Pregunta->find("all", array("conditions" => array("encuesta_id" => $id)));
        $this->set('preguntas', $preguntas);
        return $this->render('/Encuestas/answer', 'default');
    }

    public function answer($campania_id = null, $persona_id = null, $hash = null) {
        $now = date("Y-m-d H:i:s");

        // Chequeo la URL
        if (!$this->checkURL($campania_id, $persona_id, $hash)) {
            $this->set('msj', 'Utilice el link que recibió por correo para responder la encuesta.');
            return $this->render('/Campanias/error_close', $this->layout);
        }

        // Obtengo el id de la encuesta desde la base de datos
        $encuesta_id = $this->getEncuesta($campania_id, $persona_id, $hash);

        if ($encuesta_id === false) {
            $this->set('msj', 'Utilice el link que recibió por correo para responder la encuesta.');
            return $this->render('/Campanias/error_close', $this->layout);
        } elseif ($encuesta_id === true) {
            $this->set('msj', 'Gracias por responder la encuesta.');
            return $this->render('/Campanias/ok_close', $this->layout);
        }

        if ($this->request->is('post') || $this->request->is('put')) {
            // Inicia la transaccion SQL
            $dataSource = $this->Encuesta->getDataSource();
            $dataSource->begin();

            // Inserto la respuesta en la base de datos
            foreach ($this->request->data['Encuesta'] as $pregunta) {
                if (!empty($pregunta['valor'])) {
                    if ($pregunta['tipo'] == "simple" || $pregunta['tipo'] == "lista" || $pregunta['tipo'] == "texto") {
                        $respuesta = Sanitize::escape($pregunta['valor']);
                        $this->Encuesta->Query("INSERT INTO cam_encuestas_respuestas (fecha_carga, campania_id, persona_id, pregunta_id, respuesta) 
                                                VALUES('" . $now . "', " . $campania_id . ", " . $persona_id . ", " . $pregunta['pregunta'] . ", '" . trim($respuesta) . "')");
                    } elseif ($pregunta['tipo'] == "multiple" && is_array($pregunta['valor'])) {
                        $respuesta = Sanitize::escape($respuesta);
                        foreach ($pregunta['valor'] as $respuesta) {
                            $this->Encuesta->Query("INSERT INTO cam_encuestas_respuestas (fecha_carga, campania_id, persona_id, pregunta_id, respuesta) 
                                                    VALUES('" . $now . "', " . $campania_id . ", " . $persona_id . ", " . $pregunta['pregunta'] . ", '" . trim($respuesta) . "')");
                        }
                    }
                }
            }

            // Actualizo con la respuesta
            $this->Encuesta->Query("UPDATE cam_campanias_personas SET respuesta='" . $now . "' 
                                    WHERE campania_id=" . $campania_id . " AND persona_id=" . $persona_id . " AND respuesta IS NULL");

            // Termina la transaccion SQL
            $dataSource->commit();

            // Devuelvo el mensaje de gracias
            $this->set('msj', 'Gracias por responder la encuesta.');
            return $this->render('/Campanias/ok_close', $this->layout);
        }

        // Actualizo con el acceso
        $this->Encuesta->Query("UPDATE cam_campanias_personas SET acceso='" . $now . "'
                                WHERE campania_id=" . $campania_id . " AND persona_id=" . $persona_id . " AND acceso IS NULL");

        $this->set('encuesta_id', $campania_id);
        $this->set('persona_id', $persona_id);
        $this->set('hash', $hash);

        $preguntas = $this->Encuesta->Pregunta->find("all", array("conditions" => array("encuesta_id" => $encuesta_id)));
        $this->set('preguntas', $preguntas);
    }

    protected function getEncuesta($campania_id, $persona_id, $hash) {
        $check = $this->Encuesta->Query("SELECT c.encuesta_id, cp.respuesta
                                         FROM cam_campanias_personas cp
                                         JOIN cam_campanias c ON c.id=cp.campania_id
                                         WHERE cp.campania_id=" . $campania_id . " AND cp.persona_id=" . $persona_id);

        if (empty($check[0]['c']['encuesta_id'])) {
            return false;
        }
        if (!is_null($check[0]['cp']['respuesta'])) {
            return true;
        }
        return $check[0]['c']['encuesta_id'];
    }

    protected function checkURL($campania_id, $persona_id, $hash) {
        $hash1 = md5("GCBA|" . $campania_id . "|" . $persona_id);
        if (empty($campania_id) || empty($persona_id) || empty($hash)) {
            return false;
        }
        if ($hash1 != $hash) {
            return false;
        }
        return true;
    }

}
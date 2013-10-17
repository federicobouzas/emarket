<?php

class EventosController extends AppController {

    public function beforeFilter() {
        parent::beforeFilter();
        $this->Auth->allow('asistencia');
    }

    public function add($return = null) {
        $this->maint = getData('Eventos/EventosMaint');
        parent::add($return);
    }

    public function edit($id = null, $return = null) {
        $this->maint = getData('Eventos/EventosMaint');
        parent::edit($id, $return);
    }

    public function index($last = false) {
        $this->search_list = getData('Eventos/EventosSL');
        parent::index($last);
    }

    public function view($id = null, $return = null) {
        $this->maint = getData('Eventos/EventosMaint');
        parent::view($id, $return);
    }

    public function delete($id = null) {
        $cant = $this->Evento->Campania->find('count', array('conditions' => array('evento_id' => $id)));
        if ($cant > 0) {
            throw new MethodNotAllowedException(__('No se puede eliminar el evento, esta siendo utilizada por ' . $cant . ' campaña' . ($cant > 1 ? 's' : '') . '.'));
        }
        parent::delete($id);
    }

    public function asistencia($campania_id = null, $persona_id = null, $hash = null, $asistencia = null) {
        $now = date("Y-m-d H:i:s");

        // Chequeo la URL
        if (!$this->checkURL($campania_id, $persona_id, $hash, $asistencia)) {
            $this->set('msj', 'Utilice el link que recibió por correo para responder la encuesta.');
            return $this->render('/Campanias/error_close', $this->layout);
        }

        // Obtengo el id del evento desde la base de datos
        $evento_id = $this->getEvento($campania_id, $persona_id, $hash);

        if ($evento_id === false) {
            $this->set('msj', 'Utilice el link que recibió por correo para responder la encuesta.');
            return $this->render('/Campanias/error_close', $this->layout);
        }

        // Obtengo la asistencia previa guardada en la base
        $get_asistencia = $this->Evento->Query("SELECT asiste FROM cam_eventos_asistencias WHERE evento_id=" . $evento_id . " AND persona_id=" . $persona_id);

        if ($get_asistencia) {
            // Actualizo la asistencia si es distinta
            if ($get_asistencia[0]['cam_eventos_asistencias']['asiste'] != $asistencia) {
                $this->Evento->Query("UPDATE cam_campanias_personas SET acceso='" . $now . "'
                                      WHERE campania_id=" . $campania_id . " AND persona_id=" . $persona_id);
                // Actualizo con la asistencia
                $this->Evento->Query("UPDATE cam_eventos_asistencias SET fecha_carga='" . $now . "', asiste='" . $asistencia . "' 
                                      WHERE evento_id=" . $evento_id . " AND persona_id=" . $persona_id);
            }
            if ($asistencia == 'Si') {
                $this->set('msj', 'Gracias por participar del evento, lo esperamos.');
                return $this->render('/Campanias/ok_close', $this->layout);
            } else {
                $this->set('msj', 'Gracias por responder, lo esperamos el próximo evento.');
                return $this->render('/Campanias/ok_close', $this->layout);
            }
        }

        // Actualizo con el acceso
        $this->Evento->Query("UPDATE cam_campanias_personas SET acceso='" . $now . "'
                              WHERE campania_id=" . $campania_id . " AND persona_id=" . $persona_id . " AND acceso IS NULL");

        // Actualizo con la asistencia
        $this->Evento->Query("INSERT INTO cam_eventos_asistencias (evento_id, persona_id, fecha_carga, asiste)
                              VALUES (" . $evento_id . ", " . $persona_id . ", '" . $now . "', '" . $asistencia . "')");

        $this->set('encuesta_id', $campania_id);
        $this->set('persona_id', $persona_id);
        $this->set('hash', $hash);
        $this->set('asistencia', $asistencia);

        if ($asistencia == 'Si') {
            $this->set('msj', 'Gracias por participar del evento, lo esperamos.');
            return $this->render('/Campanias/ok_close', $this->layout);
        } else {
            $this->set('msj', 'Gracias por responder, lo esperamos el próximo evento.');
            return $this->render('/Campanias/ok_close', $this->layout);
        }
    }

    protected function getEvento($campania_id, $persona_id, $hash) {
        $check = $this->Evento->Query("SELECT c.evento_id, cp.acceso
                                       FROM cam_campanias_personas cp
                                       JOIN cam_campanias c ON c.id=cp.campania_id
                                       WHERE cp.campania_id=" . $campania_id . " AND cp.persona_id=" . $persona_id); 
        if (empty($check[0]['c']['evento_id'])) {
            return false;
        }        
        return $check[0]['c']['evento_id'];
    }

    protected function checkURL($campania_id, $persona_id, $hash, $asistencia) {
        $hash1 = md5("GCBA|" . $campania_id . "|" . $persona_id);
        if (empty($campania_id) || empty($persona_id) || empty($hash) || empty($asistencia)) {
            return false;
        }
        if ($hash1 != $hash) {
            return false;
        }
        if ($asistencia != 'Si' && $asistencia != 'No') {
            return false;
        }
        return true;
    }

}
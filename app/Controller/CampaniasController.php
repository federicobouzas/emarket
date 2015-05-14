<?php

class CampaniasController extends AppController {

    public function beforeFilter() {
        parent::beforeFilter();
        $this->Auth->allow('lectura', 'unsubscribe', 'followLink');
    }

    public function add($return = null) {
        if ($this->request->is('post')) {
            if (!empty($this->request->data['Campania']['personas_edad']['desde']) && !empty($this->request->data['Campania']['personas_edad']['hasta'])) {
                $this->request->data['Campania']['personas_edad'] = $this->request->data['Campania']['personas_edad']['desde'] . "," . $this->request->data['Campania']['personas_edad']['hasta'];
            } else {
                unset($this->request->data['Campania']['personas_edad']);
            }
            
            if (empty($this->request->data['Campania']['personas_sexo'])) {
                unset($this->request->data['Campania']['personas_sexo']);
            }
        }

        $this->maint = Parse::getData('Campanias/CampaniasMaint');
        parent::add($return);
    }

    public function edit($id = null, $return = null) {
        // Verifico que exista la campaña
        $this->Campania->id = $id;
        if (!$this->Campania->exists()) {
            throw new NotFoundException(__('Registro inexistente.'));
        }

        // Obtengo el estado de la campaña
        if ($this->Campania->field('estado') != 'Sin enviar') {
            throw new MethodNotAllowedException(__('No se puede editar la campaña porque ya ha sido enviada.'));
        }

        if ($this->request->is('post')) {
            if (!empty($this->request->data['Campania']['personas_edad']['desde']) && !empty($this->request->data['Campania']['personas_edad']['hasta'])) {
                $this->request->data['Campania']['personas_edad'] = $this->request->data['Campania']['personas_edad']['desde'] . "," . $this->request->data['Campania']['personas_edad']['hasta'];
            } else {
                unset($this->request->data['Campania']['personas_edad']);
            }
            
            if (empty($this->request->data['Campania']['personas_sexo'])) {
                unset($this->request->data['Campania']['personas_sexo']);
            }
        }

        $this->maint = Parse::getData('Campanias/CampaniasMaint');
        parent::edit($id, $return);
    }

    public function index($last = false) {
        $this->search_list = Parse::getData('Campanias/CampaniasSL');
        parent::index($last);
    }

    public function view($id = null, $return = null) {
        $this->maint = Parse::getData('Campanias/CampaniasMaint');
        parent::view($id, $return);
    }

    public function delete($id = null, $return = null) {
        // Verifico que exista la campaña
        $this->Campania->id = $id;
        if (!$this->Campania->exists()) {
            throw new NotFoundException(__('Registro inexistente.'));
        }

        // Obtengo el estado de la campaña
        if ($this->Campania->field('estado') != 'Sin enviar') {
            throw new MethodNotAllowedException(__('No se puede eliminar la campaña porque ya ha sido enviada.'));
        }

        parent::delete($id, $return);
    }

    public function report($id = null) {
        $sql_campania = array(
            "conditions" => array(
                "Campania.estado" => "Enviada"
            ),
            "order" => array("Campania.nombre ASC")
        );
        $campanias = $this->Campania->find("all", $sql_campania);
        $this->set('campanias', $campanias);
        $this->set('id', $id);
    }

    public function reporteRebotes($id = null) {
        // Verifico que exista la campaña
        $this->Campania->id = $id;
        if (!$this->Campania->exists()) {
            throw new NotFoundException(__('Registro inexistente.'));
        }

        // Incluye la libreria PHPExcel y la clase Bounces
        App::uses('PHPExcel', 'Lib');
        App::uses('Bounces', 'Lib');
        
        $bounce = new Bounces;
        
        $objPHPExcel = new PHPExcel();
        $objPHPExcel->getProperties()->setCreator("Framework");
        $objPHPExcel->setActiveSheetIndex(0);

        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('A1', 'Email');
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('B1', 'Tipo Error');
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('C1', 'Descripción');

        $sql = "SELECT p.email, cp.error, cp.error_tipo 
                FROM cam_campanias_personas cp 
                JOIN per_personas p ON p.id=cp.persona_id 
                WHERE cp.campania_id=" . $id . " AND error IS NOT NULL";
        $rows = $this->Campania->Query($sql);
        
        $i = 2;
        foreach ($rows as $row) {
            $error = $bounce->getErrorByCode($row['cp']['error']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('A' . $i, $row['p']['email']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('B' . $i, $row['cp']['error_tipo']);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('C' . $i, $error['descripcion']);
            $i++;
        }

        $objPHPExcel->getActiveSheet()->setTitle('Rebotes Campaña');

        $filename = "Rebotes Campaña -" . md5(time() . rand());

        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="' . $filename . '.xls"');
        header('Cache-Control: max-age=0');

        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        $objWriter->save('php://output');
        die;
    }

    public function send($id = null, $email = null) {
        // Verifico que exista la campaña
        $this->Campania->id = $id;
        if (!$this->Campania->exists()) {
            throw new NotFoundException(__('Registro inexistente.'));
        }

        $sql = "SELECT Campania.*
                FROM cam_campanias AS Campania 
                WHERE Campania.id = " . $id;
        $query = $this->Campania->Query($sql);

        if (empty($query)) {
            $this->Session->setFlash(__('No se pudo enviar la campaña'));
            $this->redirect(array('action' => 'index'));
        }

        $campania = $query[0]['Campania'];

        $replace = array(
            "NOMBRE",
            "APELLIDO",
            $this->Campania->generateUnsubscribeLink($campania['id'], 0, '')
        );

        $email_data = array(
            "destino" => $email,
            "server_id" => $campania['server_id']
        );

        $asunto = $this->Campania->replaceVars($campania['asunto_email'], $replace);
        $cuerpo = $this->Campania->replaceVars(htmlspecialchars_decode($campania['cuerpo_email']), $replace);

        if ($campania['tipo'] == "Encuesta") {
            $email_data["asunto"] = $this->Campania->Encuesta->replaceVars($campania['id'], 0, '', $asunto);
            $email_data["cuerpo"] = $this->Campania->Encuesta->replaceVars($campania['id'], 0, '', $cuerpo);
        } elseif ($campania['tipo'] == "Evento") {
            $email_data["asunto"] = $this->Campania->Evento->replaceVars($campania['id'], 0, '', $asunto);
            $email_data["cuerpo"] = $this->Campania->Evento->replaceVars($campania['id'], 0, '', $cuerpo);
        } else {
            $email_data["asunto"] = $asunto;
            $email_data["cuerpo"] = $cuerpo;
        }

        $this->loadModel('FmwMessaging.Mensaje');

        $msj = new Mensaje();
        $msj->send($email_data);

        $this->Session->setFlash(__('La campaña fue enviada correctamente'));
        $this->redirect(array('action' => 'index', 'last'));
    }

    public function lectura($campania_id = null, $persona_id = null, $hash = null) {
        $now = date("Y-m-d H:i:s");

        // Chequeo la URL
        $this->checkURL($campania_id, $persona_id, $hash);

        // Actualizo con la lectura
        $this->Campania->Query("UPDATE cam_campanias_personas SET lectura='" . $now . "'
                                WHERE campania_id=" . $campania_id . " AND persona_id=" . $persona_id . " AND lectura IS NULL");

        $this->set('data', '');
        return $this->render('/ajax', 'ajax');
    }

    public function unsubscribe($campania_id = null, $persona_id = null, $hash = null) {
        // Chequeo la URL
        $this->checkURL($campania_id, $persona_id, $hash);

        // Actualizo a la persona
        $this->Campania->Query("UPDATE per_personas SET activa='No' WHERE id=" . $persona_id);
    }

    public function followLink($link_id = null, $persona_id = null, $hash = null) {
        if (empty($link_id) || empty($persona_id) || empty($hash)) {
            throw new BadRequestException('Utilice los links que recibió por correo.');
        }

        // Obtengo el link y redirijo
        $get_link = $this->Campania->Query("SELECT campania_id, link FROM cam_links WHERE id=" . $link_id);

        // Chequeo el hash
        $hash1 = md5("GCBA|" . $get_link[0]['cam_links']['campania_id'] . "|" . $persona_id);
        if ($hash1 != $hash) {
            throw new BadRequestException('Utilice los links que recibió por correo.');
        }

        // Inserto el acceso
        $this->Campania->Query("INSERT INTO cam_links_personas (link_id, persona_id, fecha_acceso) 
                                                        VALUES (" . $link_id . ", " . $persona_id . ", '" . date("Y-m-d H:i:s") . "')");

        // Redirijo
        $this->redirect($get_link[0]['cam_links']['link']);
    }

    protected function checkURL($campania_id, $persona_id, $hash) {
        $hash1 = md5("GCBA|" . $campania_id . "|" . $persona_id);

        if (empty($campania_id) || empty($persona_id) || empty($hash)) {
            throw new BadRequestException('Utilice el link que recibió por correo para responder sobre su asistencia.');
        }

        if ($hash1 != $hash) {
            throw new BadRequestException('Utilice el link que recibió por correo para responder sobre su asistencia.');
        }
    }
    
    public function wizard() {
        
    }

}
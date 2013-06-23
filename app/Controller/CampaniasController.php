<?php

class CampaniasController extends AppController {

    public function beforeFilter() {
        parent::beforeFilter();
        $this->Auth->allow('lectura', 'unsubscribe', 'followLink');
    }

    public function add() {
        /*
          App::import('Vendor', 'simple_html_dom');
          $html_str = '<meta content="text/html; charset=iso-8859-1" http-equiv="Content-Type" /><title>comuna4</title> <style type="text/css">&lt;!-- .style1 {font-size: 18px} --&gt; </style> <table align="center" border="0" cellpadding="0" cellspacing="0" width="620"><tbody><tr><td><img height="15" src="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/sombra_top.jpg" width="621" /></td></tr><tr><td><table align="center" border="0" cellpadding="0" cellspacing="0" width="620"><tbody><tr><td background="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/sombra_iz01b.jpg" width="10"></td><td><table border="0" cellpadding="0" cellspacing="0" width="600"><tbody><tr><td><a href="http://www.buenosaires.gob.ar/" target="_blank"><img alt="" border="0" height="75" src="http://www.eideos.com.ar/email/files/wysiwyg/header1.jpg" width="602" /></a></td></tr><tr><td bgcolor="#cccccc" height="50" style="padding:0px 21px;"><p align="left" style="font-size:14px;font-family:Arial, Helvetica, sans-serif;"><br /><strong><a class="style1" href="http://www.buenosaires.gov.ar/areas/descentralizacion/" style="color:#000000;text-decoration:none;">Comuna 4</a><br /></strong><a href="http://www.buenosaires.gov.ar/areas/jef_gabinete/atencion_ciudadana/?menu_id=24230" style="color:#000000;text-decoration:none;">La Boca, Barracas, Parque Patricios, y Nueva Pompeya</a></p></td></tr><tr><td bgcolor="#ffffff" height="21" style="padding:0px 0px 0px 21px;font-size:11px;"><div align="left"><span style="font-family:Arial, Helvetica, sans-serif;">Gacetilla - 6 de marzo de 2013</span> </div></td></tr><tr><td background="Historial Boletines y Gacetillas/ceci/Desktop/Dropbox/gov.ar/gov.ar/disenio/jpg de nuevos boletines/boletines/imagenes/globa.jpg" bgcolor="#FFFFFF" height="226" width="600"><div align="center"><img alt="" height="166" src="http://www.eideos.com.ar/email/files/wysiwyg/cgpc%204/644378_575335909143633_2098529071_n.jpg" width="552" /></div></td></tr><tr><td height="106"><table border="0" cellpadding="0" cellspacing="0" width="600"><tbody><tr><td height="13" style="padding:0px 21px;"><div align="left"><span style="font-family:Arial, Helvetica, sans-serif;font-size:14px;font-weight:bold;font-size:14px;">Puesta en valor del Espacio Verde Magaldi</span></div></td></tr><tr><td height="15" style="padding:0px 21px;"><div align="left"><span style="font-family:Arial, Helvetica, sans-serif;"><a href="#" style="font-family:Arial, Helvetica, sans-serif;text-decoration:none;font-size:13px;color:#666;font-weight:bold;text-decoration:none;">Comenzarán los trabajos de obra</a></span></div></td></tr><tr><td style="padding:2px 21px;"><div align="justify"><p style="font-family:Arial, Helvetica, sans-serif;font-size:12px;">Les contamos a los vecinos que comenzarán los trabajos de puesta en valor del Espacio Verde Agustín Magaldi, en el barrio de Barracas.</p><p style="font-family:Arial, Helvetica, sans-serif;font-size:12px;">Las obras consisten en reformular los espacios de esparcimiento y recreación, con la incorporación de nuevo mobiliario urbano y espacios de juego. </p><p style="font-family:Arial, Helvetica, sans-serif;font-size:12px;">Las pérgolas de hierro galvanizado brindarán sombra y evitarán la apropiación del espacio por autos y motos, también habrá un espacio semicubierto donde se podrán organizar desde bailes hasta reuniones vecinales. En el playón central se ubicarán mesas y sillas, espacios para jugar al ajedrez y sector de ping-pong con una pequeña tribuna. Se incorporarán también cestos de residuos, bebederos y canillas para riego.Se adaptarán para niños los juegos existentes, con su perímetro de reja y su acceso actual, y se construirá un nuevo espacio para triciclos. Además, se propone el aumento de iluminación reemplazando la existente, y se agregarán a los sectores de juegos, reflectores con luz especial.</p></div></td></tr><tr><td height="15" style="padding:0px 21px;"><div align="left"><span style="font-family:Arial, Helvetica, sans-serif;"><a href="http://comunas.buenosaires.gob.ar/novedades/comuna-4-invitacion-del-museo-benito-quinquela-martin/" style="font-family:Arial, Helvetica, sans-serif;font-size:12px;font-weight:bold;color:#000;text-decoration:none;">[+]</a></span></div></td></tr></tbody></table></td></tr></tbody></table><img height="8" src="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/linea_puntos.jpg" width="600" /><table border="0" cellpadding="0" cellspacing="0" width="600"><tbody><tr><td><img height="9" src="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/barra_pie.jpg" width="602" /></td></tr><tr><td bgcolor="#FFD300"><table border="0" cellpadding="0" cellspacing="0" width="600"><tbody><tr><td><a href="mailto:comuna4@buenosaires.gob.ar"><img align="right" alt="#" border="0" height="88" src="http://www.eideos.com.ar/email/files/wysiwyg/cgpc%204/c4_JApreda_mapa.jpg" width="157" /></a></td><td><a href="http://www.buenosaires.gob.ar/areas/jef_gabinete/atencion_ciudadana/?menu_id=24230"><img align="right" border="0" height="89" src="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/pie_atencion.jpg" width="298" /></a></td><td><img align="right" height="89" src="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/piense_antes.jpg" width="147" /></td></tr></tbody></table></td></tr><tr><td background="Historial Boletines y Gacetillas/ceci/Desktop/Dropbox/gov.ar/gov.ar/disenio/jpg de nuevos boletines/boletines/imagenes/pie.jpg" height="25"><table background="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/pie.jpg" border="0" cellpadding="0" cellspacing="0" width="602"><tbody><tr><td style="padding:5px 21px;" width="448"><div align="left"><span style="font-family:Arial, Helvetica, sans-serif;font-size:10px;color:#808080;"><a href="#URL_UNSUBSCRIBE#" style="font-family:Arial, Helvetica, sans-serif;font-size:10px;color:#808080;" target="_blank">Suscribir / Borrar suscripción</a></span></div></td><td style="padding:2px 0px 0px 0px;" width="78"><a href="http://www.facebook.com/http://www.facebook.com/home.php?#!/bacomuna4"><img align="right" border="0" height="21" src="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/fb.jpg" width="78" /></a></td><td style="padding:2px 0px 0px 0px;" width="74"><a href="https://twitter.com/bacomuna4"><img align="right" border="0" height="21" src="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/twitter.jpg" width="74" /></a></td></tr></tbody></table></td></tr></tbody></table></td><td background="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/sombra_de01a.jpg" width="10"></td></tr></tbody></table></td></tr><tr><td><img src="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/sombra_bottom.jpg" width="620" /></td></tr></tbody></table>';
          $html = str_get_html(html_entity_decode($html_str));
          foreach ($html->find('a') as $element) {
          debug($element->href);
          }
          die;
         */

        if ($this->request->is('post')) {
            if (!empty($this->request->data['Campania']['personas_edad']['desde']) && !empty($this->request->data['Campania']['personas_edad']['hasta'])) {
                $this->request->data['Campania']['personas_edad'] = $this->request->data['Campania']['personas_edad']['desde'] . "," . $this->request->data['Campania']['personas_edad']['hasta'];
            } else {
                unset($this->request->data['Campania']['personas_edad']);
            }
        }

        $this->maint = getData('Campanias/CampaniasMaint');
        parent::add();
    }

    public function edit($id = null) {
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
            $this->request->data['Campania']['personas_edad'] = $this->request->data['Campania']['personas_edad']['desde'] . "," . $this->request->data['Campania']['personas_edad']['hasta'];
        }

        $this->maint = getData('Campanias/CampaniasMaint');
        parent::edit($id);
    }

    public function index($last = false) {
        $this->search_list = getData('Campanias/CampaniasSL');
        parent::index($last);
    }

    public function view($id = null) {
        $this->maint = getData('Campanias/CampaniasMaint');
        parent::view($id);
    }

    public function delete($id = null) {
        // Verifico que exista la campaña
        $this->Campania->id = $id;
        if (!$this->Campania->exists()) {
            throw new NotFoundException(__('Registro inexistente.'));
        }

        // Obtengo el estado de la campaña
        if ($this->Campania->field('estado') != 'Sin enviar') {
            throw new MethodNotAllowedException(__('No se puede eliminar la campaña porque ya ha sido enviada.'));
        }

        parent::delete($id);
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
        $cuerpo = $this->Campania->replaceVars($campania['cuerpo_email'], $replace);

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

        $this->loadModel('Messaging.Mensaje');

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

}
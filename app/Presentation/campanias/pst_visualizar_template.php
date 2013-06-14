<?php

App::uses('Presentation', 'Presentation');
App::uses('Campania', 'Model');

class pst_visualizar_template extends Presentation {

    public function ajaxGetHTML($params) {
        if (empty($params->campania)) {
            return "";
        }
        
        $model_campania = new Campania();
        $db = ConnectionManager::getDataSource('default');

        $info = $db->Query("SELECT id, tipo, cuerpo_email FROM cam_campanias WHERE id=" . $params->campania);
        $campania = $info[0]['cam_campanias'];
        
        $replace = array(
            "NOMBRE",
            "APELLIDO",
            $model_campania->generateUnsubscribeLink($campania['id'], 0, '')
        );
        
        $cuerpo = $model_campania->replaceVars($campania['cuerpo_email'], $replace);
        if ($campania['tipo'] == "Encuesta") {
            $cuerpo = $model_campania->Encuesta->replaceVars($campania['id'], 0, '', $cuerpo);
        } elseif ($campania['tipo'] == "Evento") {
            $cuerpo = $model_campania->Evento->replaceVars($campania['id'], 0, '', $cuerpo);
        }
        
        return $cuerpo;
    }

}

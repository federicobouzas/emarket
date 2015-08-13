<?php

App::uses('Presentation', 'Lib');
App::import('Vendor', 'funciones_app');

class pst_cantidad_personas extends Presentation {

    public function __construct($settings) {
        parent::__construct($settings);
        $this->js_initial = "cantidad_personas_init";
    }

    public function jsIncludes() {
        return array("presentation/campanias/cantidad_personas.js");
    }

    public function renderMaintForm() {
        return $this->renderReadOnly();
    }

    public function renderReadOnly() {
        $val = $this->getValue();
        $html = '<div id="box' . $this->id . '" class="input ' . $this->type . ' ' . $this->required . '">';
        $html.= '<label for="' . $this->id . '">' . $this->label . '</label>';
        $html.= '<input type="hidden" name="' . $this->generateName() . '" id="' . $this->generateID() . '" value="' . $val . '" />';
        $html.= '<a class="k-button" href="javascript:void(0);" id="' . $this->id . 'Button">';
        $html.= '<span class="k-icon k-i-refresh"></span>';
        $html.= '</a>';
        $html.= '<span id="' . $this->id . 'Number"></span>';
        $html.= '</div>';
        return $html;
    }

    public function ajax_calcular_cantidad($params) {
        return getPersonasFromParams($params);
    }

    public function ajax_get_cantidad_enviada($params) {
        if (empty($params->campania_id)) {
            return 0;
        }
        $db = ConnectionManager::getDataSource('default');
        $count = $db->Query("SELECT COUNT(*) AS cant FROM cam_campanias_personas WHERE campania_id=" . $params->campania_id);
        return $count[0][0]['cant'];
    }

}

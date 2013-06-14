<?php

App::uses('Presentation', 'Presentation');

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

    public function ajaxCalcularCantidad($params) {
        $where = "";
        if (!empty($params->sexo)) {
            $where.= " AND sexo='" . $params->sexo . "' ";
        }
        if (!empty($params->comuna) && is_numeric($params->comuna)) {
            $where.= " AND comuna=" . $params->comuna . " ";
        }
        if (!empty($params->barrio)) {
            $where.= " AND barrio='" . $params->barrio . "' ";
        }
        if (!empty($params->edad_hasta) && is_numeric($params->edad_hasta)) {
            $where.= " AND fecha_nacimiento >= '" . (date("Y") - $params->edad_hasta) . "-" . date("m") . "-" . date("d") . "' ";
        }
        if (!empty($params->edad_desde) && is_numeric($params->edad_desde)) {
            $where.= " AND fecha_nacimiento <= '" . (date("Y") - $params->edad_desde) . "-" . date("m") . "-" . date("d") . "' ";
        }

        $db = ConnectionManager::getDataSource('default');
        $count = $db->Query("SELECT COUNT(*) as cant FROM per_personas WHERE activa='Si'" . $where);
        return $count[0][0]['cant'];
    }

}

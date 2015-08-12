<?php

App::uses('Presentation', 'Lib');

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
        $conditions = [];
        $joins = [];
        if (!empty($params->sexo)) {
            $conditions["Persona.sexo"] = $params->sexo;
        }
        if (!empty($params->comuna)) {
            $conditions["Persona.comuna"] = explode(",", $params->comuna);
        }
        if (!empty($params->barrio)) {
            $conditions["Persona.barrio"] = explode(",", $params->barrio);
        }
        if (!empty($params->poblacion)) {
            $conditions["per_personas_poblaciones.poblacion_id"] = explode(",", $params->poblacion);
            $joins[] = ['table' => 'per_personas_poblaciones', 'conditions' => ['per_personas_poblaciones.persona_id = Persona.id']];
        }
        if (!empty($params->edad_hasta) && is_numeric($params->edad_hasta)) {
            $conditions["Persona.fecha_nacimiento >"] = (date("Y") - (int) $params->edad_hasta - 1) . "-" . date("m") . "-" . date("d");
        }
        if (!empty($params->edad_desde) && is_numeric($params->edad_desde)) {
            $conditions["Persona.fecha_nacimiento <="] = (date("Y") - (int) $params->edad_desde) . "-" . date("m") . "-" . date("d");
        }
        App::uses("Persona", "Model");
        $personaObj = new Persona();
        return $personaObj->find('count', ['conditions' => $conditions, 'joins' => $joins]);
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

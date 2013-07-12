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
        $join = "";
        if (!empty($params->sexo)) {
            $where.= " AND per_personas.sexo='" . $params->sexo . "' ";
        }
        if (!empty($params->comuna)) {
            $where.= " AND per_personas.comuna IN (" . $params->comuna . ") ";
        }
        if (!empty($params->barrio)) {
            $where.= " AND per_personas.barrio IN ('" . implode("','", explode(",", $params->barrio)) . "') ";
        }
        if (!empty($params->poblacion)) {
            $join.= " JOIN per_personas_poblaciones ON per_personas_poblaciones.persona_id=per_personas.id ";
            $where.= " AND per_personas_poblaciones.poblacion_id IN (" . $params->poblacion . ") ";
        }
        if (!empty($params->edad_hasta) && is_numeric($params->edad_hasta)) {
            $where.= " AND per_personas.fecha_nacimiento > '" . (date("Y") - $params->edad_hasta - 1) . "-" . date("m") . "-" . date("d") . "' ";
        }
        if (!empty($params->edad_desde) && is_numeric($params->edad_desde)) {
            $where.= " AND per_personas.fecha_nacimiento <= '" . (date("Y") - $params->edad_desde) . "-" . date("m") . "-" . date("d") . "' ";
        }

        $db = ConnectionManager::getDataSource('default');
        $count = $db->Query("SELECT COUNT(DISTINCT per_personas.id) AS cant FROM per_personas " . $join . " 
                             WHERE per_personas.activa='Si'" . $where);
        return $count[0][0]['cant'];
    }

    public function ajaxCantidadEnviada($params) {
        if (empty($params->campania_id)) {
            return 0;
        }

        $db = ConnectionManager::getDataSource('default');
        $count = $db->Query("SELECT COUNT(*) AS cant FROM cam_campanias_personas WHERE campania_id=" . $params->campania_id);
        return $count[0][0]['cant'];
    }

}

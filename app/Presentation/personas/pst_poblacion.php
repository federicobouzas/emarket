<?php

App::uses('pst_select', 'Presentation');

class pst_poblacion extends pst_select {

    public function objectDBQuery() {
        if (isset($this->field) && $this->value != "") {
            return array($this->field . " IN (SELECT persona_id FROM per_personas_poblaciones WHERE poblacion_id=" . $this->value . ")");
        }
        return parent::objectDBQuery();
    }

}

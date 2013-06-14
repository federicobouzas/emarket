<?php

App::uses('pst_selectarray', 'Presentation');

class pst_tipo_pregunta extends pst_selectarray {

    public function __construct($settings) {
        $this->options = array(
            'lista' => 'Lista',
            'simple' => 'Opciones Simple',
            'multiple' => 'Opciones Múltiple',
            'texto' => 'Texto Libre'
        );
        parent::__construct($settings);
    }

}
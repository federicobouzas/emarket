<?php

App::uses('pst_selectarray', 'Presentation');

class pst_tipo_envio extends pst_selectarray {

    public function __construct($settings) {
        $this->options = array(
            'sexo' => 'Sexo',
            'edad' => 'Edad',
            'poblaciones' => 'Poblaciones',
        );
        parent::__construct($settings);
        $this->js_initial = "tipo_envio_init";
    }

    public function jsIncludes() {
        return array("presentation/campanias/tipo_envio.js");
    }
    
}
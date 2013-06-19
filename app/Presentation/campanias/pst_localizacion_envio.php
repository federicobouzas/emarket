<?php

App::uses('pst_selectarray', 'Presentation');

class pst_localizacion_envio extends pst_selectarray {

    public function __construct($settings) {
        $this->options = array(
            'comunas' => 'Comunas',
            'barrios' => 'Barrios',
        );
        parent::__construct($settings);
        $this->js_initial = "localizacion_envio_init";
    }

    public function jsIncludes() {
        return array("presentation/campanias/localizacion_envio.js");
    }
    
}
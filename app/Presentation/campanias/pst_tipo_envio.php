<?php

App::uses('pst_selectarray', 'Presentation');

class pst_tipo_envio extends pst_selectarray {

    public function __construct($settings) {
        $this->options = array(
            'sexo' => 'Sexo',
            'edad' => 'Edad',
            'comunas' => 'Comunas',
            'barrios' => 'Barrios',
            'poblaciones' => 'Poblaciones',
        );
        parent::__construct($settings);
    }
    
}
<?php

App::uses('pst_selectarray', 'Presentation');

class pst_estado_campania extends pst_selectarray {

    public function __construct($settings) {
        $this->options = array(
            'Sin enviar' => 'Sin enviar',
            'Enviada' => 'Enviada'
        );
        parent::__construct($settings);
    }

}
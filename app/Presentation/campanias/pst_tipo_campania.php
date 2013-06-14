<?php

App::uses('pst_selectarray', 'Presentation');

class pst_tipo_campania extends pst_selectarray {

    public function __construct($settings) {
        $this->options = array(
            'Newsletter' => 'Newsletter',
            'Encuesta' => 'Encuesta',
            'Evento' => 'Evento'
        );
        parent::__construct($settings);
    }

}
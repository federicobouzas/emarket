<?php

App::uses('pst_checkbox', 'Presentation');

class pst_comunas_checkbox extends pst_checkbox {

    public function __construct($settings) {
        $this->options = array();
        for ($i = 1; $i <= 15; $i++) {
            $this->options[$i] = 'Comuna ' . $i;
        }
        parent::__construct($settings);
    }

}
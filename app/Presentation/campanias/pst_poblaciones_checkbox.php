<?php

App::uses('pst_checkbox', 'Presentation');

class pst_poblaciones_checkbox extends pst_checkbox {

    public function __construct($settings) {
        $db = ConnectionManager::getDataSource('default');
        $poblaciones = $db->Query("SELECT * FROM per_poblaciones WHERE activa='Si'");
        
        $this->options = array();
        foreach ($poblaciones as $poblacion) {
            $this->options[$poblacion['per_poblaciones']['id']] = $poblacion['per_poblaciones']['nombre'];
        }
        parent::__construct($settings);
    }

}
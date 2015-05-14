<?php

/* GENERADO AUTOMATICAMENTE */

App::uses('AbstractData', 'Lib');

class EncuestasSL extends AbstractData {

protected $data = array (
    'translatepath' => 'encuestas.search_list',
    'title' => '',
    'filters' => 
    array (
        0 => 
        array (
            'name' => 'Encuesta.nombre',
            'label' => 'Nombre',
        ),
    ),
    'columns' => 
    array (
        0 => 
        array (
            'name' => 'Encuesta.nombre',
            'label' => 'Nombre',
        ),
        1 => 
        array (
            'name' => 'Encuesta.id',
            'label' => 'Probar Encuesta',
            'presentation' => 'ENCUESTAS::RESPONDER_ENCUESTA',
        ),
    ),
);

}

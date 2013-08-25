<?php

/* GENERADO AUTOMATICAMENTE */
/* 25/08/2013 18:11:06 */

App::uses('AbstractData', 'Lib');

class EncuestasSL extends AbstractData {

protected $data =
array (
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

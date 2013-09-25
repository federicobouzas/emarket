<?php

/* GENERADO AUTOMATICAMENTE */
/* 25/09/2013 14:45:48 */

App::uses('AbstractData', 'Lib');

class PoblacionsSL extends AbstractData {

protected $data =
array (
    'actions' => 
    array (
        'V' => 'view',
        'E' => 'edit',
    ),
    'filters' => 
    array (
        0 => 
        array (
            'name' => 'Poblacion.nombre',
            'label' => 'Nombre',
        ),
        1 => 
        array (
            'name' => 'activa',
            'label' => 'Activa',
            'presentation' => 'SINO',
        ),
    ),
    'columns' => 
    array (
        0 => 
        array (
            'label' => '',
            'fields' => 
            array (
                0 => 
                array (
                    'name' => 'Poblacion.nombre',
                    'label' => 'Nombre',
                ),
            ),
        ),
        1 => 
        array (
            'label' => '',
            'fields' => 
            array (
                0 => 
                array (
                    'name' => 'activa',
                    'label' => 'Activa',
                    'presentation' => 'SINO',
                ),
            ),
        ),
    ),
);

}

<?php

/* GENERADO AUTOMATICAMENTE */
/* 17/10/2013 17:22:17 */

App::uses('AbstractData', 'Lib');

class PoblacionsSL extends AbstractData {

protected $data =
array (
    'actions' => 
    array (
        'V' => 
        array (
            0 => 'view',
        ),
        'E' => 
        array (
            0 => 'edit',
        ),
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

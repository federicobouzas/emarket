<?php

/* GENERADO AUTOMATICAMENTE */
/* 16/08/2013 10:51:07 */

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

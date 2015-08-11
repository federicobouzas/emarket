<?php

/* GENERADO AUTOMATICAMENTE */

App::uses('AbstractData', 'Lib');

class PoblacionesSL extends AbstractData {

protected $data = array (
    'translatepath' => NULL,
    'title' => '',
    'actions' => 
    array (
        0 => 
        array (
            'op' => 'V',
            'action' => 'view',
        ),
        1 => 
        array (
            'op' => 'E',
            'action' => 'edit',
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
            'sortfield' => '',
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
            'sortfield' => '',
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

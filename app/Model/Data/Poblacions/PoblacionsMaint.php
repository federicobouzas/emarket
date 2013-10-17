<?php

/* GENERADO AUTOMATICAMENTE */
/* 17/10/2013 17:22:17 */

App::uses('AbstractData', 'Lib');

class PoblacionsMaint extends AbstractData {

protected $data =
array (
    'data' => 
    array (
        0 => 
        array (
            'type' => 'fieldset',
            'fields' => 
            array (
                0 => 
                array (
                    'name' => 'fecha_carga',
                    'label' => 'Fecha de Carga',
                    'presentation' => 'DATETIME',
                    'classparams' => '{\'force\':true}',
                    'isvisible' => false,
                    'actions' => 'A',
                ),
                1 => 
                array (
                    'name' => 'user_id',
                    'label' => 'Usuario Carga',
                    'presentation' => 'USER',
                    'classparams' => '{\'force\':true}',
                    'isvisible' => false,
                    'actions' => 'A',
                ),
                2 => 
                array (
                    'name' => 'nombre',
                    'label' => 'Nombre',
                    'size' => 100,
                ),
                3 => 
                array (
                    'name' => 'activa',
                    'label' => 'Activa',
                    'presentation' => 'SINO',
                    'initialvalue' => 'Si',
                ),
            ),
            'title' => 'Descripción de la Población',
        ),
    ),
);

}

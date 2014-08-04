<?php

App::uses('Rol', 'FmwAcceso.Model');

class Approl extends Rol {

    public $plugin = null;
    public $useTable = 'rols';
    public $hasAndBelongsToMany = array(
        'Permiso' => array(
            'className' => 'FmwAcceso.Permiso',
            'joinTable' => 'adm_permisos_rols',
            'foreignKey' => 'rol_id',
            'associationForeignKey' => 'permiso_id',
            'unique' => true
        ),
        'Button' => array(
            'className' => 'FmwAcceso.Button',
            'joinTable' => 'adm_buttons_rols',
            'foreignKey' => 'rol_id',
            'associationForeignKey' => 'button_id',
            'unique' => true
        ),
        'Poblacion' => array(
            'className' => 'Poblacion',
            'joinTable' => 'per_poblaciones_rols',
            'foreignKey' => 'rol_id',
            'associationForeignKey' => 'poblacion_id',
            'unique' => true
        )
    );

}
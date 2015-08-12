<?php

class Poblacion extends AppModel {

    public $label = 'Poblaciones';
    public $tablePrefix = 'per_';
    public $useTable = 'poblaciones';
    public $displayField = 'nombre';
    public $recursive = -1;
    public $hasAndBelongsToMany = array(
        'Persona' => array(
            'className' => 'Persona',
            'joinTable' => 'per_personas_poblaciones',
            'foreignKey' => 'poblacion_id',
            'associationForeignKey' => 'persona_id',
            'unique' => true
        ),
    );
    public $validate = array(
        'nombre' => array(
            'required' => array(
                'rule' => array('notEmpty'),
                'message' => 'El nombre de la población es requerido'
            )
        ),
        'activa' => array(
            'required' => array(
                'rule' => array('notEmpty'),
                'message' => 'Debe indicar si la población está activa'
            )
        ),
    );

}
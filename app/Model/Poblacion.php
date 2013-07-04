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
        'Campania' => array(
            'className' => 'Campania',
            'joinTable' => 'cam_campanias_poblaciones',
            'foreignKey' => 'poblacion_id',
            'associationForeignKey' => 'campania_id',
            'unique' => true
        ),
            /*
              'Approl' => array(
              'className' => 'Approl',
              'joinTable' => 'per_poblaciones_rols',
              'foreignKey' => 'poblacion_id',
              'associationForeignKey' => 'rol_id',
              'unique' => true
              )
             */
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

    public function beforeFind($queryData) {
        $user_id = $_SESSION['Auth']['User']['id'];
        $rol_id = $_SESSION['Auth']['User']['Rol']['id'];

        /*
          $poblaciones = $this->Query("SELECT poblacion_id FROM per_poblaciones_rols WHERE rol_id=" . $rol_id);

          $pob = array();
          foreach ($poblaciones as $poblacion) {
          $pob[] = $poblacion['per_poblaciones_rols']['poblacion_id'];
          }
         */

        if (is_null($queryData['conditions'])) {
            $queryData['conditions'] = array();
        }

        $queryData['conditions'][] = array(
            'OR' => array(
                array('Poblacion.id IN (SELECT poblacion_id FROM per_poblaciones_rols WHERE rol_id=' . $rol_id . ')'),
                array('Poblacion.user_id' => $user_id)
            )
        );

        return $queryData;
    }

}
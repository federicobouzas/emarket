<?php

class Persona extends AppModel {

    public $label = 'Personas';
    public $tablePrefix = 'per_';
    public $useTable = 'personas';
    public $displayField = 'CONCAT(nombre, \' \', apellido)';
    //public $recursive = -1;
    public $hasAndBelongsToMany = array(
        'Poblacion' => array(
            'className' => 'Poblacion',
            'joinTable' => 'per_personas_poblaciones',
            'foreignKey' => 'persona_id',
            'associationForeignKey' => 'poblacion_id',
            'unique' => true
        ),
        'Campania' => array(
            'className' => 'Campania',
            'joinTable' => 'cam_campanias_personas',
            'foreignKey' => 'persona_id',
            'associationForeignKey' => 'campania_id',
            'unique' => true
        ),
    );
    public $validate = array(
        /*
          'nombre' => array(
          'required' => array(
          'rule' => array('notEmpty'),
          'message' => 'El nombre de la persona es requerido'
          )
          ),
          'apellido' => array(
          'required' => array(
          'rule' => array('notEmpty'),
          'message' => 'El apellido de la persona es requerido'
          )
          ),
         */
        'email' => array(
            'required' => array(
                'rule' => array('notEmpty'),
                'message' => 'El e-mail de la persona es requerido'
            ),
            'email' => array(
                'rule' => array('email'),
                'message' => 'El e-mail de la persona no es válido',
                'allowEmpty' => true
            ),
            'duplicated' => array(
                'rule' => array('limitDuplicates', 1),
                'message' => 'El e-mail ya se encuentra ingresado en la base de datos',
                'allowEmpty' => true
            )
        ),
        'telefono_celular' => array(
            'duplicated' => array(
                'rule' => array('limitDuplicates', 1),
                'message' => 'El teléfono celular ya se encuentra ingresado en la base de datos',
                'allowEmpty' => true
            )
        ),
        'activa' => array(
            'required' => array(
                'rule' => array('notEmpty'),
                'message' => 'Debe indicar si la persona está activa'
            )
        ),
        'altura' => array(
            'numeric' => array(
                'rule' => array('numeric'),
                'message' => 'La altura de la calle debe ser numérica',
                'allowEmpty' => true
            )
        ),
        'comuna' => array(
            'numeric' => array(
                'rule' => array('numeric'),
                'message' => 'La comuna debe ser numérica',
                'allowEmpty' => true
            ),
            'between' => array(
                'rule' => array('between', 1, 15),
                'message' => 'La comuna debe ser un número del 1 al 15',
                'allowEmpty' => true
            )
        ),
        'tmp_omitir_primer_fila' => array(
            'required' => array(
                'rule' => array('notEmpty'),
                'message' => 'Debe indicar si se va a omitir la primer fila'
            )
        ),
        'tmp_excel' => array(
            'required' => array(
                'rule' => array('notEmpty'),
                'message' => 'El Archivo Excel es requerido para la importación'
            )
        )
    );

    /*
      public function beforeFind($queryData) {
      $user_id = $_SESSION['Auth']['User']['id'];
      $rol_id = $_SESSION['Auth']['User']['Rol']['id'];

      $poblaciones = $this->Query("SELECT poblacion_id FROM per_poblaciones_rols WHERE rol_id=" . $rol_id);
      $pob = array();
      foreach ($poblaciones as $poblacion) {
      $pob[] = $poblacion['per_poblaciones_rols']['poblacion_id'];
      }

      if (is_null($queryData['conditions'])) {
      $queryData['conditions'] = array();
      }
      if (is_null($queryData['group'])) {
      $queryData['group'] = array();
      }
      if (is_null($queryData['joins'])) {
      $queryData['joins'] = array();
      }

      $queryData['joins'][] = array(
      'table' => 'per_personas_poblaciones',
      'alias' => 'PersonasPoblaciones',
      'type' => 'LEFT',
      'foreignKey' => false,
      'conditions' => array(
      'PersonasPoblaciones.persona_id = Persona.id'
      )
      );
      $queryData['group'][] = 'Persona.id';
      $queryData['conditions'][] = array(
      'OR' => array(
      array('PersonasPoblaciones.poblacion_id IN (SELECT poblacion_id FROM per_poblaciones_rols WHERE rol_id=' . $rol_id . ')'),
      //array('PersonasPoblaciones.poblacion_id' => null),
      array('Persona.user_id' => $user_id)
      )
      );

      return $queryData;
      }
     */

    function beforeImport(&$registros) {
        $errores = array();
        $repetidos = array();
        foreach (array_count_values(array_map("getPersonaEmail", $registros)) as $email => $veces) {
            if ($veces > 1) {
                $errores[] = "El email " . $email . " se encuentra repetido " . $veces . " veces en el archivo Excel.";
            }
        }

        if (count($errores) == 0) {
            foreach ($registros as $key => $registro) {
                if (!empty($registro['Persona']['email'])) {
                    $persona = $this->find('first', array('recursive' => -1, 'fields' => array('Persona.id'), 'conditions' => array('email' => $registro['Persona']['email'])));
                    if (count($persona)) {
                        foreach ($registro['Poblacion'] as $poblacion) {
                            $cant = $this->Query("SELECT COUNT(*) as cant FROM per_personas_poblaciones 
                                              WHERE persona_id=" . $persona['Persona']['id'] . " AND poblacion_id=" . $poblacion);
                            if (empty($cant[0][0]['cant'])) {
                                $this->Query("INSERT INTO per_personas_poblaciones (persona_id, poblacion_id) 
                                          VALUES (" . $persona['Persona']['id'] . ", " . $poblacion . ")");
                            }
                        }
                        unset($registros[$key]);
                    }
                }
            }
        }

        return $errores;
    }

}
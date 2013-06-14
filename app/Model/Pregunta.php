<?php

class Pregunta extends AppModel {

    public $label = 'Preguntas';
    //public $tablePrefix = 'per_';
    public $useTable = 'cam_encuestas_preguntas';
    public $displayField = 'pregunta';
    public $belongsTo = array('Encuesta');
    public $validate = array(
        'pregunta' => array(
            'required' => array(
                'rule' => array('notEmpty'),
                'message' => 'La pregunta es requerida'
            )
        ),
        'tipo' => array(
            'required' => array(
                'rule' => array('notEmpty'),
                'message' => 'El tipo de pregunta es requerido'
            )
        )
    );

}
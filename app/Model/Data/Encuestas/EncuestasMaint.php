<?php

App::uses('AbstractData', 'Lib');

class EncuestasMaint extends AbstractData {

    protected $data = array(
        'jsincludes' => array(
            'encuestas/maint_encuestas',
        ),
        'data' => array(
            array(
                'type' => 'fieldset',
                'title' => 'Datos de la Encuesta',
                'fields' => array(
                    array('name' => 'fecha_carga', 'label' => 'Fecha Carga', 'presentation' => 'DATETIME', 'classparams' => '{"force":true}', 'isvisible' => false, 'actions' => 'A'),
                    array('name' => 'user_id', 'label' => 'Usuario Carga', 'presentation' => 'USER', 'classparams' => '{"force":true}', 'isvisible' => false, 'actions' => 'A'),
                    array('name' => 'nombre', 'label' => 'Nombre'),
                    array('name' => 'descripcion', 'label' => 'Descripción', 'presentation' => 'TEXTAREA')
                ),
            ),
            array(
                'type' => 'table',
                'paginate' => 'true',
                'title' => 'Preguntas',
                'model' => 'Pregunta',
                'fields' => array(
                    array('name' => 'fecha_carga', 'label' => 'Fecha Carga', 'presentation' => 'DATETIME', 'classparams' => '{"force":true}', 'isvisible' => false, 'actions' => 'A'),
                    array('name' => 'user_id', 'label' => 'Usuario Carga', 'presentation' => 'USER', 'classparams' => '{"force":true}', 'isvisible' => false, 'actions' => 'A'),
                    array('name' => 'pregunta', 'label' => 'Pregunta', 'size' => '80'),
                    array('name' => 'tipo', 'label' => 'Tipo', 'presentation' => 'ENCUESTAS::TIPO_PREGUNTA'),
                    array('name' => 'opciones', 'label' => 'Opciones', 'size' => '100'),
                    array('name' => 'orden', 'label' => 'Orden', 'size' => '5'),
                ),
                'order' => array('Pregunta.orden ASC', 'Pregunta.id ASC'),
            ),
        ),
    );

}

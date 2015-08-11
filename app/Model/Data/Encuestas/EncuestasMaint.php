<?php

/* GENERADO AUTOMATICAMENTE */

App::uses('AbstractData', 'Lib');

class EncuestasMaint extends AbstractData {

protected $data = array (
    'translatepath' => 'encuestas.maint',
    'submit' => 'Guardar',
    'cancel' => true,
    'jsincludes' => 
    array (
        0 => 'encuestas/maint_encuestas',
    ),
    'data' => 
    array (
        0 => 
        array (
            'type' => 'fieldset',
            'fields' => 
            array (
                0 => 
                array (
                    'name' => 'Encuesta.fecha_carga',
                    'label' => 'Fecha Carga',
                    'presentation' => 'DATETIME',
                    'classparams' => '{\'force\':true}',
                    'isvisible' => false,
                    'actions' => 'A',
                ),
                1 => 
                array (
                    'name' => 'Encuesta.user_id',
                    'label' => 'Usuario Carga',
                    'presentation' => 'USER',
                    'classparams' => '{\'force\':true}',
                    'isvisible' => false,
                    'actions' => 'A',
                ),
                2 => 
                array (
                    'name' => 'Encuesta.nombre',
                    'label' => 'Nombre',
                ),
                3 => 
                array (
                    'name' => 'Encuesta.descripcion',
                    'label' => 'Descripción',
                    'presentation' => 'TEXTAREA',
                ),
            ),
            'id' => 'datos_encuestas',
            'title' => 'Datos de la Encuesta',
        ),
        1 => 
        array (
            'type' => 'table',
            'fields' => 
            array (
                0 => 
                array (
                    'name' => 'Pregunta.fecha_carga',
                    'label' => 'Fecha Carga',
                    'presentation' => 'DATETIME',
                    'classparams' => '{\'force\':true}',
                    'isvisible' => false,
                    'actions' => 'A',
                ),
                1 => 
                array (
                    'name' => 'Pregunta.user_id',
                    'label' => 'Usuario Carga',
                    'presentation' => 'USER',
                    'classparams' => '{\'force\':true}',
                    'isvisible' => false,
                    'actions' => 'A',
                ),
                2 => 
                array (
                    'name' => 'Pregunta.pregunta',
                    'label' => 'Pregunta',
                    'size' => 80,
                ),
                3 => 
                array (
                    'name' => 'Pregunta.tipo',
                    'label' => 'Tipo',
                    'presentation' => 'ENCUESTAS::TIPO_PREGUNTA',
                ),
                4 => 
                array (
                    'name' => 'Pregunta.opciones',
                    'label' => 'Opciones',
                    'size' => 100,
                ),
                5 => 
                array (
                    'name' => 'Pregunta.orden',
                    'label' => 'Orden',
                    'size' => 5,
                ),
            ),
            'id' => 'preguntas',
            'paginate' => true,
            'title' => 'Preguntas',
            'model' => 'Pregunta',
            'orderby' => 'Pregunta.orden ASC, Pregunta.id ASC',
        ),
    ),
);

}

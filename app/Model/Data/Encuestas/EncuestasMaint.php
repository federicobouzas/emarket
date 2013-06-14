<?php

/* GENERADO AUTOMATICAMENTE */

App::uses('AbstractData', 'Lib');

class EncuestasMaint extends AbstractData {

protected $data =
array (
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
                    'name' => 'fecha_carga',
                    'label' => 'Fecha Carga',
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
                ),
                3 => 
                array (
                    'name' => 'descripcion',
                    'label' => 'Descripción',
                    'presentation' => 'TEXTAREA',
                ),
            ),
            'title' => 'Datos de la Encuesta',
        ),
        1 => 
        array (
            'type' => 'table',
            'fields' => 
            array (
                0 => 
                array (
                    'name' => 'fecha_carga',
                    'label' => 'Fecha Carga',
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
                    'name' => 'pregunta',
                    'label' => 'Pregunta',
                    'size' => 80,
                ),
                3 => 
                array (
                    'name' => 'tipo',
                    'label' => 'Tipo',
                    'presentation' => 'ENCUESTAS::TIPO_PREGUNTA',
                ),
                4 => 
                array (
                    'name' => 'opciones',
                    'label' => 'Opciones',
                    'size' => 100,
                ),
                5 => 
                array (
                    'name' => 'orden',
                    'label' => 'Orden',
                    'size' => 5,
                ),
            ),
            'paginate' => true,
            'title' => 'Preguntas',
            'model' => 'Pregunta',
            'order' => 'Pregunta.orden ASC, Pregunta.id ASC',
        ),
    ),
);

}

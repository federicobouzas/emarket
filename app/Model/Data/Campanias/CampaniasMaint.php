<?php

/* GENERADO AUTOMATICAMENTE */

App::uses('AbstractData', 'Lib');

class CampaniasMaint extends AbstractData {

protected $data = array (
    'translatepath' => 'campanias.maint',
    'jsincludes' => 
    array (
        0 => 'campanias/maint_campanias.js',
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
                ),
                4 => 
                array (
                    'name' => 'tipo',
                    'label' => 'Tipo',
                    'presentation' => 'CAMPANIAS::TIPO_CAMPANIA',
                ),
                5 => 
                array (
                    'name' => 'encuesta_id',
                    'label' => 'Nombre Encuesta',
                    'presentation' => 'SELECT',
                    'classparams' => '{\'model\':\'Encuesta\'}',
                ),
                6 => 
                array (
                    'name' => 'evento_id',
                    'label' => 'Nombre Evento',
                    'presentation' => 'SELECT',
                    'classparams' => '{\'model\':\'Evento\'}',
                ),
                7 => 
                array (
                    'name' => 'sms',
                    'label' => 'Usa SMS',
                    'presentation' => 'SINO',
                ),
                8 => 
                array (
                    'name' => 'cuerpo_sms',
                    'label' => 'Mensaje SMS',
                    'presentation' => 'TEXTAREA',
                ),
                9 => 
                array (
                    'name' => 'email',
                    'label' => 'Usa Email',
                    'presentation' => 'SINO',
                ),
                10 => 
                array (
                    'name' => 'asunto_email',
                    'label' => 'Asunto Email',
                    'size' => 100,
                ),
                11 => 
                array (
                    'name' => 'tmp_template',
                    'label' => 'Subir Template',
                    'presentation' => 'FILE',
                    'actions' => 'A|E',
                    'breakline' => true,
                ),
                12 => 
                array (
                    'name' => 'cuerpo_email',
                    'label' => 'Cuerpo Email',
                    'presentation' => 'WYSIWYG',
                    'note' => 'Variables disponibles: #NOMBRE#, #APELLIDO#, #URL_UNSUBSCRIBE#, #URL_ENCUESTA#, #FECHA_HORA#, #LUGAR#, #URL_MAPA#, #URL_ASISTE#, #URL_NO_ASISTE#',
                ),
            ),
            'id' => 'datos_campania',
            'title' => 'Datos de la Campaña',
        ),
        1 => 
        array (
            'type' => 'fieldset',
            'fields' => 
            array (
                0 => 
                array (
                    'name' => 'personas_sexo',
                    'label' => 'Sexo',
                    'presentation' => 'SINO',
                ),
                1 => 
                array (
                    'name' => 'personas_edad',
                    'label' => 'Edad',
                    'presentation' => 'SINO',
                ),
                2 => 
                array (
                    'name' => 'personas_tipo_envio',
                    'label' => 'Tipo Envío',
                    'presentation' => 'CAMPANIAS::TIPO_ENVIO',
                ),
                3 => 
                array (
                    'name' => 'personas_comuna',
                    'label' => 'Comuna',
                    'presentation' => 'CAMPANIAS::COMUNAS_CHECKBOX',
                ),
                4 => 
                array (
                    'name' => 'personas_barrio',
                    'label' => 'Barrio',
                    'presentation' => 'CAMPANIAS::BARRIOS_CHECKBOX',
                ),
                5 => 
                array (
                    'name' => 'personas_poblaciones',
                    'label' => 'Poblaciones',
                    'presentation' => 'CAMPANIAS::POBLACIONES_CHECKBOX',
                ),
                6 => 
                array (
                    'name' => 'tmp_cantidad_personas',
                    'label' => 'Cantidad de Personas',
                    'presentation' => 'CAMPANIAS::CANTIDAD_PERSONAS',
                ),
            ),
            'id' => 'caracteristicas_personas',
            'title' => 'Características de las Personas',
            'columns' => '2',
        ),
        2 => 
        array (
            'type' => 'fieldset',
            'fields' => 
            array (
                0 => 
                array (
                    'name' => 'server_id',
                    'label' => 'Cuenta',
                    'presentation' => 'SELECT',
                    'classparams' => '{\'model\':\'FmwMessaging.Server\', \'conditions\':{\'estado\':\'Activo\',\'tipo\':\'SMTP\'}}',
                ),
                1 => 
                array (
                    'name' => 'prioridad',
                    'label' => 'Prioridad',
                    'presentation' => 'MENSAJES::PRIORIDAD_MENSAJE',
                    'initialvalue' => 3,
                ),
                2 => 
                array (
                    'name' => 'estado',
                    'label' => 'Estado',
                    'presentation' => 'CAMPANIAS::ESTADO_CAMPANIA',
                    'readonly' => true,
                    'actions' => 'V|E',
                ),
                3 => 
                array (
                    'name' => 'fecha_envio',
                    'label' => 'Fecha Programada',
                    'presentation' => 'DATETIME',
                    'classparams' => '{\'no_seconds\':true}',
                ),
            ),
            'id' => 'programar_envio',
            'title' => 'Programar Envío',
            'columns' => '2',
        ),
    ),
);

}

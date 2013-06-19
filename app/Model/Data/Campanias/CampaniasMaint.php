<?php

App::uses('AbstractData', 'Lib');

class CampaniasMaint extends AbstractData {

    protected $data = array(
        'data' => array(
            array(
                'type' => 'fieldset',
                'title' => 'Datos de la Campaña',
                'fields' => array(
                    array('name' => 'fecha_carga', 'label' => 'Fecha Carga', 'presentation' => 'DATETIME', 'classparams' => '{"force":true}', 'isvisible' => false, 'actions' => 'A'),
                    array('name' => 'user_id', 'label' => 'Usuario Carga', 'presentation' => 'USER', 'classparams' => '{"force":true}', 'isvisible' => false, 'actions' => 'A'),
                    array('name' => 'nombre', 'label' => 'Nombre', 'size' => '100'),
                    array('name' => 'activa', 'label' => 'Activa', 'presentation' => 'SINO'),
                    array('name' => 'tipo', 'label' => 'Tipo', 'presentation' => 'CAMPANIAS::TIPO_CAMPANIA'),
                    array('name' => 'encuesta_id', 'label' => 'Nombre Encuesta', 'presentation' => 'SELECT', 'classparams' => '{"model":"Encuesta"}'),
                    array('name' => 'evento_id', 'label' => 'Nombre Evento', 'presentation' => 'SELECT', 'classparams' => '{"model":"Evento"}'),
                    array('name' => 'sms', 'label' => 'Usa SMS', 'presentation' => 'SINO'),
                    array('name' => 'cuerpo_sms', 'label' => 'Mensaje SMS', 'presentation' => 'TEXTAREA'),
                    array('name' => 'email', 'label' => 'Usa Email', 'presentation' => 'SINO'),
                    array('name' => 'asunto_email', 'label' => 'Asunto Email', 'size' => '100'),
                    array('name' => 'tmp_template', 'label' => 'Subir Template', 'presentation' => 'FILE', 'actions' => 'A|E'),
                    array('name' => 'cuerpo_email', 'label' => 'Cuerpo Email', 'presentation' => 'WYSIWYG', 'note' => 'Variables disponibles: #NOMBRE#, #APELLIDO#, #URL_UNSUBSCRIBE#, #URL_ENCUESTA#, #FECHA_HORA#, #LUGAR#, #URL_MAPA#, #URL_ASISTE#, #URL_NO_ASISTE#'),
                ),
            ),
            array(
                'type' => 'fieldset',
                'title' => 'Características de las Personas',
                'fields' => array(
                    array('name' => 'personas_sexo', 'label' => 'Sexo', 'presentation' => 'SEXO'),
                    array('name' => 'personas_edad', 'label' => 'Edad', 'presentation' => 'EDAD_ENTRE'),
                    array('name' => 'personas_localizacion_envio', 'label' => 'Localización Envío', 'presentation' => 'CAMPANIAS::LOCALIZACION_ENVIO'),
                    array('name' => 'personas_comuna', 'label' => 'Comuna', 'presentation' => 'CAMPANIAS::COMUNAS_CHECKBOX'),
                    array('name' => 'personas_barrio', 'label' => 'Barrio', 'presentation' => 'CAMPANIAS::BARRIOS_CHECKBOX'),
                    array('name' => 'tmp_cantidad_personas', 'label' => 'Cantidad de Personas', 'presentation' => 'CAMPANIAS::CANTIDAD_PERSONAS'),
                ),
            ),
            array(
                'type' => 'fieldset',
                'title' => 'Programar Envío',
                'fields' => array(
                    array('name' => 'server_id', 'label' => 'Cuenta', 'presentation' => 'SELECT', 'classparams' => '{"model":"Messaging.Server", "conditions":{"estado":"Activo","tipo":"SMTP"}}'),
                    array('name' => 'prioridad', 'label' => 'Prioridad', 'presentation' => 'MENSAJES::PRIORIDAD_MENSAJE', 'initialvalue' => '3'),
                    array('name' => 'estado', 'label' => 'Estado', 'presentation' => 'CAMPANIAS::ESTADO_CAMPANIA', 'readonly' => true, 'actions' => 'V|E'),
                    array('name' => 'fecha_envio', 'label' => 'Fecha Programada', 'presentation' => 'DATETIME', 'classparams' => '{"no_seconds": true}'),
                ),
            ),
        /*
          array(
          'type' => 'table',
          'assoc' => 'true',
          'paginate' => 'true',
          'title' => 'Poblaciones Contactadas',
          'model' => 'Poblacion',
          'fields' => array(
          array('name' => 'nombre', 'label' => 'Población'),
          ),
          'conditions' => array('activa' => 'Si'),
          'order' => array('Poblacion.nombre ASC'),
          ),
         */
        ),
        'jsincludes' => array('campanias/maint_campanias.js')
    );
    
}

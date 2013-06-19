<?php

App::uses('AbstractData', 'Lib');

class CampaniasSL extends AbstractData {

    protected $data = array(
        'actions' => array('V' => 'view', 'E' => 'edit', 'D' => 'delete'),
        'filters' => array(
            array('name' => 'Campania.activa', 'label' => 'Activa', 'presentation' => 'SINO', 'initialvalue' => 'Si'),
            array('name' => 'Campania.server_id', 'label' => 'Cuenta', 'presentation' => 'SELECT', 'classparams' => '{"model":"Messaging.Server"}'),
            array('name' => 'Campania.prioridad', 'label' => 'Prioridad', 'presentation' => 'MENSAJES::PRIORIDAD_MENSAJE'),
            array('name' => 'Campania.nombre', 'label' => 'Nombre'),
            array('name' => 'Campania.tipo', 'label' => 'Tipo', 'presentation' => 'CAMPANIAS::TIPO_CAMPANIA'),
            array('name' => 'Campania.sms', 'label' => 'Usa SMS', 'presentation' => 'SINO'),
            array('name' => 'Campania.email', 'label' => 'Usa Email', 'presentation' => 'SINO'),
            array('name' => 'Campania.estado', 'label' => 'Estado', 'presentation' => 'CAMPANIAS::ESTADO_CAMPANIA'),
        ),
        'columns' => array(
            array('name' => 'Campania.nombre', 'label' => 'Nombre'),
            array('name' => 'Campania.activa', 'label' => 'Activa'),
            array('name' => 'Campania.server_id', 'label' => 'Cuenta', 'presentation' => 'SELECT', 'classparams' => '{"model":"Messaging.Server"}'),
            array('name' => 'Campania.prioridad', 'label' => 'Prioridad', 'presentation' => 'MENSAJES::PRIORIDAD_MENSAJE'),
            array('name' => 'Campania.tipo', 'label' => 'Tipo', 'presentation' => 'CAMPANIAS::TIPO_CAMPANIA'),
            array('name' => 'Campania.sms', 'label' => 'Usa SMS', 'presentation' => 'SINO'),
            array('name' => 'Campania.email', 'label' => 'Usa Email', 'presentation' => 'SINO'),
            array('name' => 'Campania.estado', 'label' => 'Estado', 'presentation' => 'CAMPANIAS::ESTADO_CAMPANIA'),
            array('name' => 'Campania.fecha_envio', 'label' => 'Fecha de Envío', 'presentation' => 'DATETIME', 'classparams' => '{"no_seconds": true}'),
            array('name' => 'Campania.id', 'label' => 'Probar Envío', 'presentation' => 'CAMPANIAS::ENVIAR_CAMPANIA'),
        ),
    );

}

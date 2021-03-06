<?php

/* GENERADO AUTOMATICAMENTE */

App::uses('AbstractData', 'Lib');

class CampaniasSL extends AbstractData {

protected $data = array (
    'translatepath' => 'campanias.search_list',
    'title' => '',
    'filters' => 
    array (
        0 => 
        array (
            'name' => 'Campania.activa',
            'label' => 'Activa',
            'presentation' => 'SINO',
            'initialvalue' => 'Si',
        ),
        1 => 
        array (
            'name' => 'Campania.server_id',
            'label' => 'Cuenta',
            'presentation' => 'SELECT',
            'classparams' => '{\'model\':\'FmwMessaging.Server\'}',
        ),
        2 => 
        array (
            'name' => 'Campania.prioridad',
            'label' => 'Prioridad',
            'presentation' => 'MENSAJES::PRIORIDAD_MENSAJE',
        ),
        3 => 
        array (
            'name' => 'Campania.nombre',
            'label' => 'Nombre',
        ),
        4 => 
        array (
            'name' => 'Campania.tipo',
            'label' => 'Tipo',
            'presentation' => 'CAMPANIAS::TIPO_CAMPANIA',
        ),
        5 => 
        array (
            'name' => 'Campania.sms',
            'label' => 'Usa SMS',
            'presentation' => 'SINO',
        ),
        6 => 
        array (
            'name' => 'Campania.email',
            'label' => 'Usa Email',
            'presentation' => 'SINO',
        ),
        7 => 
        array (
            'name' => 'Campania.estado',
            'label' => 'Estado',
            'presentation' => 'CAMPANIAS::ESTADO_CAMPANIA',
        ),
    ),
    'columns' => 
    array (
        0 => 
        array (
            'label' => '',
            'sortfield' => '',
            'fields' => 
            array (
                0 => 
                array (
                    'name' => 'Campania.nombre',
                    'label' => 'Nombre',
                ),
            ),
        ),
        1 => 
        array (
            'label' => '',
            'sortfield' => '',
            'fields' => 
            array (
                0 => 
                array (
                    'name' => 'Campania.activa',
                    'label' => 'Activa',
                ),
            ),
        ),
        2 => 
        array (
            'label' => '',
            'sortfield' => '',
            'fields' => 
            array (
                0 => 
                array (
                    'name' => 'Campania.server_id',
                    'label' => 'Cuenta',
                    'presentation' => 'SELECT',
                    'classparams' => '{\'model\':\'FmwMessaging.Server\'}',
                ),
            ),
        ),
        3 => 
        array (
            'label' => '',
            'sortfield' => '',
            'fields' => 
            array (
                0 => 
                array (
                    'name' => 'Campania.prioridad',
                    'label' => 'Prioridad',
                    'presentation' => 'MENSAJES::PRIORIDAD_MENSAJE',
                ),
            ),
        ),
        4 => 
        array (
            'label' => '',
            'sortfield' => '',
            'fields' => 
            array (
                0 => 
                array (
                    'name' => 'Campania.tipo',
                    'label' => 'Tipo',
                    'presentation' => 'CAMPANIAS::TIPO_CAMPANIA',
                ),
            ),
        ),
        5 => 
        array (
            'label' => '',
            'sortfield' => '',
            'fields' => 
            array (
                0 => 
                array (
                    'name' => 'Campania.sms',
                    'label' => 'Usa SMS',
                    'presentation' => 'SINO',
                ),
            ),
        ),
        6 => 
        array (
            'label' => '',
            'sortfield' => '',
            'fields' => 
            array (
                0 => 
                array (
                    'name' => 'Campania.email',
                    'label' => 'Usa Email',
                    'presentation' => 'SINO',
                ),
            ),
        ),
        7 => 
        array (
            'label' => '',
            'sortfield' => '',
            'fields' => 
            array (
                0 => 
                array (
                    'name' => 'Campania.estado',
                    'label' => 'Estado',
                    'presentation' => 'CAMPANIAS::ESTADO_CAMPANIA',
                ),
            ),
        ),
        8 => 
        array (
            'label' => '',
            'sortfield' => '',
            'fields' => 
            array (
                0 => 
                array (
                    'name' => 'Campania.fecha_envio',
                    'label' => 'Fecha de Envío',
                    'presentation' => 'DATETIME',
                    'classparams' => '{\'no_seconds\':true}',
                ),
            ),
        ),
        9 => 
        array (
            'label' => '',
            'sortfield' => '',
            'fields' => 
            array (
                0 => 
                array (
                    'name' => 'Campania.id',
                    'label' => 'Probar Envío',
                    'presentation' => 'CAMPANIAS::ENVIAR_CAMPANIA',
                ),
            ),
        ),
    ),
    'order' => 
    array (
        'Campania.fecha_carga' => 'DESC',
    ),
);

}

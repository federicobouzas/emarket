<?php

App::uses('AbstractData', 'Lib');

class EventosMaint extends AbstractData {

    protected $data = array(
        'data' => array(
            array(
                'type' => 'fieldset',
                'title' => 'Datos del Evento',
                'fields' => array(
                    array('name' => 'fecha_carga', 'label' => 'Fecha Carga', 'presentation' => 'DATETIME', 'classparams' => '{"force":true}', 'isvisible' => false, 'actions' => 'A'),
                    array('name' => 'user_id', 'label' => 'Usuario Carga', 'presentation' => 'USER', 'classparams' => '{"force":true}', 'isvisible' => false, 'actions' => 'A'),
                    array('name' => 'nombre', 'label' => 'Nombre'),
                    array('name' => 'fecha_hora_evento', 'label' => 'Fecha y Hora', 'presentation' => 'DATETIME', 'classparams' => '{"no_seconds": true}'),
                    array('name' => 'descripcion', 'label' => 'Descripción', 'presentation' => 'TEXTAREA'),
                ),
            ),
            array(
                'type' => 'fieldset',
                'title' => 'Ubicación',
                'fields' => array(
                    array('name' => 'direccion', 'label' => 'Dirección'),
                    array('name' => 'barrio', 'label' => 'Barrio', 'presentation' => 'BARRIOS'),
                    array('name' => 'ciudad', 'label' => 'Ciudad'),
                    array('name' => 'provincia', 'label' => 'Provincia', 'presentation' => 'PROVINCIAS'),
                    array('name' => 'coordenadas', 'label' => 'Ubicación', 'presentation' => 'GOOGLEMAP', 'classparams' => '{"calle_altura":"direccion","ciudad":"ciudad","provincia":"provincia"}')
                ),
            ),
        ),
    );

}

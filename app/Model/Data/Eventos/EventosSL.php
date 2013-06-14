<?php

App::uses('AbstractData', 'Lib');

class EventosSL extends AbstractData {

    protected $data = array(
        'actions' => array('V' => 'view', 'E' => 'edit', 'D' => 'delete'),
        'filters' => array(
            array('name' => 'Evento.nombre', 'label' => 'Nombre'),
            array('name' => 'Evento.fecha_hora_evento', 'label' => 'Fecha', 'presentation' => 'DATE'),
        ),
        'columns' => array(
            array('name' => 'Evento.nombre', 'label' => 'Nombre'),
            array('name' => 'Evento.fecha_hora_evento', 'label' => 'Fecha y Hora', 'presentation' => 'DATETIME', 'classparams' => '{"no_seconds": true}'),
            array('name' => 'Evento.barrio', 'label' => 'Barrio'),
            array('name' => 'Evento.ciudad', 'label' => 'Ciudad'),
            array('name' => 'Evento.provincia', 'label' => 'Provincia'),
        )
    );

}

<?php

/* GENERADO AUTOMATICAMENTE */

App::uses('AbstractData', 'Lib');

class EventosMaint extends AbstractData {

protected $data = array (
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
                    'name' => 'fecha_hora_evento',
                    'label' => 'Fecha y Hora',
                    'presentation' => 'DATETIME',
                    'classparams' => '{\'no_seconds\':true}',
                ),
                4 => 
                array (
                    'name' => 'descripcion',
                    'label' => 'Descripción',
                    'presentation' => 'TEXTAREA',
                ),
            ),
            'title' => 'Datos del Evento',
        ),
        1 => 
        array (
            'type' => 'fieldset',
            'fields' => 
            array (
                0 => 
                array (
                    'name' => 'direccion',
                    'label' => 'Dirección',
                ),
                1 => 
                array (
                    'name' => 'barrio',
                    'label' => 'Barrio',
                    'presentation' => 'BARRIOS',
                ),
                2 => 
                array (
                    'name' => 'ciudad',
                    'label' => 'Ciudad',
                ),
                3 => 
                array (
                    'name' => 'provincia',
                    'label' => 'Provincia',
                    'presentation' => 'PROVINCIAS',
                ),
                4 => 
                array (
                    'name' => 'coordenadas',
                    'label' => 'Ubicación',
                    'presentation' => 'GOOGLEMAP',
                    'classparams' => '{\'calle_altura\':\'direccion\',\'barrio\':\'barrio\',\'ciudad\':\'ciudad\',\'provincia\':\'provincia\'}',
                ),
            ),
            'title' => 'Ubicación',
        ),
    ),
);

}

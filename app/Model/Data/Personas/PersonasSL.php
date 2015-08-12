<?php

/* GENERADO AUTOMATICAMENTE */

App::uses('AbstractData', 'Lib');

class PersonasSL extends AbstractData {

protected $data = array (
    'translatepath' => NULL,
    'title' => '',
    'actions' => 
    array (
        0 => 
        array (
            'op' => 'V',
            'action' => 'view',
        ),
        1 => 
        array (
            'op' => 'E',
            'action' => 'edit',
        ),
        2 => 
        array (
            'op' => 'A',
            'action' => 'add',
            'global' => 'true',
        ),
    ),
    'filters' => 
    array (
        0 => 
        array (
            'name' => 'Persona.nombre',
            'label' => 'Nombre',
        ),
        1 => 
        array (
            'name' => 'Persona.apellido',
            'label' => 'Apellido',
        ),
        2 => 
        array (
            'name' => 'Persona.email',
            'label' => 'Email',
        ),
        3 => 
        array (
            'name' => 'Persona.sexo',
            'label' => 'Sexo',
            'presentation' => 'SEXO',
        ),
        4 => 
        array (
            'name' => 'Persona.comuna',
            'label' => 'Comuna',
            'presentation' => 'GEOLOCALIZACION::COMUNAS',
        ),
        5 => 
        array (
            'name' => 'Persona.barrio',
            'label' => 'Barrio',
            'presentation' => 'GEOLOCALIZACION::BARRIOS',
            'classparams' => '{\'listen\':\'PersonaComuna\'}',
        ),
        6 => 
        array (
            'name' => 'Persona.id',
            'label' => 'Población',
            'presentation' => 'PERSONAS::POBLACION',
            'classparams' => '{\'model\':\'Poblacion\'}',
        ),
        7 => 
        array (
            'name' => 'Persona.activa',
            'label' => 'Activa',
            'presentation' => 'SINO_INT',
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
                    'name' => 'Persona.nombre',
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
                    'name' => 'Persona.apellido',
                    'label' => 'Apellido',
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
                    'name' => 'Persona.email',
                    'label' => 'Email',
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
                    'name' => 'Persona.sexo',
                    'label' => 'Sexo',
                    'presentation' => 'SEXO',
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
                    'name' => 'Persona.comuna',
                    'label' => 'Comuna',
                    'presentation' => 'GEOLOCALIZACION::COMUNAS',
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
                    'name' => 'Persona.barrio',
                    'label' => 'Barrio',
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
                    'name' => 'Persona.activa',
                    'label' => 'Activa',
                    'presentation' => 'SINO_INT',
                ),
            ),
        ),
    ),
);

}

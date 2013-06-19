<?php

App::uses('AbstractData', 'Lib');

class PersonasSL extends AbstractData {

    protected $data = array(
        'actions' => array('V' => 'view', 'E' => 'edit'),
        'filters' => array(
            array('name' => 'Persona.nombre', 'label' => 'Nombre'),
            array('name' => 'Persona.apellido', 'label' => 'Apellido'),
            array('name' => 'Persona.activa', 'label' => 'Activa', 'presentation' => 'SINO'),
            array('name' => 'Persona.sexo', 'label' => 'Sexo', 'presentation' => 'SEXO'),
            array('name' => 'Persona.comuna', 'label' => 'Comuna', 'presentation' => 'GEOLOCALIZACION::COMUNAS'),
            array('name' => 'Persona.barrio', 'label' => 'Barrio', 'presentation' => 'GEOLOCALIZACION::BARRIOS', 'classparams' => '{"listen":"PersonaComuna"}'),
            //array('name' => 'Persona.id', 'label' => 'Población', 'presentation' => 'PERSONAS::POBLACION', 'classparams' => '{"model":"Poblacion"}'),
        ),
        'columns' => array(
            array('name' => 'Persona.nombre', 'label' => 'Nombre'),
            array('name' => 'Persona.apellido', 'label' => 'Apellido'),
            array('name' => 'Persona.activa', 'label' => 'Activa'),
        )
    );

}

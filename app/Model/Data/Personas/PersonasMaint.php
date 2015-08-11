<?php

/* GENERADO AUTOMATICAMENTE */

App::uses('AbstractData', 'Lib');

class PersonasMaint extends AbstractData {

protected $data = array (
    'translatepath' => NULL,
    'submit' => 'Guardar',
    'cancel' => true,
    'data' => 
    array (
        0 => 
        array (
            'type' => 'fieldset',
            'fields' => 
            array (
                0 => 
                array (
                    'name' => 'nombre',
                    'label' => 'Nombre',
                ),
                1 => 
                array (
                    'name' => 'apellido',
                    'label' => 'Apellido',
                ),
                2 => 
                array (
                    'name' => 'sexo',
                    'label' => 'Sexo',
                    'presentation' => 'SEXO',
                ),
                3 => 
                array (
                    'name' => 'fecha_nacimiento',
                    'label' => 'Fecha de Nacimiento',
                    'presentation' => 'DATE',
                ),
                4 => 
                array (
                    'name' => 'email',
                    'label' => 'Email',
                ),
                5 => 
                array (
                    'name' => 'telefono_particular',
                    'label' => 'Teléfono Particular',
                    'presentation' => 'INT',
                    'size' => 10,
                ),
                6 => 
                array (
                    'name' => 'telefono_celular',
                    'label' => 'Teléfono Celular',
                    'presentation' => 'INT',
                    'size' => 12,
                ),
                7 => 
                array (
                    'name' => 'activa',
                    'label' => 'Activo',
                    'presentation' => 'SINO_INT',
                    'initialvalue' => 1,
                ),
            ),
            'title' => 'Datos Personales',
            'columns' => '2',
        ),
        1 => 
        array (
            'type' => 'fieldset',
            'fields' => 
            array (
                0 => 
                array (
                    'name' => 'calle',
                    'label' => 'Calle',
                ),
                1 => 
                array (
                    'name' => 'altura',
                    'label' => 'Altura',
                    'presentation' => 'INT',
                    'size' => 5,
                ),
                2 => 
                array (
                    'name' => 'piso',
                    'label' => 'Piso',
                    'size' => 10,
                ),
                3 => 
                array (
                    'name' => 'comuna',
                    'label' => 'Comuna',
                    'presentation' => 'GEOLOCALIZACION::COMUNAS',
                ),
                4 => 
                array (
                    'name' => 'barrio',
                    'label' => 'Barrio',
                    'presentation' => 'GEOLOCALIZACION::BARRIOS',
                    'classparams' => '{\'listen\':\'Persona.Comuna\'}',
                ),
                5 => 
                array (
                    'name' => 'localidad',
                    'label' => 'Localidad',
                ),
                6 => 
                array (
                    'name' => 'provincia',
                    'label' => 'Provincia',
                ),
                7 => 
                array (
                    'name' => 'pais',
                    'label' => 'País',
                    'presentation' => 'INT',
                    'size' => 10,
                ),
                8 => 
                array (
                    'name' => 'coordenadas',
                    'label' => 'Ubicación',
                    'presentation' => 'GOOGLEMAP',
                    'classparams' => '{\'calle:\'calle\',\'altura\':\'altura\',\'barrio\':\'barrio\',\'comuna\':\'comuna\',\'provincia\':\'provincia\',\'pais\':\'pais\'}',
                ),
            ),
            'title' => 'Domicilio',
            'columns' => '2',
        ),
    ),
);

}

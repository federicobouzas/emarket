<?php

App::uses('AbstractData', 'Lib');

class PersonasMaint extends AbstractData {

    protected $data = array(
        'jsincludes' => array('personas/maint_personas'),
        'data' => array(
            array(
                'type' => 'fieldset',
                'title' => 'Datos Personales',
                'fields' => array(
                    array('name' => 'fecha_carga', 'label' => 'Fecha Carga', 'presentation' => 'DATETIME', 'classparams' => '{"force":true}', 'isvisible' => false, 'actions' => 'A'),
                    array('name' => 'user_id', 'label' => 'Usuario Carga', 'presentation' => 'USER', 'classparams' => '{"force":true}', 'isvisible' => false, 'actions' => 'A'),
                    array('name' => 'activa', 'label' => 'Activo', 'presentation' => 'SINO', 'initialvalue' => 'Si'),
                    array('name' => 'nombre', 'label' => 'Nombre'),
                    array('name' => 'apellido', 'label' => 'Apellido'),
                    array('name' => 'sexo', 'label' => 'Sexo', 'presentation' => 'SEXO'),
                    array('name' => 'fecha_nacimiento', 'label' => 'Fecha de Nacimiento', 'presentation' => 'DATE'),
                    array('name' => 'email', 'label' => 'Email'),
                    array('name' => 'telefono_particular', 'label' => 'Teléfono Particular', 'size' => '10'),
                    array('name' => 'telefono_celular', 'label' => 'Celular', 'size' => '12'),
                ),
            ),
            array(
                'type' => 'fieldset',
                'title' => 'Domicilio',
                'fields' => array(
                    array('name' => 'calle', 'label' => 'Calle'),
                    array('name' => 'altura', 'label' => 'Altura', 'size' => 5),
                    array('name' => 'piso', 'label' => 'Piso', 'size' => 10),
                    array('name' => 'comuna', 'label' => 'Comuna', 'presentation' => 'GEOLOCALIZACION::COMUNAS'),
                    array('name' => 'barrio', 'label' => 'Barrio', 'presentation' => 'GEOLOCALIZACION::BARRIOS', 'classparams' => '{"listen":"PersonaComuna"}'),
                    array('name' => 'tmp_provincia', 'label' => 'Provincia', 'initialvalue' => 'Ciudad de Buenos Aires', 'isvisible' => false),
                    array('name' => 'tmp_pais', 'label' => 'País', 'initialvalue' => 'Argentina', 'isvisible' => false),
                    array('name' => 'coordenadas', 'label' => 'Ubicación', 'presentation' => 'GOOGLEMAP', 'classparams' => '{"calle":"calle","altura":"altura","barrio":"barrio","comuna":"comuna","provincia":"tmp_provincia","pais":"tmp_pais"}')
                ),
            ),
            array(
                'type' => 'table',
                'assoc' => 'true',
                'paginate' => 'true',
                'title' => 'Poblaciones a las que Pertenece',
                'model' => 'Poblacion',
                'fields' => array(
                    array('name' => 'Poblacion.nombre', 'label' => 'Población'),
                ),
                'order' => array('Poblacion.nombre ASC'),
            ),
            array(
                'type' => 'table',
                'assoc' => 'true',
                'paginate' => 'true',
                'title' => 'Contactos en Campañas',
                'model' => 'Campania',
                'fields' => array(
                    array('name' => 'Campania.nombre', 'label' => 'Camapaña'),
                    array('name' => 'Campania.tipo', 'label' => 'Tipo'),
                    array('name' => 'Campania.encuesta_id', 'label' => 'Encuesta', 'presentation' => 'SELECT', 'classparams' => '{"model":"Encuesta"}'),
                    array('name' => 'Campania.evento_id', 'label' => 'Evento', 'presentation' => 'SELECT', 'classparams' => '{"model":"Evento"}'),
                    array('name' => 'Assoc.estado', 'label' => 'Estado'),
                ),
                'order' => array('Campania.nombre ASC'),
                'actions' => array(),
            ),
        ),
    );

}

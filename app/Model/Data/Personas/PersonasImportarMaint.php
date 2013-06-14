<?php

App::uses('AbstractData', 'Lib');

class PersonasImportarMaint extends AbstractData {

    protected $data = array(
        'data' => array(
            array(
                'type' => 'fieldset',
                'title' => 'Descripción de la Importación',
                'fields' => array(
                    array('name' => 'fecha_carga', 'label' => 'Fecha Carga', 'presentation' => 'DATETIME', 'classparams' => '{"force":true}', 'isvisible' => false),
                    array('name' => 'user_id', 'label' => 'Usuario Carga', 'presentation' => 'USER', 'classparams' => '{"force":true}', 'isvisible' => false),
                    array('name' => 'activa', 'label' => 'Activa', 'presentation' => 'SINO', 'initialvalue' => 'Si', 'isvisible' => false),
                    array('name' => 'tmp_ejemplo', 'label' => 'Ejemplo', 'presentation' => 'DIRECT_FILE', 'initialvalue' => 'ejemplo.xlsx'),
                    array('name' => 'tmp_omitir_primer_fila', 'label' => 'Omitir Primer Fila', 'presentation' => 'SINO', 'initialvalue' => 'Si'),
                    array('name' => 'tmp_excel', 'label' => 'Archivo Excel', 'presentation' => 'FILE'),
                ),
            ),
        /*
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
         */
        ),
    );
    protected $import = array(
        'A' => array('name' => 'nombre', 'label' => 'Nombre'), 
        'B' => array('name' => 'apellido', 'label' => 'Apellido'), 
        'C' => array('name' => 'sexo', 'label' => 'Sexo'), 
        'D' => array('name' => 'fecha_nacimiento', 'label' => 'Fecha de Nacimiento'), 
        'E' => array('name' => 'email','label' => 'Email'), 
        'F' => array('name' => 'telefono_particular', 'label' => 'Teléfono Particular'), 
        'G' => array('name' => 'telefono_celular', 'label' => 'Teléfono Celular'), 
        'H' => array('name' => 'calle', 'label' => 'Calle'), 
        'I' => array('name' => 'altura', 'label' => 'Altura'), 
        'J' => array('name' => 'piso','label' => 'Piso'), 
        'K' => array('name' => 'barrio', 'label' => 'Barrio'), 
        'L' => array('name' => 'comuna', 'label' => 'Comuna'), 
    );

}

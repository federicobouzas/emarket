<?php

class PoblacionsController extends AppController {
    
    public $sl_poblaciones = array(
        'actions' => array('V' => 'view', 'E' => 'edit'),
        'filters' => array(
            array('name' => 'Poblacion.nombre', 'label' => 'Nombre'),
            array('name' => 'activa', 'label' => 'Activa', 'presentation' => 'SINO'),
        ),
        'columns' => array(
            array('name' => 'Poblacion.nombre', 'label' => 'Nombre'),
            array('name' => 'activa', 'label' => 'Activa', 'presentation' => 'SINO'),
        )
    );
    public $maint_poblaciones = array(
        'data' => array(
            array(
                'type' => 'fieldset',
                'title' => 'Descripción de la Población',
                'fields' => array(
                    array('name' => 'fecha_carga', 'label' => 'Fecha Carga', 'presentation' => 'DATETIME', 'classparams' => '{"force":true}', 'isvisible' => false, 'actions' => 'A'),
                    array('name' => 'user_id', 'label' => 'Usuario Carga', 'presentation' => 'USER', 'classparams' => '{"force":true}', 'isvisible' => false, 'actions' => 'A'),
                    array('name' => 'nombre', 'label' => 'Nombre'),
                    array('name' => 'activa', 'label' => 'Activa', 'presentation' => 'SINO', 'initialvalue' => 'Si'),
                ),
            ),
        /*
          array(
          'type' => 'table',
          'assoc' => 'true',
          'paginate' => 'true',
          'title' => 'Roles que la Pueden Utilizar',
          'label' => 'Rol',
          'model' => 'Approl',
          'fields' => array(
          array('name' => 'nombre', 'label' => 'Rol'),
          ),
          'order' => array('Approl.nombre ASC'),
          ),
         */
        ),
    );

    public function add() {
        $this->maint = $this->maint_poblaciones;
        parent::add();
    }

    public function edit($id = null) {
        $this->maint = $this->maint_poblaciones;
        parent::edit($id);
    }

    public function index($last = false) {
        $this->search_list = $this->sl_poblaciones;
        parent::index($last);
    }

    public function view($id = null) {
        $this->maint = $this->maint_poblaciones;
        parent::view($id);
    }

}
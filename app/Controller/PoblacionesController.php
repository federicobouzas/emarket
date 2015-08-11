<?php

class PoblacionesController extends AppController {

    public function add($return = null) {        
        $this->maint = Parse::getData('Poblaciones/PoblacionesMaint');
        parent::add($return);
    }

    public function edit($id = null, $return = null) {
        $this->maint = Parse::getData('Poblaciones/PoblacionesMaint');
        parent::edit($id, $return);
    }

    public function index($last = false) {
        $this->search_list = Parse::getData('Poblaciones/PoblacionesSL');
        parent::index($last);
    }

    public function view($id = null, $return = null) {
        $this->maint = Parse::getData('Poblaciones/PoblacionesMaint');
        parent::view($id, $return);
    }

}
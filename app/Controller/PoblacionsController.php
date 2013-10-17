<?php

class PoblacionsController extends AppController {

    public function add($return = null) {
        $this->maint = getData('Poblacions/PoblacionsMaint');
        parent::add($return);
    }

    public function edit($id = null, $return = null) {
        $this->maint = getData('Poblacions/PoblacionsMaint');
        parent::edit($id, $return);
    }

    public function index($last = false) {
        $this->search_list = getData('Poblacions/PoblacionsSL');
        parent::index($last);
    }

    public function view($id = null, $return = null) {
        $this->maint = getData('Poblacions/PoblacionsMaint');
        parent::view($id, $return);
    }

}
<?php

class PoblacionsController extends AppController {

    public function add() {
        $this->maint = getData('Poblacions/PoblacionsMaint');
        parent::add();
    }

    public function edit($id = null) {
        $this->maint = getData('Poblacions/PoblacionsMaint');
        parent::edit($id);
    }

    public function index($last = false) {
        $this->search_list = getData('Poblacions/PoblacionsSL');
        parent::index($last);
    }

    public function view($id = null) {
        $this->maint = getData('Poblacions/PoblacionsMaint');
        parent::view($id);
    }

}
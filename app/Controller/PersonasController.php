<?php

class PersonasController extends AppController {

    public function import() {
        $this->maint = getData('Personas/PersonasImportarMaint');
        $this->importar = getDataImportar('Personas/PersonasImportarMaint');
        parent::importar('tmp_excel');
    }

    public function add() {
        $this->maint = getData('Personas/PersonasMaint');
        parent::add();
    }

    public function edit($id = null) {
        $this->maint = getData('Personas/PersonasMaint');
        parent::edit($id);
    }

    public function index($last = false) {
        $this->search_list = getData('Personas/PersonasSL');
        parent::index($last);
    }

    public function view($id = null) {
        $this->maint = getData('Personas/PersonasMaint');
        parent::view($id);
    }

}
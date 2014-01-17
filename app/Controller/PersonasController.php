<?php

class PersonasController extends AppController {

    public function import() {
        $this->maint = Parse::getData('Personas/PersonasImportarMaint');
        $this->importar = Parse::getDataImportar('Personas/PersonasImportarMaint');
        parent::importar('tmp_excel');
    }

    public function add($return = null) {
        $this->maint = Parse::getData('Personas/PersonasMaint');
        parent::add($return);
    }

    public function edit($id = null, $return = null) {
        $this->maint = Parse::getData('Personas/PersonasMaint');
        parent::edit($id, $return);
    }

    public function index($last = false) {
        if ($this->request->is('post') || $this->request->is('put')) {
            if (isset($this->request->data['Cake']['_output']) && $this->request->data['Cake']['_output'] != "html") {
                $this->Persona->recursive = -1;
            }
        }
        $this->search_list = Parse::getData('Personas/PersonasSL');
        parent::index($last);
    }

    public function view($id = null, $return = null) {
        $this->maint = Parse::getData('Personas/PersonasMaint');
        parent::view($id, $return);
    }

}
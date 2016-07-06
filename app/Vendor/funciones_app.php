<?php

function getPersonaEmail($persona) {
    if (isset($persona['Persona']['email'])) {
        return $persona['Persona']['email'];
    }
    return '';
}

function getPersonasFromParams($params, $type = "count") {
    $conditions = [];
    $joins = [];
    if (!empty($params->sexo)) {
        $conditions["Persona.sexo"] = $params->sexo;
    }
    if (!empty($params->comuna)) {
        $conditions["Persona.comuna"] = explode(",", $params->comuna);
    }
    if (!empty($params->barrio)) {
        $conditions["Persona.barrio"] = explode(",", $params->barrio);
    }
    if (!empty($params->poblacion)) {
        $conditions["per_personas_poblaciones.poblacion_id"] = explode(",", $params->poblacion);
        $joins[] = ['table' => 'per_personas_poblaciones', 'conditions' => ['per_personas_poblaciones.persona_id = Persona.id']];
    }
    if (!empty($params->edad_hasta) && is_numeric($params->edad_hasta)) {
        $conditions["Persona.fecha_nacimiento >"] = (date("Y") - (int) $params->edad_hasta - 1) . "-" . date("m") . "-" . date("d");
    }
    if (!empty($params->edad_desde) && is_numeric($params->edad_desde)) {
        $conditions["Persona.fecha_nacimiento <="] = (date("Y") - (int) $params->edad_desde) . "-" . date("m") . "-" . date("d");
    }
    App::uses("Persona", "Model");
    $personaObj = new Persona();
    return $personaObj->find($type, ['conditions' => $conditions, 'joins' => $joins, 'group' => 'Persona.id']);
}

<?php

function getPersonaEmail($persona) {
    if (isset($persona['Persona']['email'])) {
        return $persona['Persona']['email'];
    }
    return '';
}
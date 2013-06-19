<?php

App::uses('pst_checkbox', 'Presentation');

class pst_barrios_checkbox extends pst_checkbox {

    public function __construct($settings) {
        $this->options = array(
            "Agronomía" => "Agronomía",
            "Almagro" => "Almagro",
            "Balvanera" => "Balvanera",
            "Barracas" => "Barracas",
            "Belgrano" => "Belgrano",
            "Boedo" => "Boedo",
            "Caballito" => "Caballito",
            "Chacarita" => "Chacarita",
            "Coghlan" => "Coghlan",
            "Colegiales" => "Colegiales",
            "Constitución" => "Constitución",
            "Flores" => "Flores",
            "Floresta" => "Floresta",
            "La Boca" => "La Boca",
            "La Paternal" => "La Paternal",
            "Liniers" => "Liniers",
            "Mataderos" => "Mataderos",
            "Monte Castro" => "Monte Castro",
            "Montserrat" => "Montserrat",
            "Nueva Pompeya" => "Nueva Pompeya",
            "Nuñez" => "Nuñez",
            "Palermo" => "Palermo",
            "Parque Avellaneda" => "Parque Avellaneda",
            "Parque Chacabuco" => "Parque Chacabuco",
            "Parque Chas" => "Parque Chas",
            "Parque Patricios" => "Parque Patricios",
            "Puerto Madero" => "Puerto Madero",
            "Recoleta" => "Recoleta",
            "Retiro" => "Retiro",
            "Saavedra" => "Saavedra",
            "San Cristóbal" => "San Cristóbal",
            "San Nicolás" => "San Nicolás",
            "San Telmo" => "San Telmo",
            "Vélez Sarsfield" => "Vélez Sarsfield",
            "Versalles" => "Versalles",
            "Villa Crespo" => "Villa Crespo",
            "Villa del Parque" => "Villa del Parque",
            "Villa Devoto" => "Villa Devoto",
            "Villa General Mitre" => "Villa General Mitre",
            "Villa Lugano" => "Villa Lugano",
            "Villa Luro" => "Villa Luro",
            "Villa Ortúzar" => "Villa Ortúzar",
            "Villa Pueyrredón" => "Villa Pueyrredón",
            "Villa Real" => "Villa Real",
            "Villa Riachuelo" => "Villa Riachuelo",
            "Villa Santa Rita" => "Villa Santa Rita",
            "Villa Soldati" => "Villa Soldati",
            "Villa Urquiza" => "Villa Urquiza"
        );
        
        parent::__construct($settings);
    }

}
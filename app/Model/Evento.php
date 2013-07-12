<?php

class Evento extends AppModel {

    public $label = 'Eventos';
    //public $tablePrefix = 'per_';
    public $useTable = 'cam_eventos';
    public $displayField = 'nombre';
    //public $recursive = -1;
    public $belongsTo = array('Campania');
    public $validate = array(
        'nombre' => array(
            'required' => array(
                'rule' => array('notEmpty'),
                'message' => 'El nombre de la encuesta es requerido'
            )
        ),
        'fecha_hora_evento' => array(
            'required' => array(
                'rule' => array('notEmpty'),
                'message' => 'La fecha y hora del evento son requeridos'
            )
        ),
        'direccion' => array(
            'required' => array(
                'rule' => array('notEmpty'),
                'message' => 'La dirección del evento es requerida'
            )
        )
    );

    public function replaceVars($campania = null, $persona = null, $hash = null, $string = null) {
        $get_evento = $this->Query("SELECT evento_id FROM cam_campanias WHERE id=".$campania);
        $evento = $this->findById($get_evento[0]['cam_campanias']['evento_id']);
                
        $replace = array(
            date("d/m/Y H:i", strtotime($evento['Evento']['fecha_hora_evento'])),
            $evento['Evento']['direccion'],
            'http://maps.google.com/maps/api/staticmap?center=' . $evento['Evento']['coordenadas'] . '&zoom=16&size=400x300&maptype=roadmap&markers=' . $evento['Evento']['coordenadas'] . '&sensor=false',
            $this->generateLink($campania, $persona, $hash, 'Si'),
            $this->generateLink($campania, $persona, $hash, 'No'),
        );

        $search = array("#FECHA_HORA#", "#LUGAR#", "#URL_MAPA#", "#URL_ASISTE#", "#URL_NO_ASISTE#");
        return str_replace($search, $replace, $string);
    }

    public function generateLink($campania = null, $persona = null, $hash = null, $asistencia = null) {
        if (empty($campania) || empty($persona) || empty($hash) || empty($asistencia)) {
            return "javascript:void(0);";
        }
        
        $get_config = $this->Query("SELECT * FROM sys_configurations LIMIT 1");
        $config = $get_config[0]['sys_configurations'];
        $web = 'http://' . $config['web'] . WWW;
        
        $htmlHelper = new HtmlHelper(new View());
        $path = array('controller' => 'eventos', 'action' => 'asistencia', $campania, $persona, $hash, $asistencia);
        return substr($web, 0, strlen($web) - 1) . $htmlHelper->url($path);
    }

}
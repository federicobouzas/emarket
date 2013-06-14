<?php

class Encuesta extends AppModel {

    public $label = 'Encuestas';
    public $tablePrefix = 'cam_';
    public $useTable = 'encuestas';
    public $displayField = 'nombre';
    public $recursive = -1;
    public $hasMany = array(
        'Pregunta' => array(
            'className' => 'Pregunta',
            'foreignKey' => 'encuesta_id',
            'order' => 'Pregunta.orden ASC',
            'dependent' => true
        )
    );
    public $belongsTo = array('Campania');
    public $validate = array(
        'nombre' => array(
            'required' => array(
                'rule' => array('notEmpty'),
                'message' => 'El nombre de la encuesta es requerido'
            )
        )
    );
    
    public function replaceVars($campania = null, $persona = null, $hash = null, $string = null) {
        $replace = array(
            $this->generateLink($campania, $persona, $hash),
        );

        $search = array("#URL_ENCUESTA#");
        return str_replace($search, $replace, $string);
    }
    
    public function generateLink($campania = null, $persona = null, $hash = null) {
        if (empty($campania) || empty($persona) || empty($hash)) {
            return "javascript:void(0);";
        }
        
        $get_config = $this->Query("SELECT * FROM sys_configurations LIMIT 1");
        $config = $get_config[0]['sys_configurations'];
        $web = 'http://' . $config['web'] . WWW;
        
        $htmlHelper = new HtmlHelper(new View());
        $path = array('controller' => 'encuestas', 'action' => 'answer', $campania, $persona, $hash);
        return substr($web, 0, strlen($web) - 1) . $htmlHelper->url($path);
    }

}
<?php

class Campania extends AppModel {

    public $label = 'Campañas';
    public $tablePrefix = 'cam_';
    public $useTable = 'campanias';
    public $displayField = 'nombre';
    public $recursive = -1;
    public $belongsTo = array('Encuesta', 'Evento');
    public $hasAndBelongsToMany = array(
        /*
          'Poblacion' => array(
          'className' => 'Poblacion',
          'joinTable' => 'cam_campanias_poblaciones',
          'foreignKey' => 'campania_id',
          'associationForeignKey' => 'poblacion_id',
          'unique' => true
          ),
         */
        'Persona' => array(
            'className' => 'Persona',
            'joinTable' => 'cam_campanias_personas',
            'foreignKey' => 'campania_id',
            'associationForeignKey' => 'persona_id',
            'unique' => true
        )
    );
    public $validate = array(
        'nombre' => array(
            'required' => array(
                'rule' => array('notEmpty'),
                'message' => 'El nombre de la campaña es requerido'
            )
        ),
        'activa' => array(
            'required' => array(
                'rule' => array('notEmpty'),
                'message' => 'Debe indicar si la campaña está activa'
            )
        ),
        'tipo' => array(
            'required' => array(
                'rule' => array('notEmpty'),
                'message' => 'El tipo de campaña es requerido'
            )
        ),
        'sms' => array(
            'required' => array(
                'rule' => array('notEmpty'),
                'message' => 'Debe indicar si se utilizarán sms para el envio'
            )
        ),
        'email' => array(
            'required' => array(
                'rule' => array('notEmpty'),
                'message' => 'Debe indicar si se utilizarán emails para el envio'
            )
        ),
        'server_id' => array(
            'required' => array(
                'rule' => array('notEmpty'),
                'message' => 'La cuenta de envío es requerida'
            )
        ),
        'fecha_envio' => array(
            'required' => array(
                'rule' => array('notEmpty'),
                'message' => 'La fecha de envío es requerida'
            )
        )
    );

    public function replaceVars($string, $replace) {
        $search = array("#NOMBRE#", "#APELLIDO#", "#URL_UNSUBSCRIBE#");
        return str_replace($search, $replace, $string);
    }

    public function generateUnsubscribeLink($campania_id = null, $persona_id = null, $hash = null) {
        if (empty($campania_id) || empty($persona_id) || empty($hash)) {
            return "javascript:void(0);";
        }

        $get_config = $this->Query("SELECT * FROM sys_configurations LIMIT 1");
        $config = $get_config[0]['sys_configurations'];
        $web = 'http://' . $config['web'] . WWW;

        $htmlHelper = new HtmlHelper(new View());
        $path = array('controller' => 'campanias', 'action' => 'unsubscribe', $campania_id, $persona_id, $hash);
        return substr($web, 0, strlen($web) - 1) . $htmlHelper->url($path);
    }

    public function trackLinks($campania_id, $html_str) {
        App::import('Vendor', 'simple_html_dom');
        $vars = array("#", "#URL_UNSUBSCRIBE#", "#URL_ENCUESTA#", "#URL_MAPA#", "#URL_ASISTE#", "#URL_NO_ASISTE#");
        $used_links = array();

        $html = str_get_html(html_entity_decode($html_str));
        foreach ($html->find('a') as $element) {
            if (!in_array($element->href, $vars) && !in_array($element->href, $used_links)) {
                $this->Query("INSERT INTO cam_links (campania_id, link) VALUES (" . $campania_id . ", '" . $element->href . "')");

                $link_id = $this->getDataSource()->lastInsertId();
                $used_links[$link_id] = $element->href;
            }
        }

        return $used_links;
    }

    public function replaceLinks($campania_id, $persona_id, $html_str, $links) {
        $get_config = $this->Query("SELECT * FROM sys_configurations LIMIT 1");
        $config = $get_config[0]['sys_configurations'];
        $web = 'http://' . $config['web'];
        
        foreach ($links as $link_id => $link) {
            $hash = md5("GCBA|" . $campania_id . "|" . $persona_id);
            $tracked_link = $web . WWW . "campanias/followLink/" . $link_id . "/" . $persona_id . "/" . $hash;
            $html_str = str_replace("\"" . $link . "\"", "\"" . $tracked_link . "\"", $html_str);
        }
        
        return $html_str;
    }

    /*
      public function beforeFind($queryData) {
      $user_id = $_SESSION['Auth']['User']['id'];
      $rol_id = $_SESSION['Auth']['User']['Rol']['id'];

      if (is_null($queryData['conditions'])) {
      $queryData['conditions'] = array();
      }
      if (is_null($queryData['group'])) {
      $queryData['group'] = array();
      }
      if (is_null($queryData['joins'])) {
      $queryData['joins'] = array();
      }

      $queryData['joins'][] = array(
      'table' => 'cam_campanias_poblaciones',
      'alias' => 'CampaniasPoblaciones',
      'type' => 'LEFT',
      'foreignKey' => false,
      'conditions' => array(
      'CampaniasPoblaciones.campania_id = Campania.id'
      )
      );
      $queryData['group'][] = 'Campania.id';
      $queryData['conditions'][] = array(
      'OR' => array(
      array('CampaniasPoblaciones.poblacion_id IN (SELECT poblacion_id FROM per_poblaciones_rols WHERE rol_id= ' . $rol_id . ')'),
      //array('CampaniasPoblaciones.poblacion_id' => null)
      array('Campania.user_id' => $user_id)
      )
      );

      return $queryData;
      }
     */
}
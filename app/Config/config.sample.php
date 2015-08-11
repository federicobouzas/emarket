<?php

if (!defined('CAKE_FRAMEWORK')) {
    define('CAKE_FRAMEWORK', DS . 'Users' . DS . 'danielalisanti' . DS . 'Sites' . DS . 'framework');
}

if (!defined('WWW')) {
    define('WWW', '/'); // no usar la constante DS
}

if (!class_exists('AppConfig')) {

    class AppConfig {

        public static $array = array(
            'push_server' => array(
                'enabled' => false,
                'debug' => true,
                'ssl' => false,
                'host' => '127.0.0.1',
                'port' => 8000,
                'system' => 'framework'
            ),
            'maint' => array(
                'js_validation' => true,
            ),
            'search_list' => array(
                'export' => true,
            ),
            'site' => array(
                'serial' => 'A1276-26A96-50E23-11C99-5292F-63267-95065-B6018',
                'ajax' => array(
                    'enabled' => false,
                    'loading' => "Cargando contenido",
                ),
            ),
            'users' => array(
                'login' => array(
                    'ban' => false,
                    'forget' => true,
                ),
            ),
        );

        public static function get($str, $default = null) {
            $pointer = self::$array;
            $parts = explode(".", $str);
            foreach ($parts as $part) {
                if (!isset($pointer[$part])) {
                    return $default;
                }
                $pointer = $pointer[$part];
            }
            return $pointer;
        }

    }

}
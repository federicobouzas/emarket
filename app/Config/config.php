<?php

if (!defined('DS')) {
    define('DS', DIRECTORY_SEPARATOR);
}

if (!defined('CAKE_FRAMEWORK')) {
    define('CAKE_FRAMEWORK', 'C:' . DS . 'xampp' . DS . 'htdocs' . DS . 'framework');
}

if (!defined('WWW')) {
    define('WWW', '/'); // no usar la constante DS
}

if (!class_exists('AppConfig')) {

    class AppConfig {

        public static $array = array(
            'site' => array(
                'serial' => 'A88B7-DCD1A-9E3E1-7770B-BAA6D-7515B-31A2D-7E85D'
            ),
            'users' => array(
                'login' => array(
                    'ban' => true,
                    'forget' => true,
                ),
            ),
        );

    }

}
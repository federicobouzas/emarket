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
            'ban' => true
        );

    }

}

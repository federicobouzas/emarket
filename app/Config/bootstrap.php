<?php

/**
 * Cache Engine Configuration
 * Default settings provided below
 */
Cache::config('default', array('engine' => 'File', 'mask' => 0777));

/**
 * You can attach event listeners to the request lifecyle as Dispatcher Filter . By Default CakePHP bundles two filters:
 *
 * - AssetDispatcher filter will serve your asset files (css, images, js, etc) from your themes and plugins
 * - CacheDispatcher filter will read the Cache.check configure variable and try to serve cached content generated from controllers
 *
 */
Configure::write('Dispatcher.filters', array(
    'AssetDispatcher',
    'CacheDispatcher'
));

/**
 * Configures default file logging options
 */
App::uses('CakeLog', 'Log');
CakeLog::config('debug', array(
    'engine' => 'FileLog',
    'types' => array('notice', 'info', 'debug'),
    'file' => 'debug',
    'mask' => 0777,
));
CakeLog::config('error', array(
    'engine' => 'FileLog',
    'types' => array('warning', 'error', 'critical', 'alert', 'emergency'),
    'file' => 'error',
    'mask' => 0777,
));
CakeLog::config('otherFile', array(
    'engine' => 'FileLog',
    'model' => 'LogEntry',
    'mask' => 0777,
));

if (!defined('CAKE_FRAMEWORK')) {
    App::import('Config', 'config');
    require_once('config.php');
}

Inflector::rules('plural', array('irregular' => array(
        'poblacion' => 'Poblaciones',
)));

Inflector::rules('singular', array('irregular' => array(
        'poblaciones' => 'Poblacion',
)));
/*
 * Para manejar los errores de bloqueo
 */
App::uses('BloqueoException', 'Lib');

/*
 * Path to the application's presentations directory.
 */
App::build(array('Presentation' => array('%s' . 'Presentation' . DS)), App::REGISTER);

/*
 * Path to the model's data and XML directory.
 */
App::build(array('Data' => array('%s' . 'Model' . DS . 'Data' . DS)), App::REGISTER);
App::build(array('XML' => array('%s' . 'Model' . DS . 'XML' . DS)), App::REGISTER);

/*
 * Paths to framework
 */
App::build(array(
    'Model' => array(CAKE_FRAMEWORK . DS . 'app' . DS . 'Model' . DS),
    'Controller' => array(CAKE_FRAMEWORK . DS . 'app' . DS . 'Controller' . DS),
    'View' => array(CAKE_FRAMEWORK . DS . 'app' . DS . 'View' . DS),
    'View/Helper' => array(CAKE_FRAMEWORK . DS . 'app' . DS . 'View' . DS . 'Helper' . DS),
    'Plugin' => array(CAKE_FRAMEWORK . DS . 'app' . DS . 'Plugin' . DS),
    'Lib' => array(CAKE_FRAMEWORK . DS . 'app' . DS . 'Lib' . DS),
    'Vendor' => array(CAKE_FRAMEWORK . DS . 'app' . DS . 'Vendor' . DS),
    'Presentation' => array(CAKE_FRAMEWORK . DS . 'app' . DS . 'Presentation' . DS),
    'Data' => array(CAKE_FRAMEWORK . DS . 'app' . DS . 'Model' . DS . 'Data' . DS),
    'XML' => array(CAKE_FRAMEWORK . DS . 'app' . DS . 'Model' . DS . 'XML' . DS),
    'Model/Behavior' => array(CAKE_FRAMEWORK . DS . 'app' . DS . 'Model' . DS . 'Behavior' . DS),
    'Controller/Component' => array(CAKE_FRAMEWORK . DS . 'app' . DS . 'Controller' . DS . 'Component' . DS),
    'Model/Datasource' => array(CAKE_FRAMEWORK . DS . 'app' . DS . 'Model' . DS . 'Datasource' . DS),
    'Model/Datasource/Database' => array(CAKE_FRAMEWORK . DS . 'app' . DS . 'Model' . DS . 'Datasource' . DS . 'Database' . DS),
    'Model/Datasource/Session' => array(CAKE_FRAMEWORK . DS . 'app' . DS . 'Model' . DS . 'Datasource' . DS . 'Session' . DS),
    'Controller/Component/Auth' => array(CAKE_FRAMEWORK . DS . 'app' . DS . 'Controller' . DS . 'Component' . DS . 'Auth' . DS),
    'Controller/Component/Acl' => array(CAKE_FRAMEWORK . DS . 'app' . DS . 'Controller' . DS . 'Component' . DS . 'Acl' . DS),
    'Console' => array(CAKE_FRAMEWORK . DS . 'app' . DS . 'Console' . DS),
    'Console/Command' => array(CAKE_FRAMEWORK . DS . 'app' . DS . 'Console' . DS . 'Command' . DS),
    'Console/Command/Task' => array(CAKE_FRAMEWORK . DS . 'app' . DS . 'Console' . DS . 'Command' . DS . 'Task' . DS),
    'Locale' => array(CAKE_FRAMEWORK . DS . 'app' . DS . 'Locale' . DS),
        ), App::APPEND);

/*
 * Load Plugins
 */
CakePlugin::loadAll();

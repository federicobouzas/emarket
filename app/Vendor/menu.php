<?php

global $MENU;

$MENU = array(
    'Inicio' => array(
        'Inicio' => WWW,
        'Mis Datos' => 'users|datosPersonales|admin'
    ),
    'Persona' => array(
        'Cargar Persona' => 'personas|add',
        'Importar Personas' => 'personas|import',
        'Consultar Personas' => 'personas|index',
        /*
        'Poblaciones' => array(
            'Cargar Población' => 'poblacions|add',
            'Consultar Poblaciones' => 'poblacions|index'
        ),
        */
    ),
    'Campañas' => array(
        'Cargar Campaña' => 'campanias|add',
        'Consultar Campañas' => 'campanias|index',
        'Reportes de Campañas' => 'campanias|report',
        'Encuestas' => array(
            'Cargar Encuesta' => 'encuestas|add',
            'Consultar Encuestas' => 'encuestas|index'
        ),
        'Eventos' => array(
            'Cargar Evento' => 'eventos|add',
            'Consultar Eventos' => 'eventos|index'
        ),
    ),
    'Administración' => array(
        'Configuración' => 'configurations|edit/1|admin',
        'Mensajería' => array(
            'Servidores' => array(
                'Cargar Servidor' => 'servers|add|messaging',
                'Consultar Servidores' => 'servers|index|messaging'
            ),
            'Templates' => array(
                'Cargar Template' => 'templates|add|messaging',
                'Consultar Templates' => 'templates|index|messaging'
            ),
            'Consultar Emails Entrantes' => 'entrantes|index|messaging',
            'Consultar Emails Salientes' => 'mensajes|emails|messaging',
            'Consultar SMS' => 'mensajes|sms|messaging'
        ),
        'Sistema' => array(
            'Consultar Logs' => 'logs|index|system',
            'Estados' => array(
                'Cargar Estado' => 'estados|add|system',
                'Consultar Estados' => 'estados|index|system',
            ),
        ),
        'Usuarios' => array(
            'Cargar Usuario' => 'users|add|admin',
            'Consultar Usuarios' => 'users|index|admin'
        ),
        'Roles' => array(
            'Cargar Roles' => 'rols|add|admin',
            'Consultar Roles' => 'rols|index|admin'
        ),
        'Permisos' => array(
            'Cargar Permiso' => 'permisos|add|admin',
            'Consultar Permisos' => 'permisos|index|admin',
            'Consultar Globales' => 'permisos|indexGlobales|admin'
        ),
        'Botones' => array(
            'Cargar Botón' => 'buttons|add|admin',
            'Consultar Botones' => 'buttons|index|admin'
        )
    )
);
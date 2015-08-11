SET FOREIGN_KEY_CHECKS = 0;

-- ACCESO
DELETE FROM acc_users WHERE id != 1;
ALTER TABLE acc_users AUTO_INCREMENT = 2;
DELETE FROM acc_users_rols WHERE user_id != 1;
TRUNCATE TABLE acc_users_recovers;

-- DASHBOARD
TRUNCATE TABLE das_charts;
TRUNCATE TABLE das_gauges;
TRUNCATE TABLE das_kpis;

-- MENSAJERIA
TRUNCATE TABLE msg_entrantes;
TRUNCATE TABLE msg_mensajes;
TRUNCATE TABLE msg_notifications;
TRUNCATE TABLE msg_notifications_messages;
TRUNCATE TABLE msg_notifications_users;
TRUNCATE TABLE msg_servers;

-- SISTEMA
TRUNCATE TABLE sys_bans;
TRUNCATE TABLE sys_bloqueos;
TRUNCATE TABLE sys_compilations;
TRUNCATE TABLE sys_files;
TRUNCATE TABLE sys_logins;
TRUNCATE TABLE sys_logs;
UPDATE sys_estados SET valor = 0;

-- CAMPAÑAS
TRUNCATE TABLE cam_campanias;
TRUNCATE TABLE cam_campanias_personas;
TRUNCATE TABLE cam_campanias_poblaciones;
TRUNCATE TABLE cam_encuestas;
TRUNCATE TABLE cam_encuestas_preguntas;
TRUNCATE TABLE cam_encuestas_respuestas;
TRUNCATE TABLE cam_eventos;
TRUNCATE TABLE cam_eventos_asistencias;
TRUNCATE TABLE cam_links;
TRUNCATE TABLE cam_links_personas;

TRUNCATE TABLE per_personas;
TRUNCATE TABLE per_personas_poblaciones;
TRUNCATE TABLE per_poblaciones;
TRUNCATE TABLE per_poblaciones_rols;

SET FOREIGN_KEY_CHECKS = 1;
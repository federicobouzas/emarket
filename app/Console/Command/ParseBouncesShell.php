<?php

App::uses('Sanitize', 'Utility');
App::uses('Bounces', 'Lib');

class ParseBouncesShell extends AppShell {

    public $uses = array('FmwMessaging.Mensaje', 'FmwMessaging.Server');
    private $asuntosRebote = array(
        'The Post Office <postmaster@buenosaires.gob.ar>',
        'The Post Office <postmaster@fibertel.com.ar>',
        'postmaster@hotmail.com',
        'MAILER-DAEMON@arnet.com.ar',
        'MAILER-DAEMON@mxavas3-pc.aruba.it',
        'Servicio de entrega de correos <MAILER-DAEMON@sion.com>',
    );

    public function main() {
        $this->out("CRON DE OBTENCION DE EMAILS (" . date("H:i:s") . " DEL " . date("d/m/Y") . ")");

        $get_estado = $this->Mensaje->Query("SELECT valor FROM sys_estados WHERE nombre='parsing_bounces'");
        $corriendo = $get_estado[0]['sys_estados']['valor'];

        if ($corriendo) {
            $this->out("EL CRON SE ENCUENTRA EN FUNCIONAMIENTO, NO SE REALIZAN PARSES");
            return false;
        }

        // Cambio el flag de estado a 1
        $this->Mensaje->Query("UPDATE sys_estados SET valor='1' WHERE nombre='parsing_bounces'");

        $total = 0;
        $now = date('Y-m-d H:i:s');
        $bounce = new Bounces;

        $servers = $this->Server->Query("SELECT * FROM msg_servers WHERE tipo='POP3' OR tipo='IMAP'");
        foreach ($servers as $server) {
            $server = $server['msg_servers'];

            $mailbox = $server['host'] . ":" . $server['puerto'] . "/" . strtoupper($server['tipo']);
            $mailbox.= ($server['ssl'] == 'Si' ? '/ssl' : '');
            $mailbox.= (empty($server['adicionales']) ? '' : $server['adicionales']);
            $mbox = @imap_open("{" . $mailbox . "}INBOX", $server['usuario'], $server['clave']);

            // Si no puede conectar sigue con el proximo servidor
            if ($mbox === false) {
                break;
            }

            $MC = @imap_check($mbox);

            // Si no hay mensajes sigue con el proximo servidor
            if ($MC->Nmsgs == 0) {
                break;
            }

            $result = @imap_fetch_overview($mbox, "1:" . $MC->Nmsgs, 0);
            foreach ($result as $overview) {
                // Si esta borrado ya le realice el parse
                if ($overview->deleted) {
                    continue;
                }

                // Es un rebote?
                if (in_array($overview->from, $this->asuntosRebote)) {
                    $body = @imap_body($mbox, $overview->msgno);
                    // Si el contenido esta vacio no me sirve
                    if (!$body) {
                        continue;
                    }

                    $parse = $bounce->parseMail($body);

                    if (!empty($parse['campania']) && !empty($parse['persona']) && is_numeric($parse['campania']) && is_numeric($parse['persona'])) {
                        $error = '0.0.0';
                        if (!empty($parse['error']['code'])) {
                            $error = $parse['error']['code'];
                        }
                        $this->Mensaje->Query("UPDATE cam_campanias_personas 
                                               SET error='" . $parse['error']['code'] . "', error_tipo='" . $parse['error']['type'] . "'
                                               WHERE campania_id=" . $parse['campania'] . " AND persona_id=" . $parse['persona']);

                        // Si el error es de hard lo desactivo, sino sumo un error a la persona
                        if ($parse['error']['type'] == 'Hard') {
                            $this->Mensaje->Query("UPDATE per_personas SET activa='No' WHERE id=" . $parse['persona']);
                        } else {
                            $this->Mensaje->Query("UPDATE per_personas SET errores=errores+1 WHERE id=" . $parse['persona']);
                        }

                        // Si tiene 5 errores o mas lo dejo inactivo
                        $cant_errores = $this->Mensaje->Query("SELECT errores FROM per_personas WHERE id=" . $parse['persona']);
                        if (count($cant_errores) && $cant_errores[0]['per_personas']['errores'] >= 5) {
                            $this->Mensaje->Query("UPDATE per_personas SET activa='No' WHERE id=" . $parse['persona']);
                        }
                    }

                    $remitente = Sanitize::escape($overview->from);
                    $asunto = Sanitize::escape($overview->subject);
                    $cuerpo = Sanitize::escape($body);

                    $sql = "INSERT INTO msg_entrantes (fecha_carga, fecha_mensaje, server_id, remitente, asunto, cuerpo)
                            VALUES ('" . $now . "', '" . $overview->date . "', " . $server['id'] . ", '" . $remitente . "', '" . $asunto . "', '" . $cuerpo . "')";
                    try {
                        $this->Mensaje->Query($sql);
                        imap_delete($mbox, $overview->msgno);
                        imap_expunge($mbox);
                        $total++;
                    } catch (Exception $ex) {
                        continue;
                    }
                }
            }

            imap_close($mbox);
        }

        // Cambio el flag de estado a 0
        $this->Mensaje->Query("UPDATE sys_estados SET valor='0' WHERE nombre='parsing_bounces'");

        $this->out("RECIBIDOS: " . $total);
    }

}
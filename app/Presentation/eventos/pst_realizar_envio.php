<?php

App::uses('Presentation', 'Lib');

class pst_realizar_envio extends Presentation {

    public function renderReadOnly() {
        $titulo = "Confirmar Envío del Evento";
        $msj = "¿Está seguro que desea realizar el envío del evento?<br>Una vez confirmado no podrá volver atras.";
        $confim = "function(r) { if (r) { window.location='" . WWW . "eventos/realizarEnvio/" . $this->value . "'; } }";

        $html = '<a href="javascript:void(0);" onclick="jConfirm(\'' . $msj . '\', \'' . $titulo . '\',  ' . $confim . ');">';
        $html.= '<img src="/img/send.png" width="30" />';
        $html.= '</a>';

        return $html;
    }

}
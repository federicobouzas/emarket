<?php

App::uses('Presentation', 'Lib');

class pst_enviar_campania extends Presentation {

    public function renderReadOnly() {
        $onclick = 'jPrompt(\'Ingrese el email al que le enviará la campaña:\', \'\', \'Enviar Campaña\', function(r) {
                        if(r) {
                            var pattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;  
                            if (!pattern.test(r)) {
                                alert(\'El email ingresado no es válido.\');
                                return false;
                            }
                            window.location = \'' . WWW . 'campanias/send/' . $this->value . '/\' + r;
                        }
                    });';
        $html = '<a class="k-button" href="javascript:void(0);" onclick="' . $onclick . '">';
        $html.= '<span class="k-icon k-i-plus"></span>';
        $html.= '</a>';

        return $html;
    }

}
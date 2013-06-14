<?php

App::uses('Presentation', 'Presentation');

class pst_responder_encuesta extends Presentation {

    public function renderReadOnly() {
        $html = '<a class="k-button" href="'.WWW . 'encuestas/test/'.$this->value.'">';
        $html.= '<span class="k-icon k-i-tick"></span>';
        $html.= '</a>';

        return $html;
    }

}
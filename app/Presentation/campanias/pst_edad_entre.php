<?php

App::uses('Presentation', 'Presentation');

class pst_edad_entre extends Presentation {
    
    public function renderMaintForm() {
        $val = $this->getValue();
        $array_val = explode(",", $val);
        
        if ($this->readonly) {
            $this->html = true;
            return $this->renderReadOnly();
        }

        $html = '<div id="box' . $this->id . '" class="input ' . $this->type . ' ' . $this->required . '">';
        $html.= '<label for="' . $this->id . '">' . $this->label . '</label>';
        
        $html.= 'Desde: <input type="' . $this->type . '" name="' . $this->name . '[desde]" id="' . $this->id . 'Desde" ';
        if (!empty($this->class)) {
            $html.= 'class="' . $this->class . '"';
        }
        if (count($array_val) == 2) {
            $html.= 'value = "' . $array_val[0] . '" ';
        }
        $html.= 'size = "2" maxlength = "2" style = "width: auto;" />';
        
        $html.= 'Hasta: <input type="' . $this->type . '" name="' . $this->name . '[hasta]" id="' . $this->id . 'Hasta" ';
        if (!empty($this->class)) {
            $html.= 'class="' . $this->class . '"';
        }
        if (count($array_val) == 2) {
            $html.= 'value = "' . $array_val[1] . '" ';
        }
        $html.= 'size = "2" maxlength = "2" style = "width: auto;" />';
        
        if (!empty($this->note)) {
            $html.= '<div class="note">' . $this->note . '</div>';
        }
        $html.= '</div>';
        return $html;
    }
    
    public function renderReadOnly() {
        $val = $this->getValue();
        
        // Para los campos ocultos
        if (isset($this->isvisible) && !$this->isvisible) {
            return '<input type="hidden" name="' . $this->generateName() . '" id="' . $this->generateID() . '" value="' . $val . '" />';
        }
        
        $array_val = explode(",", $val);

        // Para los OP = Ver
        if ($this->html) {
            $html = '';
            $html.= ($this->table ? '<td>' : '');
            $html.= '<div id="box' . $this->id . '" class="input ' . $this->type . ' ' . $this->required . '">';
            $html.= '<input type="hidden" name="' . $this->generateName() . '" id="' . $this->generateID() . '" value="' . $val . '" />';
            $html.= '<label for="' . $this->id . '">' . $this->label . '</label>';
            if (count($array_val) == 2) {
                $html.= '<span class="field">Desde: ' . $array_val[0] . ' - Hasta: ' . $array_val[1] . '</span>';
            } else {
                $html.= '<span class="field">' . $val . '</span>';
            }
            
            $html.= '</div>';
            $html.= ($this->table ? '</td>' : '');
            return $html;
        }

        // Para las tablas asociadas
        if ($this->table) {
            $html = '';
            $html.= '<td>';
            $html.= '<input type="hidden" name="' . $this->generateName() . '" id="' . $this->generateID() . '" value="' . $val . '" />';
            $html.= 'Desde: ' . $array_val[0] . ' - Hasta: ' . $array_val[1];
            $html.= '</td>';
            return $html;
        }

        // Para los search and list
        return htmlspecialchars($this->getHelperValue());
    }
    
}

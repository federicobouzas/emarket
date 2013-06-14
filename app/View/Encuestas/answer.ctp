<?php
$this->Html->script('fmw/default/validation', array('inline' => false));
$this->Html->script('encuestas/answer', array('inline' => false));
$this->Validation->rules('Encuesta', array('formId' => 'Encuesta' . ucfirst($this->action) . 'Form'));
$num_pregunta = 0;
?>

<?php echo $this->Form->create($MODEL['name'], array("type" => "file")); ?>
    <?php foreach ($preguntas as $pregunta): $num_pregunta++; ?>
    <fieldset>
        <div class="titulo">
            <div style="font: 15px 'Lucida Grande',sans-serif;"><?= $num_pregunta ?>) <?= $pregunta['Pregunta']['pregunta'] ?></div>
        </div>

        <div id="boxPregunta<?= $pregunta['Pregunta']['id'] ?>" class="input text required">
            <?php
            $pregunta = $pregunta['Pregunta'];
            if ($pregunta['tipo'] == "simple") {
                echo '<input type="hidden" name="Encuesta[' . $num_pregunta . '][pregunta]" id="Encuesta[' . $num_pregunta . '][pregunta]" value="' . $pregunta['id'] . '" />';
                echo '<input type="hidden" name="Encuesta[' . $num_pregunta . '][tipo]" id="Encuesta[' . $num_pregunta . '][tipo]" value="simple" />';
                $opciones = explode(",", $pregunta['opciones']);
                $num_opcion = 0;
                foreach ($opciones as $opcion) {
                    $num_opcion++;
                    $opcion = trim($opcion);
                    echo '<label class="encuesta">';
                    echo '<input style="margin-top: 1px;" type="radio" name="Encuesta[' . $num_pregunta . '][valor]" id="Encuesta_' . $num_pregunta . '_' . $num_opcion . '" value="' . $opcion . '" />';
                    echo $opcion;
                    echo '</label>';
                }
            } elseif ($pregunta['tipo'] == "lista") {
                echo '<input type="hidden" name="Encuesta[' . $num_pregunta . '][pregunta]" id="Encuesta[' . $num_pregunta . '][pregunta]" value="' . $pregunta['id'] . '" />';
                echo '<input type="hidden" name="Encuesta[' . $num_pregunta . '][tipo]" id="Encuesta[' . $num_pregunta . '][tipo]" value="lista" />';
                echo '<select style="margin-top: 1px;" name="Encuesta[' . $num_pregunta . '][valor]" id="Encuesta_' . $num_pregunta . '">';
                echo '<option value=""></option>';
                $opciones = explode(",", $pregunta['opciones']);
                foreach ($opciones as $opcion) {
                    $opcion = trim($opcion);
                    echo '<option value="' . $opcion . '">' . $opcion . '</option>';
                }
                echo '</select>';
            } elseif ($pregunta['tipo'] == "multiple") {
                echo '<input type="hidden" name="Encuesta[' . $num_pregunta . '][pregunta]" id="Encuesta[' . $num_pregunta . '][pregunta]" value="' . $pregunta['id'] . '" />';
                echo '<input type="hidden" name="Encuesta[' . $num_pregunta . '][tipo]" id="Encuesta[' . $num_pregunta . '][tipo]" value="multiple" />';
                $opciones = explode(",", $pregunta['opciones']);
                $num_opcion = 0;
                foreach ($opciones as $opcion) {
                    $num_opcion++;
                    $opcion = trim($opcion);
                    echo '<label class="encuesta">';
                    echo '<input style="margin-top: 1px;" type="checkbox" name="Encuesta[' . $num_pregunta . '][valor][' . $num_opcion . ']" id="Encuesta_' . $num_pregunta . '_' . $num_opcion . '" value="' . $opcion . '" />';
                    echo $opcion;
                    echo '</label>';
                }
            } elseif ($pregunta['tipo'] == "texto") {
                echo '<input type="hidden" name="Encuesta[' . $num_pregunta . '][pregunta]" id="Encuesta[' . $num_pregunta . '][pregunta]" value="' . $pregunta['id'] . '" />';
                echo '<input type="hidden" name="Encuesta[' . $num_pregunta . '][tipo]" id="Encuesta[' . $num_pregunta . '][tipo]" value="texto" />';
                echo '<textarea name="Encuesta[' . $num_pregunta . '][valor]" id="Encuesta_' . $num_pregunta . '"></textarea>';
            }
            ?>
        </div>
    </fieldset>
<?php endforeach; ?>

<?php
if (strtolower($this->action) == "test") {
	$cancel_link = array('controller' => 'encuestas', 'action' => 'index');
}
else {
	$cancel_link = "http://javascript: window.open('', '_self', ''); window.close();";
}
?>

<?php echo $this->Form->end(__('Enviar')); ?>
<?php echo $this->Html->link(__('Cancelar'), $cancel_link, array('class' => 'cancelar')); ?>
</form>
<?php
$this->Html->script(WWW . "../includes/fmw/highstock/highstock", array('inline' => false));
$this->Html->script(WWW . "../includes/fmw/highcharts/modules/exporting", array('inline' => false));

$this->Html->script("fmw/default/reportes", array('inline' => false));
$this->Html->script("campanias/maint_reportes", array('inline' => false));
?>


<fieldset id="fieldset1">
    <div class="titulo">
        <div>Reporte de Campaña</div>
    </div>

    <div class="input select required" id="boxCampaniaId">
        <label for="CampaniaId">Nombre</label>
        <select name="data[Campania][id]" id="CampaniaId">
            <option value=""></option>
            <?php foreach ($campanias as $campania): debug($campania); ?>
                <option value="<?= $campania['Campania']['id'] ?>" <?= ($id == $campania['Campania']['id'] ? 'selected="selected"' : '') ?>><?= $campania['Campania']['nombre'] ?></option>
            <?php endforeach; ?>
        </select>
    </div>

    <div id="infoReporte1" style="padding: 30px; margin-bottom: 60px;">
        <div id="grafico1" style="width: 400px; height: 300px; float: left;"></div>
        <div id="labels">
            <div class="percent-container">
                <div class="percentData-container openedData">
                    <span class="percentSymbol">%</span><span class="label-porcentaje" id="label_porcentaje_abiertos"></span>
                </div>
                <div class="percentTotalOpened">
                    <span id="label_abiertos" class="countNumber"></span> ABIERTOS
                </div>                                               
            </div>
            <div class="percent-container">
                <div class="percentData-container unopenedData">  
                    <span class="percentSymbol">%</span><span class="label-porcentaje" id="label_porcentaje_no_abiertos"></span>
                </div>
                <div class="percentTotalOpened">
                    <span id="label_no_abiertos" class="countNumber"></span> NO ABIERTOS
                </div>
            </div>                          
            <div class="percent-container">
                <div class="percentData-container bouncedData">
                    <span class="percentSymbol">%</span><span class="label-porcentaje" id="label_porcentaje_error"></span>
                </div>
                <div class="percentTotalOpened">
                    <span id="label_error" class="countNumber countNumberBounced"></span>
                    <div class="bouncedType-container">
                        <span id="label_error_hard"></span> HARD
                        <hr class="bouncedSeparator">
                        <span id="label_error_soft"></span> SOFT
                    </div>
                </div>
            </div>                          
        </div>
        <div id="resumen">
            <span class="resumen-titulo">Resumen de la Campaña</span>
            <ul class="resumen-lista">
                <li>Total de Suscriptores <span id="total_suscriptores"></span></li>
                <li>Emails Entregados<span id="emails_entregados"></span></li>
                <li>Aperturas<span id="aperturas"></span></li>
                <li>Última Apertura <span id="ultima_apertura"></span></li>
                <li>Clicks <span id="clicks"></span></li>
                <li>Último Click <span id="ultimo_click"></span></li>
            </ul>
        </div>
    </div>
</fieldset>

<fieldset id="fieldset4">
    <div class="titulo">
        <div>Aperturas y Clicks por Día</div>
    </div>

    <div id="infoReporte6" style="padding: 30px;">
        <div id="grafico6" style="width: 1000px; height: 400px;"></div>
    </div>
</fieldset>

<fieldset id="fieldset2">
    <div class="titulo">
        <div>Trackeo de Hipervínculos</div>
    </div>

    <div id="infoReporte4" style="padding: 30px;">
        <div id="grafico4" style="width: 1000px; height: 300px;"></div>
    </div>
</fieldset>

<fieldset id="fieldset3">
    <div class="titulo">
        <div>Preguntas de la Encuesta</div>
    </div>

    <div class="input select required" id="boxPreguntaId">
        <label for="PreguntaId">Pregunta</label>
        <select name="data[Pregunta][id]" id="PreguntaId">
            <option value=""></option>
        </select>
    </div>

    <div id="infoReporte5" style="padding: 30px;">
        <div id="grafico5" style="width: 1000px; height: 300px;"></div>
    </div>

</fieldset>

<fieldset id="fieldset5">
    <div class="titulo">
        <div>Asistencias al Evento</div>
    </div>

    <div id="infoReporte2" style="padding: 30px;">
        <div id="grafico2" style="width: 400px; height: 300px;"></div>
    </div>

</fieldset>
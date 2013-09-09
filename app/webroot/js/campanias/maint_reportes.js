$(function() {
    $("#CampaniaId").change(function() {
        $("#fieldset3").hide();
        $("#fieldset5").hide();
        $("#PreguntaId").html('<option value=""></option>');

        if (empty(this.value)) {
            $("#infoReporte1").hide();
            $("#fieldset2").hide();
            $("#fieldset4").hide();
            return;
        }

        $("#infoReporte1").show();
        $("#fieldset2").show();
        $("#fieldset4").show();

        $("#grafico1").html("");
        $("#grafico2").html("");
        $("#grafico3").html("");
        $("#grafico4").html("");
        $("#grafico5").html("");
        $("#grafico6").html("");

        //var info = sync_request("campanias::reportes_campania", "ajaxGetInfo", '{"campania":"' + this.value + '"}');
        $(".loading").fadeIn();
        async_request("campanias::reportes_campania", "ajaxGetInfo", '{"campania":"' + this.value + '"}', function(info) {
            $(".loading").fadeOut();

            // lleno los labels
            $("#label_abiertos").text(info.personas.leidos);
            $("#label_no_abiertos").text(info.personas.no_leidos);
            $("#label_error").text(info.personas.error.total);
            $("#label_error_hard").text(info.personas.error.hard);
            $("#label_error_soft").text(info.personas.error.soft);
            $("#label_porcentaje_abiertos").text((info.personas.leidos / info.personas.total * 100).toFixed(0));
            $("#label_porcentaje_no_abiertos").text((info.personas.no_leidos / info.personas.total * 100).toFixed(0));
            $("#label_porcentaje_error").text((info.personas.error.total / info.personas.total * 100).toFixed(0));

            // grafico de lecturas lo muestra en todos los casos
            var data1 = [{
                    'name': 'Abiertos',
                    'color': '#19A358',
                    'y': info.personas.leidos
                }, {
                    'name': 'No Abiertos',
                    'color': '#666666',
                    'y': info.personas.no_leidos
                }, {
                    'name': 'Error',
                    'color': '#F41F1E',
                    'y': info.personas.error.total
                }];
            pie('grafico1', 'Tasa de Entrega', data1, false);

            // resumen
            $("#total_suscriptores").text(info.personas.total);
            $("#emails_entregados").text(info.personas.entregados);
            $("#aperturas").text(info.personas.leidos);
            $("#ultima_apertura").text(info.personas.ultima_lectura);
            $("#clicks").text(info.personas.clicks);
            $("#ultimo_click").text(info.personas.ultimo_click);
            $("#reporte_rebotes").html('<a href="' + WWW + 'campanias/reporteRebotes/' + this.value + '"><img src="' + WWW + 'img/fmw/excel2.gif" width="20px" /></a>');

            // grafico de hipervinculos
            if (empty(info.links.categories)) {
                $("#grafico4").text("La campaña seleccionada no posee hipervínculos para trackear.").css("height", "auto");
            }
            else {
                $("#grafico4").css("height", "300px");
                bar('grafico4', '', info.links.categories, info.links.data);
            }

            // encuesta
            if (info.tipo == "Encuesta") {
                $("#fieldset3").show();
                var preguntas = sync_request("campanias::reportes_campania", "ajaxGetPreguntas", '{"campania":"' + this.value + '"}');
                for (var i in preguntas) {
                    $("#PreguntaId").append('<option value="' + preguntas[i].id + '">' + preguntas[i].pregunta + '</option>');
                }
            }
            // evento
            else if (info.tipo == "Evento") {
                $("#fieldset5").show();
                var evento = sync_request("campanias::reportes_campania", "ajaxGetGraficoAsistencias", '{"campania":"' + this.value + '"}');
                if (empty(evento)) {
                    $("#grafico2").text("El evento seleccionado aun no posee respuestas de asistencias.").css("height", "auto");
                }
                else {
                    pie('grafico2', '', evento);
                }
            }

            // grafico de aperturas y clicks lo muestra en todos los casos
            var campania = sync_request("campanias::reportes_campania", "ajaxGetGraficoCampanias2", '{"campania":"' + this.value + '", "dias":"10"}');
            var aperturas = false;
            for (var i in campania) {
                if (!empty(campania[i].data)) {
                    aperturas = true;
                    break;
                }
            }

            if (!aperturas) {
                $("#grafico6").text("La campaña seleccionada aun no posee Aperturas ni Clicks.").css("height", "auto");
            }
            else {
                $("#grafico6").css("height", "400px");
                //line('grafico6', campania.title, campania.categories, campania.data);
                stock('grafico6', campania)
            }
        });
    }).change();

    $("#PreguntaId").change(function() {
        var campania_id = $("#CampaniaId").val();
        if (empty(campania_id) || empty(this.value)) {
            $("#grafico5").html("");
            return;
        }
        var respuestas = sync_request("campanias::reportes_campania", "ajaxGetGraficoRespuestas", '{"campania":"' + campania_id + '","pregunta":"' + this.value + '"}');
        column('grafico5', 'Respuestas de la Encuesta', respuestas.categories, respuestas.data);
    });
});

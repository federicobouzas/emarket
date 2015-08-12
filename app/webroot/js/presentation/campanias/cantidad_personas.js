function cantidad_personas_init(field, params) {
    $("#" + field.attr('id') + "Button").click(function () {
        $("#" + field.attr('id') + "Number").html('Cargando...');
        if ($("#CampaniaEstado").val() == 'Enviada') {
            async_request('CAMPANIAS::CANTIDAD_PERSONAS', 'ajax_get_cantidad_enviada', '{"campania_id":' + (typeof (MODEL_ID) != 'undefined' ? MODEL_ID : 0) + '}', function (data) {
                $("#" + field.attr('id') + "Number").html('La campaña fue enviada a <strong>' + data + '</strong> persona' + (data == 1 ? '' : 's') + '.');
            });
        } else {
            var barrio = $("input:checkbox[id^='CampaniaPersonasBarrio']:checked").map(function () {
                return this.value;
            }).get().join(",");
            var comuna = $("input:checkbox[id^='CampaniaPersonasComuna']:checked").map(function () {
                return this.value;
            }).get().join(",");
            var poblacion = $("input:checkbox[id^='CampaniaPersonasPoblaciones']:checked").map(function () {
                return this.value;
            }).get().join(",");
            var req_params = {
                'sexo': $("#CampaniaPersonasSexo").val(),
                'barrio': barrio,
                'comuna': comuna,
                'poblacion': poblacion,
                'edad_desde': $("#CampaniaPersonasEdadFrom").val(),
                'edad_hasta': $("#CampaniaPersonasEdadTo").val()
            };
            async_request('CAMPANIAS::CANTIDAD_PERSONAS', 'ajax_calcular_cantidad', JSON.stringify(req_params), function (data) {
                $("#" + field.attr('id') + "Number").html('La campaña será enviada a <strong>' + data + '</strong> persona' + (data == 1 ? '' : 's') + '.');
            });
        }
    });
}
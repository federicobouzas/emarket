function cantidad_personas_init(field, params) {
    $("#" + field.attr('id') + "Button").click(function() {
        $("#" + field.attr('id') + "Number").html('Cargando...');
        if ($("#CampaniaEstado").val() == 'Enviada') {
            async_request('CAMPANIAS::CANTIDAD_PERSONAS', 'ajaxCantidadEnviada', '{"campania_id":'  + (typeof(MODEL_ID)!='undefined' ? MODEL_ID : 0) + '}' , function(data) {
                $("#" + field.attr('id') + "Number").html('La campaña fue enviada a <strong>' + data + '</strong> persona' + (data == 1 ? '' : 's') + '.');
            });
        } else {
            var req_params = {
                'sexo': $("#CampaniaPersonasSexo").val(),
                'barrio': $("#boxCampaniaPersonasBarrio input:checkbox:checked").map(function() {
                    return this.value;
                }).get().join(","),
                'comuna': $("#boxCampaniaPersonasComuna input:checkbox:checked").map(function() {
                    return this.value;
                }).get().join(","),
                'edad_desde': $("#CampaniaPersonasEdadDesde").val(),
                'edad_hasta': $("#CampaniaPersonasEdadHasta").val()
            };
            async_request('CAMPANIAS::CANTIDAD_PERSONAS', 'ajaxCalcularCantidad', JSON.stringify(req_params), function(data) {
                $("#" + field.attr('id') + "Number").html('La campaña será enviada a <strong>' + data + '</strong> persona' + (data == 1 ? '' : 's') + '.');
            });
        }
    });
}
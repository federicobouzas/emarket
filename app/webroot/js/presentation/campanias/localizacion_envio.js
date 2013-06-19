function localizacion_envio_init(field, params) {
    field.change(function() {
        if (this.value == "comunas") {
            $("#boxCampaniaPersonasComuna").show();
            $("#boxCampaniaPersonasBarrio").hide().find('input[type=checkbox]').attr('checked', false);
        } else if (this.value == "barrios") {
            $("#boxCampaniaPersonasComuna").hide().find('input[type=checkbox]').attr('checked', false);
            $("#boxCampaniaPersonasBarrio").show();
        } else {
            $("#boxCampaniaPersonasComuna").hide().find('input[type=checkbox]').attr('checked', false);
            $("#boxCampaniaPersonasBarrio").hide().find('input[type=checkbox]').attr('checked', false);
        }
    }).change();
}
function tipo_envio_init(field, params) {
    field.change(function() {
        if (this.value == "comunas") {
            $("#boxCampaniaPersonasComuna").show();
            $("#boxCampaniaPersonasBarrio").hide().find('input[type=checkbox]').attr('checked', false);
            $("#boxCampaniaPersonasPoblaciones").hide().find('input[type=checkbox]').attr('checked', false);
        } else if (this.value == "barrios") {
            $("#boxCampaniaPersonasComuna").hide().find('input[type=checkbox]').attr('checked', false);
            $("#boxCampaniaPersonasBarrio").show();
            $("#boxCampaniaPersonasPoblaciones").hide().find('input[type=checkbox]').attr('checked', false);
        } else if (this.value == "poblaciones") {
            $("#boxCampaniaPersonasComuna").hide().find('input[type=checkbox]').attr('checked', false);
            $("#boxCampaniaPersonasBarrio").hide().find('input[type=checkbox]').attr('checked', false);
            $("#boxCampaniaPersonasPoblaciones").show();
        } else {
            $("#boxCampaniaPersonasComuna").hide().find('input[type=checkbox]').attr('checked', false);
            $("#boxCampaniaPersonasBarrio").hide().find('input[type=checkbox]').attr('checked', false);
            $("#boxCampaniaPersonasPoblaciones").hide().find('input[type=checkbox]').attr('checked', false);
        }
    }).change();
}
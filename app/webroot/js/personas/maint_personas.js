$(function() {
    $("#PersonaFechaNacimiento").change(function() {
        if (!empty(this.value)) {
            var years = calculateYears(this.value);
            $("#boxPersonaFechaNacimientoYears").remove();
            $("#boxPersonaFechaNacimiento").append('<span id="boxPersonaFechaNacimientoYears">(' + years + ' año' + (years != 1 ? 's' : '') + ')</span>');
        }
    }).change();
});
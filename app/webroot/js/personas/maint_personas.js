$(function() {
    $("#PersonaFechaNacimiento").change(function() {
        if (!empty(this.value)) {
            var years = calculateYears(this.value);            
            var div = '<div id="boxPersonaFechaNacimientoYears">(' + years + ' año' + (years !== 1 ? 's' : '') + ')</div>';
            $("#boxPersonaFechaNacimientoYears").remove();
            $("#boxPersonaFechaNacimiento").append(div);
        }
    }).change();
});
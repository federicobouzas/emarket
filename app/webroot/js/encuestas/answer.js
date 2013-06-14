$(function() {
    $("form").submit(function() {
        var ret = true;
        var preguntas = $("fieldset");
        preguntas.each(function() {
            var tipo = $(this).find("[name$='[tipo]']").val();
            var respuesta;
        
            if (tipo=="lista" || tipo=="texto") {
                respuesta = $(this).find("select,textarea").val();
            }
            else if (tipo=="multiple") {
                respuesta = $(this).find("input:checked").map(function(){
                    return this.value;
                }).get().join(';');
            }
            else if (tipo=="simple") {
                respuesta = $(this).find("input:checked").val();
            }
                
            if (empty(respuesta)) {
                addFormError("Debe responder todas las preguntas de la encuesta");
                ret = false;
                return false; // para que no siga analizando las demas preguntas
            }
        });
        return ret;
    });
});
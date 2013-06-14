$(function() {
    $("form").submit(function() {
        if (empty($("table[id='table[Pregunta]'] tbody tr").length)) {
            GLOBAL_ERROR.push("Debe agregar al menos una pregunta");
        }
    });
});
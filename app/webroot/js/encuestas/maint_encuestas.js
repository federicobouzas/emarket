function onBeforeSubmit() {
    var err = [];
    if (empty($("table[id='table[Pregunta]'] tbody tr").length)) {
        err.push("Debe agregar al menos una pregunta");
    }
    return err;
}
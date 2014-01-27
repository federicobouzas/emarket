$(function() {
    $("form").submit(function() {
        /*
         if (empty($("table[id='table[Poblacion]'] tbody tr").length)) {
         GLOBAL_ERROR.push("Debe seleccionar al menos una población");
         }
         */
        if (!empty($("#CampaniaPersonasEdadDesde").val()) && empty($("#CampaniaPersonasEdadHasta").val())) {
            GLOBAL_ERROR.push("Si especifica la Edad Desde de las personas debe tambíen especificar la Edad Hasta");

        }
        if (!empty($("#CampaniaPersonasEdadHasta").val()) && empty($("#CampaniaPersonasEdadDesde").val())) {
            GLOBAL_ERROR.push("Si especifica la Edad Hasta de las personas debe tambíen especificar la Edad Desde");
        }
    });

    // Evento que muestra las encuestas en caso de que se desee enviar una
    $("#CampaniaTipo").change(function() {
        if (empty(this.value) || this.value == "Newsletter") {
            obligatorio("Campania", "encuesta_id", false);
            obligatorio("Campania", "evento_id", false);
            $("#boxCampaniaEncuestaId").fadeOut();
            $("#boxCampaniaEventoId").fadeOut();
            disableInput('CampaniaEmail', false);
            $("#CampaniaEncuestaId").val("");
            $("#CampaniaEventoId").val("");
        }
        else if (this.value == "Encuesta") {
            obligatorio("Campania", "encuesta_id", true);
            obligatorio("Campania", "evento_id", false);
            $("#boxCampaniaEncuestaId").fadeIn();
            $("#boxCampaniaEventoId").fadeOut();
            $("#CampaniaEmail").val("Si").change();
            disableInput('CampaniaEmail', true);
            $("#CampaniaEventoId").val("");
        }
        else if (this.value == "Evento") {
            obligatorio("Campania", "encuesta_id", false);
            obligatorio("Campania", "evento_id", true);
            $("#boxCampaniaEncuestaId").fadeOut();
            $("#boxCampaniaEventoId").fadeIn();
            $("#CampaniaEmail").val("Si").change();
            disableInput('CampaniaEmail', true);
            $("#CampaniaEncuestaId").val("");
        }
    }).change();

    // Evento que muestra el asunto/cuerpo del email en caso de que se utilice ese medio
    $("#CampaniaEmail").change(function() {
        if (this.value == "Si") {
            $("#boxCampaniaAsuntoEmail").fadeIn();
            $("#boxCampaniaTmpTemplate").fadeIn();
            $("#boxCampaniaCuerpoEmail").fadeIn();
            obligatorio("Campania", "asunto_email", true);
            obligatorio("Campania", "cuerpo_email", true);
        }
        else {
            $("#boxCampaniaAsuntoEmail").fadeOut().find("input").val("");
            $("#boxCampaniaTmpTemplate").fadeOut().find("input").val("");
            $("#boxCampaniaCuerpoEmail").fadeOut().find("textarea").val("");
            obligatorio("Campania", "asunto_email", false);
            obligatorio("Campania", "cuerpo_email", false);
        }
    }).change();

    // Evento que muestra el cuerpo del SMS en caso de que se utilice ese medio
    $("#CampaniaSms").change(function() {
        if (this.value == "Si") {
            $("#boxCampaniaCuerpoSms").fadeIn();
        }
        else {
            $("#boxCampaniaCuerpoSms").fadeOut().find("input").val("");
        }
    }).change();

    if (OP == "V") {
        var modal = $("[id='windowCampaniaCuerpoEmail']");
        var width = screen.width * 0.70;
        var height = screen.height * 0.65;

        $("[id='openCampaniaCuerpoEmail']").click(function(e) {
            modal.data("kendoWindow").center().open();
        });

        var params = {"campania": MODEL_ID};
        modal.kendoWindow({
            width: width + "px",
            height: height + "px",
            title: "Visualización del Cuerpo del Email",
            actions: ["Maximize", "Close"],
            content: WWW + "remotes/request/" + encodeURIComponent("campanias||visualizar_template") + "/" + encodeURIComponent("ajaxGetHTML") + "/" + $.param(params, true),
            iframe: true,
            modal: true,
            visible: false,
            show: "fadeIn",
            hide: "fadeOut"
        });
    }
    else {
        // Cuando se sube un template lo carga en el editor
        if (window.File && window.FileReader && window.FileList && window.Blob) {
            document.getElementById('CampaniaTmpTemplate').addEventListener('change', seleccionTemplate, false);
        } else {
            jAlert('Este browser no soporta la subida dinámica de templates.', 'Alerta');
        }
    }
});

function seleccionTemplate(evt) {
    var files = evt.target.files; // FileList object

    // Loop through the FileList and render image files as thumbnails.
    for (var i = 0, f; f = files[i]; i++) {
        // Only process image files.
        if (f.type != "text/html") {
            jAlert("¡El archivo debe ser un template html!", "Error");
            this.value = "";
            continue;
        }

        var reader = new FileReader();

        // Closure to capture the file information.
        reader.onload = (function(theFile) {
            return function(e) {
                if (empty(e.target.error)) {
                    $("#CampaniaCuerpoEmail").data("kendoEditor").value(e.target.result);
                }
                else {
                    jAlert("Error al cargar el template, intente nuevamente.", "Error");
                }
            };
        })(f);

        // Read in the image file as a data URL.
        reader.readAsText(f);
    }

    this.value = '';
}
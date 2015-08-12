$(function () {
    // Evento que muestra las encuestas en caso de que se desee enviar una
    $("#CampaniaTipo").change(especificarTipoCampania).change();
    // Evento que muestra el asunto/cuerpo del email en caso de que se utilice ese medio
    $("#CampaniaEmail").change(campaniaEmail).change();
    // Evento que muestra el cuerpo del SMS en caso de que se utilice ese medio
    $("#CampaniaSms").change(campaniaSms).change();
    // Evento que muestra los distintos tipos de envio
    //$("#CampaniaPersonasTipoEnvio").change(especificarTipoEnvio).change();

    if (OP == "V") {
        crearModalVistaCuerpoEmail();
    } else {
        // Cuando se sube un template lo carga en el editor
        if (window.File && window.FileReader && window.FileList && window.Blob) {
            document.getElementById('CampaniaTmpTemplate').addEventListener('change', seleccionTemplate, false);
        } else {
            jAlert('Este browser no soporta la subida dinámica de templates.', 'Alerta');
        }
    }
});

function onBeforeSubmit() {
    var err = [];
    if (!empty($("#CampaniaPersonasEdadDesde").val()) && empty($("#CampaniaPersonasEdadHasta").val())) {
        err.push("Si especifica la Edad Desde de las personas debe tambíen especificar la Edad Hasta");
    }
    if (!empty($("#CampaniaPersonasEdadHasta").val()) && empty($("#CampaniaPersonasEdadDesde").val())) {
        err.push("Si especifica la Edad Hasta de las personas debe tambíen especificar la Edad Desde");
    }
    return err;
}

function especificarTipoEnvio() {
    if (this.value == "comunas") {
        displayField("Campania", "personas_comuna", true);
        displayField("Campania", "personas_barrio", false);
        displayField("Campania", "personas_poblaciones", false);
        $("#boxCampaniaPersonasBarrio").find('input[type=checkbox]').attr('checked', false);
        $("#boxCampaniaPersonasPoblaciones").find('input[type=checkbox]').attr('checked', false);
    } else if (this.value == "barrios") {
        displayField("Campania", "personas_comuna", false);
        displayField("Campania", "personas_barrio", true);
        displayField("Campania", "personas_poblaciones", false);
        $("#boxCampaniaPersonasComuna").find('input[type=checkbox]').attr('checked', false);
        $("#boxCampaniaPersonasPoblaciones").find('input[type=checkbox]').attr('checked', false);
    } else if (this.value == "poblaciones") {
        displayField("Campania", "personas_comuna", false);
        displayField("Campania", "personas_barrio", false);
        displayField("Campania", "personas_poblaciones", true);
        $("#boxCampaniaPersonasComuna").find('input[type=checkbox]').attr('checked', false);
        $("#boxCampaniaPersonasBarrio").find('input[type=checkbox]').attr('checked', false);
    } else {
        displayField("Campania", "personas_comuna", false);
        displayField("Campania", "personas_barrio", false);
        displayField("Campania", "personas_poblaciones", false);
        $("#boxCampaniaPersonasComuna").find('input[type=checkbox]').attr('checked', false);
        $("#boxCampaniaPersonasBarrio").find('input[type=checkbox]').attr('checked', false);
        $("#boxCampaniaPersonasPoblaciones").find('input[type=checkbox]').attr('checked', false);
    }
}

function especificarTipoCampania() {
    var encuesta = false, evento = false, email_disabled = false;
    if (this.value == "Encuesta") {
        encuesta = true;
        evento = false;
        email_disabled = true;
        $("#CampaniaEmail").val("Si").change();
        $("#CampaniaEventoId").val("");
    } else if (this.value == "Evento") {
        encuesta = false;
        evento = true;
        email_disabled = true;
        $("#CampaniaEmail").val("Si").change();
        $("#CampaniaEncuestaId").val("");
    }
    obligatorio("Campania", "encuesta_id", encuesta);
    obligatorio("Campania", "evento_id", evento);
    displayField("Campania", "encuesta_id", encuesta);
    displayField("Campania", "evento_id", evento);
    disableInput('CampaniaEmail', email_disabled);
}

function campaniaEmail() {
    if (this.value == "Si") {
        $("#opciones_envio_email").show();
    } else {
        $("#opciones_envio_email").hide();
        $("#CampaniaAsuntoEmail").val("");
        $("#CampaniaTmpTemplate").val("");
        $("#CampaniaCuerpoEmail").val("");
    }
    obligatorio("Campania", "asunto_email", this.value === "Si");
    obligatorio("Campania", "cuerpo_email", this.value === "Si");
}

function campaniaSms() {
    if (this.value == "Si") {
        $("#opciones_envio_sms").show();
    } else {
        $("#opciones_envio_sms").hide();
        $("#CampaniaCuerpoSms").val("");
    }
}

function seleccionTemplate(evt) {
    // FileList object
    var files = evt.target.files;
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
        reader.onload = (function (theFile) {
            return function (e) {
                if (empty(e.target.error)) {
                    $('#CampaniaCuerpoEmail').redactor('code.set', e.target.result);
                } else {
                    jAlert("Error al cargar el template, intente nuevamente.", "Error");
                }
            };
        })(f);
        // Read in the image file as a data URL.
        reader.readAsText(f);
    }
    this.value = '';
}

function crearModalVistaCuerpoEmail() {
    var modal = $("[id='windowCampaniaCuerpoEmail']");
    var width = screen.width * 0.70;
    var height = screen.height * 0.65;

    $("[id='openCampaniaCuerpoEmail']").click(function (e) {
        modal.data("kendoWindow").center().open();
    });

    var params = {campania: MODEL_ID};
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
document.getElementById("boton_comentario").addEventListener("click", function () {
    fetch('http://localhost/primor/index.php?controller=api&action=agregarcomentarios')

    // Obtener los valores del formulario
    const titulo = document.getElementById("titulo").value;
    const comentario = document.getElementById("comentario").value;
    const valoracion = document.querySelector('input[name="valoracion"]:checked').value;
    

    // Validaremos que todos los campos estén completos antes de procesar el comentario:
    if (!titulo || !comentario || !valoracion) {

        // Mostraremos un mensaje de error en el caso de que no complete todos los campos del formulario:
        notie.alert({
            type: 'error',
            text: 'Completa todos los campos antes de agregar el comentario',
            time: 3
        });
        return;
    }


    // Crear objeto con los datos del formulario
    const data = {
        titulo: titulo,
        comentario: comentario,
        valoracion: valoracion
    };


    // Enviar los datos al servidor
    fetch('http://localhost/primor/index.php?controller=api&action=agregarcomentarios', {
        method: 'POST',
        headers: {
            'Content-type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify(data)
    });

    notie.alert({
        type: 'success',
        text: 'Comentario agregado exitosamente',
        time: 3
    });
});
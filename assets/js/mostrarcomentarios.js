document.addEventListener('DOMContentLoaded', function() {
    let comentarios = []; // Variable global para almacenar los comentarios

    // Función para mostrar los comentarios en el contenedor
    function mostrarComentarios(comentariosMostrar) {
        let seccion = document.getElementById('containerReview');
        seccion.innerHTML = ''; // Limpiar el contenedor antes de mostrar los comentarios

        comentariosMostrar.forEach(comentario => {
            let div = document.createElement("article");
            div.className = "qwert";
            seccion.appendChild(div);
            let nombre = document.createElement('h4');
            let comentariosElemento = document.createElement('p');
            let saltoLinea = document.createElement('hr');
            nombre.innerHTML = comentario["titulo"];
            comentariosElemento.innerHTML = comentario["comentario"];
            valoracionElemento.innerHTML = comentario["valoracion"];
            div.appendChild(nombre);
            div.appendChild(comentariosElemento);

            // Bucle para imprimir estrellas
            for (let i = 0; i < 5; i++) {
                let valoracionElemento = document.createElement('span');
                valoracionElemento.setAttribute('data-valoracion', i + 1); // Añadir atributo de datos
                valoracionElemento.innerHTML = "<img src='assets/icons/estrella_" + (i < comentario["valoracion"] ? "si" : "no") + ".svg' height='25px' width='25px' alt='Description of the image'>";
                div.appendChild(valoracionElemento);
            }

            div.appendChild(saltoLinea);
        });
    }

    // Función para ordenar los comentarios según la valoración
    function ordenarComentarios(orden) {
        comentarios.sort(function(a, b) {
            if (orden === 'asc') {
                return a.valoracion - b.valoracion;
            } else {
                return b.valoracion - a.valoracion;
            }
        });

        mostrarComentarios(comentarios);
    }

    // Función para filtrar los comentarios por valoración
    function filtrarComentarios() {
        let checkboxes = document.querySelectorAll('.filtro');
        let valoracionesFiltradas = [];

        checkboxes.forEach(checkbox => {
            if (checkbox.checked) {
                let valoracionSeleccionada = parseInt(checkbox.id.split('-')[1]);

                // Filtrar comentarios según la valoración seleccionada
                let comentariosFiltrados = comentarios.filter(comentario => comentario.valoracion === valoracionSeleccionada);

                valoracionesFiltradas = valoracionesFiltradas.concat(comentariosFiltrados);
            }
        });

        // Mostrar los comentarios filtrados
        mostrarComentarios(valoracionesFiltradas);
    }

    // Hacer la solicitud para obtener los comentarios
    fetch('http://localhost/primor/index.php?controller=api&action=mostrarcomentarios', {
        method: 'POST',
        headers: {
            'Content-type': 'application/json; charset=UTF-8',
        },
    })
    .then(response => {
        return response.json();
    })
    .then(data => {
        comentarios = data; // Almacena los comentarios en la variable global
        mostrarComentarios(comentarios); // Muestra los comentarios al cargar la página
    });

    // Agregar eventos a los botones de ordenar
    document.getElementById('ordenarAscendente').addEventListener('click', function() {
        ordenarComentarios('asc');
    });

    document.getElementById('ordenarDescendente').addEventListener('click', function() {
        ordenarComentarios('desc');
    });

    // Agregar evento a los checkboxes de filtrar
    document.querySelectorAll('.filtro').forEach(function(checkbox) {
        checkbox.addEventListener('change', filtrarComentarios);
    });
});
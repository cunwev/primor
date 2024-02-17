// document.addEventListener('DOMContentLoaded', function() {
//     let valores = "";
//     let estrellasSeleccionadas = [];
//     const checkboxes = document.querySelectorAll('input[type="checkbox"][name="estrella"]');


//     fetch('http://localhost/primor/index.php?controller=api&action=mostrarcomentarios',{
//         method: 'POST',
//         headers: {
//             'Content-type': 'application/json; charset=UTF-8',
//         },
//     })
//     .then(response => {
//         return response.json();
//     })
//     .then(dataValoresComentario => {
//         // Puedes hacer algo con los datos aquí
//         dataValores(dataValoresComentario); 
//         valores = dataValoresComentario
        
//     })

//     function dataValores(dataValoresComentario) {
//     let seccion = document.getElementById('containerReview');
    
//     seccion.innerHTML = '';
//         dataValoresComentario.forEach(comentario => {
//             let div = document.createElement("article");
//             div.className = "qwert";
//             seccion.appendChild(div);
//             let nombre = document.createElement('h4');
//             let comentariosElemento = document.createElement('p');
//             let saltoLinea = document.createElement('hr');
//             nombre.innerHTML = comentario["titulo"];
//             comentariosElemento.innerHTML = comentario["comentario"];
//             div.appendChild(nombre);
//             div.appendChild(comentariosElemento);
    
//             // Primer bucle para imprimir "ESTRELLA SI" según el valor de comentario["valoracion"]
//             for (let i = 0; i < comentario["valoracion"]; i++) {
//                 let valoracionElementoA = document.createElement('span');
//                 valoracionElementoA.innerHTML = "<img src='assets/icons/estrella_si.svg' height='25px' width='25px' alt='Description of the image'>";
//                 div.appendChild(valoracionElementoA);
//             }
    
//             // Segundo bucle para imprimir "ESTRELLA NO" según la diferencia entre 5 y comentario["valoracion"]
//             for (let j = 0; j < (5 - comentario["valoracion"]); j++) {
//                 let valoracionElementoB = document.createElement('span');
//                 valoracionElementoB.innerHTML = "<img src='assets/icons/estrella_no.svg' height='25px' width='25px' alt='Description of the image'>";
//                 div.appendChild(valoracionElementoB);
//             }
    
//             div.appendChild(saltoLinea);
//         });
// }

// function filtrarporestrellas() {
//     si = valores.filter(sol => estrellasSeleccionadas.includes(parseInt(sol.valoracion)));

//     dataValores(si);
//         if (si.length == 0) {
//             fetch('http://localhost/primor/index.php?controller=api&action=mostrarcomentarios',{
//                 method: 'POST',
//                 headers: {
//                     'Content-type': 'application/json; charset=UTF-8',
//                 },
//             })
//             .then(response => {
//                 return response.json();
//             })
//             .then(dataValoresComentario => {
//                 // Puedes hacer algo con los datos aquí
//                 dataValores(dataValoresComentario); 
//                 valores = dataValoresComentario
//             } )       
//         }
// }





//     checkboxes.forEach(checkbox => {
//         checkbox.addEventListener('change', function() {
//             const valor = parseInt(this.value);
//             if (this.checked) {
//                 estrellasSeleccionadas.push(valor);
                
//             } else {
//                 estrellasSeleccionadas = estrellasSeleccionadas.filter(item => item !== valor);

//             }
//             estrellasSeleccionadas.sort((a, b) => a - b); // Ordenar el array
//             filtrarporestrellas();
//             // Aquí aplicamos el filtrado de comentarios con la nueva array de estrellas seleccionadas

//         });
//     });
// });

document.addEventListener('DOMContentLoaded', function() {
    let valores = "";
    let estrellasSeleccionadas = [];
    const checkboxes = document.querySelectorAll('input[type="checkbox"][name="estrella"]');

    fetch('http://localhost/primor/index.php?controller=api&action=mostrarcomentarios', {
            method: 'POST',
            headers: {
                'Content-type': 'application/json; charset=UTF-8',
            },
        })
        .then(response => {
            return response.json();
        })
        .then(dataValoresComentario => {
            dataValores(dataValoresComentario);
            valores = dataValoresComentario;
        });

    function dataValores(dataValoresComentario) {
        let seccion = document.getElementById('containerReview');

        seccion.innerHTML = '';
        dataValoresComentario.forEach(comentario => {
            let div = document.createElement("article");
            div.className = "qwert";
            seccion.appendChild(div);
            let nombre = document.createElement('h4');
            let comentariosElemento = document.createElement('p');
            let saltoLinea = document.createElement('hr');
            nombre.innerHTML = comentario["titulo"];
            comentariosElemento.innerHTML = comentario["comentario"];
            div.appendChild(nombre);
            div.appendChild(comentariosElemento);

            // Primer bucle para imprimir "ESTRELLA SI" según el valor de comentario["valoracion"]
            for (let i = 0; i < comentario["valoracion"]; i++) {
                let valoracionElementoA = document.createElement('span');
                valoracionElementoA.innerHTML = "<img src='assets/icons/estrella_si.svg' height='25px' width='25px' alt='Description of the image'>";
                div.appendChild(valoracionElementoA);
            }

            // Segundo bucle para imprimir "ESTRELLA NO" según la diferencia entre 5 y comentario["valoracion"]
            for (let j = 0; j < (5 - comentario["valoracion"]); j++) {
                let valoracionElementoB = document.createElement('span');
                valoracionElementoB.innerHTML = "<img src='assets/icons/estrella_no.svg' height='25px' width='25px' alt='Description of the image'>";
                div.appendChild(valoracionElementoB);
            }

            div.appendChild(saltoLinea);
        });
    }

    function filtrarporestrellas() {
        // Si no hay estrellas seleccionadas o si el arreglo de estrellas seleccionadas está vacío,
        // se deben ordenar todos los comentarios sin aplicar ningún filtro por estrellas.
        if (estrellasSeleccionadas.length === 0) {
            if (valores.length === 0) {
                fetch('http://localhost/primor/index.php?controller=api&action=mostrarcomentarios', {
                        method: 'POST',
                        headers: {
                            'Content-type': 'application/json; charset=UTF-8',
                        },
                    })
                    .then(response => {
                        return response.json();
                    })
                    .then(dataValoresComentario => {
                        valores = dataValoresComentario;
                        dataValores(dataValoresComentario);
                    });
            } else {
                dataValores(valores);
            }
        } else {
            // Si hay estrellas seleccionadas, aplicamos el filtro como antes.
            let comentariosFiltrados = valores.filter(sol => estrellasSeleccionadas.includes(parseInt(sol.valoracion)));
            if (comentariosFiltrados.length === 0) {
                fetch('http://localhost/primor/index.php?controller=api&action=mostrarcomentarios', {
                        method: 'POST',
                        headers: {
                            'Content-type': 'application/json; charset=UTF-8',
                        },
                    })
                    .then(response => {
                        return response.json();
                    })
                    .then(dataValoresComentario => {
                        valores = dataValoresComentario;
                        dataValores(dataValoresComentario);
                    });
            } else {
                dataValores(comentariosFiltrados);
            }
        }
    }
    

// Función para ordenar los comentarios de manera ascendente
function ordenarAscendente() {
    valores.sort((a, b) => a.valoracion - b.valoracion);
    filtrarporestrellas(); // Aplicar el filtro nuevamente después de ordenar
}

// Función para ordenar los comentarios de manera descendente
function ordenarDescendente() {
    valores.sort((a, b) => b.valoracion - a.valoracion);
    filtrarporestrellas(); // Aplicar el filtro nuevamente después de ordenar
}


    // Listener de evento para el botón de orden ascendente
    document.getElementById('ascendente').addEventListener('click', function() {
        ordenarAscendente();
    });

    // Listener de evento para el botón de orden descendente
    document.getElementById('descendente').addEventListener('click', function() {
        ordenarDescendente();
    });

    checkboxes.forEach(checkbox => {
        checkbox.addEventListener('change', function() {
            const valor = parseInt(this.value);
            if (this.checked) {
                estrellasSeleccionadas.push(valor);

            } else {
                estrellasSeleccionadas = estrellasSeleccionadas.filter(item => item !== valor);

            }
            estrellasSeleccionadas.sort((a, b) => a - b); // Ordenar el array
            filtrarporestrellas();
        });
    });
});

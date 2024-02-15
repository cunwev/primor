document.addEventListener('DOMContentLoaded', function() {
    let valores = "";
    let estrellasSeleccionadas = [];
    const checkboxes = document.querySelectorAll('input[type="checkbox"][name="estrella"]');


    fetch('http://localhost/primor/index.php?controller=api&action=mostrarcomentarios',{
        method: 'POST',
        headers: {
            'Content-type': 'application/json; charset=UTF-8',
        },
    })
    .then(response => {
        return response.json();
    })
    .then(pepe => {
        // Puedes hacer algo con los datos aquí
        asdf(pepe); 
        valores = pepe
        
    })

    function asdf(pepe) {
    let seccion = document.getElementById('containerReview');
    
    seccion.innerHTML = '';
        pepe.forEach(comentario => {
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
    si = valores.filter(sol => estrellasSeleccionadas.includes(parseInt(sol.valoracion)));

    asdf(si);
        if (si.length == 0) {
            fetch('http://localhost/primor/index.php?controller=api&action=mostrarcomentarios',{
                method: 'POST',
                headers: {
                    'Content-type': 'application/json; charset=UTF-8',
                },
            })
            .then(response => {
                return response.json();
            })
            .then(pepe => {
                // Puedes hacer algo con los datos aquí
                asdf(pepe); 
                valores = pepe
            } )       
        }
}





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
            // Aquí aplicamos el filtrado de comentarios con la nueva array de estrellas seleccionadas

        });
    });
});

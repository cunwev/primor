let puntos = 0;

document.addEventListener('DOMContentLoaded', function () {
    // Obtener el precio total del pedido
    var precioTotalJS = parseFloat(document.querySelector('.precioTotalVista').value);

    // Calcular los puntos
    var puntos = Math.floor(precioTotalJS);

    // Muestra el valor de la puntos en algún lugar (como un div con clase 'puntosVista')
    var puntosElemento = document.querySelector('.puntosVista');
    puntosElemento.textContent = "Finaliza el pedido y obtén " + puntos + " puntos.";

    // Envía la cantidad de puntos al servidor
    var cuerpoSolicitud = { puntos: puntos };
    var parametrosFetch = {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(cuerpoSolicitud)
    };

    // GUARDAR PUNTOS
    fetch('http://localhost/primor/index.php?controller=api&action=guardarPuntos', parametrosFetch)
        .then(response => {
            if (!response.ok) {
                throw new Error('La solicitud falló');
            }
            // Leer el cuerpo de la respuesta como JSON
        })
        .then(data => {
            // Hacer algo con los datos (si los hay)
            console.log('Respuesta del servidor:', data);
        })

    // MOSTRAR PUNTOS
    fetch('http://localhost/primor/index.php?controller=api&action=mostrarPuntos', parametrosFetch)
        .then(response => {
            if (!response.ok) {
                throw new Error('La solicitud falló');
            }
            // Leer el cuerpo de la respuesta como JSON

            return response.json();

        })
        .then(data => {

            puntos = data;

            // Inicializamos la variable descuento
            let descuento = 0;

            // Calculamos el descuento basado en los puntos
            descuento = Math.floor(puntos / 100) * 10;
            //if (checkbox = true) {
                if (puntos >= 100) {
                    document.getElementById('mostrarPuntos').innerHTML = "Usar <b>" + puntos + "</b> de mis puntos para ahorrar <b>" + descuento + "</b>€.";
                    if ((precioTotalJS - descuento) < 0) {
                        document.getElementById('precioConDescuento').innerHTML = "Usa tus puntos y obtén tu pedido... <b>¡GRATIS!</b>";
                    }
                    if ((precioTotalJS - descuento) > 0) {
                        precioConDescuento = (precioTotalJS - descuento).toFixed(2);
                        document.getElementById('precioConDescuento').innerHTML = "¡Usa tus puntos y obtén tu pedido por: <b>" + precioConDescuento + "</b>€!";
                    }
                //}
            } else {
                document.getElementById('mostrarPuntos2').innerHTML = "No dispones de suficientes puntos (" + puntos + ") para realizar un descuento en este pedido.";
            }
        })


    // GASTAR PUNTOS
    let checkbox = false;
    var parametrosFetch = {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ checkbox: checkbox })
    };

    fetch('http://localhost/primor/index.php?controller=api&action=gastarPuntos', parametrosFetch)
        .then(response => {
            if (!response.ok) {
                throw new Error('La solicitud falló');
            }
            // Leer el cuerpo de la respuesta como JSON
            return response.json();
        })
        .then(data => {
            // Hacer algo con los datos (si los hay)
            console.log(data);
        })
        .catch(error => {
            console.error('Error:', error);
        });


    document.getElementById("checkbox").addEventListener("change", function () {
        checkbox = !checkbox;
        console.log(checkbox);


        var parametrosFetch = {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ checkbox: checkbox })
        };

        fetch('http://localhost/primor/index.php?controller=api&action=gastarPuntos', parametrosFetch)
            .then(response => {
                if (!response.ok) {
                    throw new Error('La solicitud falló');
                }
                // Leer el cuerpo de la respuesta como JSON
                return response.json();
            })
            .then(data => {
                // Hacer algo con los datos (si los hay)
                console.log(data);
            })
            .catch(error => {
                console.error('Error:', error);
            });
    }
    )

});

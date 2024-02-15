let puntos = 0;




document.addEventListener('DOMContentLoaded', function() {
    // Obtener el precio total del pedido
    var precioTotalJS = parseFloat(document.querySelector('.precioTotalVista').value);

    // Calcular los puntos
    var puntos = Math.floor(precioTotalJS);

    // Mostrar los puntos en consola
    console.log("Puntos a acumular: " + puntos);

    // Muestra el valor de la puntos en algún lugar (como un div con clase 'puntosVista')
    var puntosElemento = document.querySelector('.puntosVista');
    puntosElemento.textContent = "Obtendrás " + puntos + " puntos con este pedido.";

    // Envía la cantidad de puntos al servidor
    var cuerpoSolicitud = { puntos: puntos };
    var parametrosFetch = {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(cuerpoSolicitud)
    };

fetch('http://localhost/primor/index.php?controller=api&action=guardarPuntos', parametrosFetch)
    .then(response => {
        if (!response.ok) {
            throw new Error('La solicitud falló');
        }
        // Leer el cuerpo de la respuesta como JSON
        return response.json();
    })
    .then(data => {
        // Hacer algo con los datos (si los hay)
        console.log('Respuesta del servidor:', data);
    })

    fetch('http://localhost/primor/index.php?controller=api&action=mostrarPuntos', parametrosFetch)
    .then(response => {
        if (!response.ok) {
            throw new Error('La solicitud falló');
        }
        // Leer el cuerpo de la respuesta como JSON

        return response.json();
        
    })
    .then(data => {
        // Hacer algo con los datos (si los hay)
        puntos=data;
        console.log(puntos);
        document.getElementById('mostrarPuntos').innerHTML = "Actualmente dispones de <b>" +puntos + "</b> puntos.";
    })
});

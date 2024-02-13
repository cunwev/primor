document.addEventListener('DOMContentLoaded', function() {
  // Obtén todos los elementos de radio en un NodeList
  var radios = document.querySelectorAll('input[name="miRadio"]');
  var propinaMultiplicador = 0.03; //DEFAULT 3%

  // Itera sobre los radios y agrega un event listener a cada uno
  radios.forEach(function(radio) {
    radio.addEventListener('change', function() {
      // Dependiendo de qué opción de radio se seleccionó, actualiza el valor de la variable JavaScript
      switch(this.value) {
        case "propina0":
          propinaMultiplicador = 0.00;
          break;
        case "propina3":
          propinaMultiplicador = 0.03; //CHECKED
          break;
        case "propina5":
          propinaMultiplicador = 0.05;
          break;
        case "propina10":
          propinaMultiplicador = 0.10;
          break;
        default:
          propinaMultiplicador = 0.03; // Valor predeterminado si no se selecciona ninguna opción válida
      }

      // Obtén el precio total desde el input con clase 'precioTotal'
      var precioTotalJS = parseFloat(document.querySelector('.precioTotalVista').value);

      // Calcula el valor de propina
      var propina = precioTotalJS * propinaMultiplicador;

      // Muestra el valor de la propina en algún lugar (como un div con clase 'precioPropina')
      var propinaElemento = document.querySelector('.precioPropinaVista');
      propinaElemento.textContent = propina.toFixed(2) + "€";

      // Envía el valor de la propina al servidor
      // enviarPropinaAlServidor(propina);
      console.log(propina);
      {
        const cuerpoSolicitud = { propina: propina };
        const parametrosFetch = {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(cuerpoSolicitud)
        };
    
        fetch('http://localhost/primor/index.php?controller=api&action=guardarPropina', parametrosFetch)
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
          .catch(error => {
            // Manejar errores
            console.error('Error al enviar la propina al servidor:', error.message);
          });
      }
    });
  });
});

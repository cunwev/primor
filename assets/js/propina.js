let propinaSeleccionada = 0; // Inicializar la propina seleccionada

  function seleccionarPropina(porcentaje) {
    propinaSeleccionada = porcentaje;

    // Realizar solicitud Axios
    axios.post('CalculadoraPrecios.php', { propina: propinaSeleccionada })
      .then(function (response) {
        // Actualizar la interfaz de usuario con los resultados
        document.getElementById('precioTotal').textContent = 'Precio Total: ' + response.data.precioTotal + ' €';
        document.getElementById('precioTotalConPropina').textContent = 'Precio Total con Propina: ' + response.data.precioTotalConPropina + ' €';

        // Actualizar valores de propina en el HTML
        document.getElementById('propina3').innerText = round(response.data.precioTotal * 0.03, 2);
        document.getElementById('propina5').innerText = round(response.data.precioTotal * 0.05, 2);
        document.getElementById('propina10').innerText = round(response.data.precioTotal * 0.10, 2);

        // Actualizar el texto del Total del pedido (opcional)
        document.getElementById('precioPedido').innerText = 'Total del pedido ' + response.data.precioTotal + ' €';
      })
      .catch(function (error) {
        console.error('Error en la solicitud Axios:', error);
      });
  }

  function round(value, decimals) {
    return Number(Math.round(value + 'e' + decimals) + 'e-' + decimals);
  }
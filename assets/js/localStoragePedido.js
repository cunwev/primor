document.getElementById("finalizarbtn").addEventListener("click", function () {
    fetch('http://localhost/primor/index.php?controller=api&action=datosultimopedido', {
        method: 'POST',
        headers: {
            'Content-type': 'application/json; charset=UTF-8',
        },
    })
    .then(response => {
        return response.json();
    })
    .then(valores => {
        // Concatenating the required fields into a string
        const simplifiedData = valores.map(({ Categoria_Producto, Nombre_Producto, cantidad }) => (
            `Nombre_Producto:${Nombre_Producto}, Categoria_Producto:${Categoria_Producto}, Cantidad:${cantidad}`
        ));

        // Joining the string with a separator (you can choose any separator)
        const dataString = simplifiedData.join('\n');

        console.log('dataString', dataString);

        // Storing the concatenated data string in local storage
        localStorage.setItem('contenidoPedido', dataString);
    });
});
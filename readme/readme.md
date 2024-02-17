## Introducción

Este proyecto no es más que una segunda parte del anterior, es decir, si bien vimos en mayor medida HTML para la estructura, CSS para la estética y PHP para las funcionalidades en este caso vamos un paso más allá y añadimos JavaScript a nuestro sitio web.

Esto quiere decir que se seguirán utilizando los recursos anteriores solo que el mayor grueso esta vez recaerá sobre el código JavaScript.

Así mismo otras herramientas como GIT o XAMPP, e incluso a últimas horas del proyecto se nos ha dado la noticia de hostear el sitio web en un servidor Plesk y de documentar todo lo anterior mediante "readme.md".

----------
## Requisitos

Se nos entrega en formato excel y por otro lado mediante este enlace: [[https://www.campus.bernatelferrer.cat/pluginfile.php/210633/mod_resource/content/1/ProjecteJS.pdf]]

### Funcionalidades

- Reseñas del restaurante
- Programa de fidelidad
- QR
- Propinas
- Filtro de productos

### Requisitos mínimos:

Y al realizar estas funcionalidades debemos hacer uso de los siguientes recursos como requisito mínimo:

- Utilizar programación orientada a objetos .
- DOM o Asincronía con Fetch/Axios 
- Métodos de arrays 
- Validación de formularios 
- JSON 
- NotieJS 

### Características a tener en cuenta:

- Todas estas funcionalidades: (añadir reseña, validar que haya una por pedido, filtros, mostrar, etc...) deben funcionar sin que la página se vuelva a cargar. Es decir, -los formularios no se envían a través de PHP.
- Realiza las modificaciones en la BD que sean necesarias.
- La nueva página debe seguir el estilo del resto de la página web

----

## Estructura

APIs:

	COMENTARIOS
		agregarcomentarios.js
		mostrarcomentarios.js

	CATEGORIAS
		filtrarcategorias.js

	QR
		localStoragePedido.js
		qr.js

	PROPINA
		propina.js

	PUNTOS
		puntos.js

Controlador para las API:

	class APIController:   

		COMENTARIOS
	    	public function mostrarcomentarios()
	    	public function comprobarusuario()
	    	public function agregarcomentarios()

		QR
	    	public function datosultimopedido() 

		PROPINA
	    	public function guardarPropina() 

		PUNTOS
	    	public function guardarPuntos() 
	    	public function mostrarPuntos() 
	    	public function gastarPuntos()

Vistas utilizadas

	COMENTARIOS
		panelIndex

	QR
		panelFinal

	CATEGORIAS
		panelProductos

	PROPINA + PUNTOS
		panelCesta

----
## Desarrollo

En este punto explicaré de forma breve como se ha realizado cada funcionalidad:
### Reseñas del restaurante

#### Obtener comentarios

	El script que llama a la API dispone de un "addEventListener('DOMContentLoaded...", el cual envia la petición al controlador de la API para que este recoja datos de la base de datos mediante ComentarioDAO a partir del objeto Comentario.

	Una vez la petición ha sido lanzada y se han recogido los datos estos se dirigen en sentido contrario por decirlo de algun modo, ya que la finalidad es mostrarlos en la vista, para ello los imprimiremos mediante un bucle y dentro de un <div> para que sea más facil de formatear en cuanto a diseño. En mi caso he intentado implementarlo de forma sutil llegando al footer de la main page, pues he añadido una scrollbar al div y de esta forma no perjudica a la verticalidad de la web.

#### Insertar comentarios

	Realizamos el proceso anterior pero a la inversa pues el flujo de datos es recoger las variables de los campos del formulario con la API, enviarlas al controlador y finalmente preparar una consulta para realizar un INSERT desde ComentarioDAO.
	Es muy importante que tengamos en cuenta un parametro de clasificacion a la forma de crear el objeto; en este caso del 1 al 5 pues en otro paso tendremos que realizar un sistema de filtrado sobre esto.
	Si se inserta correctamente o falla Notie.js lo notifica y en caso de un usuario no estar logueado lo redirecciona a vistaLogin.php.
	
![[Pasted image 20240217115648.png]]

#### Filtrar comentarios

	Esto lo realizaremos puramente desde la API sin necesidad de controlador ya que este es un paso intermedio al obtener comentarios.
	Primero filtraremos por estrellas, del 1 al 5, si seleccionamos varias solo nos tendran que aparecer las seleccionadas, por ejemplo: 3 y 5 sí | 1, 2 y 4 no aparecerán.
	Segundo, sobre este primer filtro aplicaremos otro, que se encargará de ordenar la lista ascendente o descendentemente, por ejemplo: 3 y 5 | 5 al 3.
	Tercero y último, realizaremos un filtro exactamente igual que el segundo pero lo enfocaremos a que se ejecute cuando esten todas las estrellas marcadas o todas desmarcadas.

![[Pasted image 20240217115604.png]]
### Programa de fidelidad

#### Obtener puntos

	Recogemos el precio desde la vista mediante JavaScript 'document.querySelector', pero hay que tener en cuenta que debemos pasar el valor de float/decimal a int. 
	Aplicaremos la siguiente regla de tres: 1€ del precio total = punto ganado, por ejemplo, si el usuario gasta 47€ gana 47 puntos, si gasta 47.90€ tambien gana 47 puntos.
	Las recogemos con el ApiController y las convertimos a variables de sesion ya que solo nos interesa que exista durante el proceso de uso de un usuario logueado.
	Mostramos por pantalla en tiempo real en el panel de finalizar pedido cuantos puntos puede obtener con la compra.
	
	(!) Todo esto lo llevamos a cestaController > finalizar().

```
	`let puntos = 0;`
	`document.addEventListener('DOMContentLoaded', function () {`

    `// Obtener el precio total del pedido`
    `let precioTotalJS = parseFloat(document.querySelector('.precioTotalVista').value);`

    `// Calcular los puntos`
    `let puntos = Math.floor(precioTotalJS);`

    `// Muestra el valor de la puntos en algún lugar (como un div con clase 'puntosVista')`
    `let puntosElemento = document.querySelector('.puntosVista');`
    `puntosElemento.textContent = "Finaliza el pedido y obtén " + puntos + " puntos.";`

    `// Envía la cantidad de puntos al servidor`
    `let cuerpoSolicitud = { puntos: puntos };`
    `var parametrosFetch = {`
        `method: 'POST',`
        `headers: { 'Content-Type': 'application/json' },`
        `body: JSON.stringify(cuerpoSolicitud)`
    `};`

    `// GUARDAR PUNTOS`
    `fetch('http://localhost/primor/index.php?controller=api&action=guardarPuntos', parametrosFetch)`

        `.then(response => {`
            `if (!response.ok) {`
                `throw new Error('La solicitud falló');`
            `}`
            `// Leer el cuerpo de la respuesta como JSON`
        `})`
        `.then(data => {`
            `// Hacer algo con los datos (si los hay)`
            `console.log('Respuesta del servidor:', data);`
        `})`
```
#### Mostrar puntos

	Recogemos los puntos de la base de datos del usuario ya que se le ha creado una columna especifica para los puntos de fidelidad. Si decide gastarlos se envia el descuento final en forma de variable de sesion al igual que en el apartado anterior.
	Lo mostramos por pantalla en tiempo real en el panel de finalizar pedido.

```
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
```
#### Gastar puntos

	Aqui la regla de tres es la siguiente, cada 100 puntos gastados se aplican 10€ de descuento sobre el precio total, la condicion es que se gastan TODOS los puntos de golpe, por ejemplo: 300 puntos son 30€ de descuento, 380 puntos tambien son 30€ de descuento, me he basado en varios webs que utilizan este sistema, siempre incentivando a acumular y acumular.
	Utilizamos las variables producidas por el proceso de mostrar puntos ya que lo engloba la misma API y mostramos por pantalla en tiempo real en el panel de finalizar pedido.
	
	(!) Todo esto lo llevamos a cestaController > finalizar().
	
```
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
```
***Ahora todas las variables de sesión las utilizamos dentro de cestaController > finalizar(), es decir, cuando el usuario pulse el botón de finalizar compra realizará las operaciones pertinentes (UPDATE) sobre la columna "puntos" del usuario, siempre en base si este gasta puntos o los acumula. Al unificar tanto las variables en una sola función nos permite calcular de forma más rápida e incluso almacenar en pedido los puntos gastados y obtenidos en una compra.***

	Cabe decir que si el usuario tiene menos de 100 puntos no podrá gastarlos, en caso de que el pedido le salga gratis, por ejemplo 200 puntos (20€) de descuento en un pedido de 10€ en la base de datos de pedidos el valor será 0.00€ pero nunca negativo. Tambien se le indicará que le ha salido gratis. No aparece nada de esta funcionalidad si el usuario no ha iniciado sesión.

	Si no tienes suficientes puntos:
	
	![[Pasted image 20240217113256.png]]
	
	Si dispones de 100 puntos o más. (Puedes optar a descuento)
	
	![[Pasted image 20240217112454.png]]

```
	                <p class="puntosVista"></p>
                <?php
                if (isset($_SESSION['user'])) {
                  if ($_SESSION['puntosMostrar'] >= 99) { ?>
                    <div class="containerPuntos">
                        <input type="checkbox" id="checkbox" name="checkbox">
                        <label for="checkbox" id="mostrarPuntos"></label>
                    </div>
                    <p style="font-size: 12px; font-style:italic">* 100 puntos = 10€ descuento</p>
                    <!-- <p id="mostrarPuntos"></p> -->
                    <p id="precioConDescuento"></p>
                <?php
                  }
                }
                ?>
```

### QR

	Recogemos el contenido del pedido de la cesta, y al finalizar la compra este se nos muestra en formato QR para que el usuario pueda consultar su ultimo pedido.
	Para ello lo almacenamos en localStorage y se lo pasamos a la API, que se encargará de descodificarlo, formatear el array para finalmente ser monstrado en formato QR desde panelFinal.


```
`let url = https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=${encodeURIComponent(localStorage.getItem('contenidoPedido'))};`

`// Crear elemento img directamente`

`const imgElement = document.createElement('img');`

`imgElement.src = url;`

`document.getElementById('qrCodeContainer').appendChild(imgElement);`
```
	
	![[Pasted image 20240217112549.png]]
### Propinas

	Recogemos el valor de la variable del radio segun el checkbox seleccionado utilizando la API de JavaScript para ello, para evitar inyecciones de código esta variable la pasamos a la API y ahi calculamos el valor de propina segun el valor del radio en un switch case. Tambien nos lo devuelve por pantalla en tiempo real.
	
	![[Pasted image 20240217112817.png]]

	Al igual que con los puntos la API calcula el valor de la propina y el controlador de esta lo envia a cestaController > finalizar() en forma de variable de sesión.

	Ya todo calculado al finalizar pedido se almacena en sus columnas respectivas dentro del pedido en la BBDD, precio+propina y propina.

```
	document.addEventListener('DOMContentLoaded', function() {

  // Obtén todos los elementos de radio en un NodeList
  let radios = document.querySelectorAll('input[name="miRadio"]');
  let propinaMultiplicador = 0.03; //DEFAULT 3%

  // Obtén el precio total desde el input con clase 'precioTotal'
  let precioTotalJS = parseFloat(document.querySelector('.precioTotalVista').value);

  // Calcula el valor de propina
  let propina = precioTotalJS * propinaMultiplicador;

  // Muestra el valor de la propina en algún lugar (como un div con clase 'precioPropina')
  let propinaElemento = document.querySelector('.precioPropinaVista');
  propinaElemento.textContent = "La propina aplicada es de: " + propina.toFixed(2) + "€";

  // Itera sobre los radios y agrega un event listener a cada uno
  radios.forEach(function(radio) {
    radio.addEventListener('change', function() {
      // Dependiendo de qué opción de radio se seleccionó, actualiza el valor de la letiable JavaScript
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
      let precioTotalJS = parseFloat(document.querySelector('.precioTotalVista').value);
      
      // Calcula el valor de propina
      let propina = precioTotalJS * propinaMultiplicador;
      
      // Muestra el valor de la propina en algún lugar (como un div con clase 'precioPropina')
      let propinaElemento = document.querySelector('.precioPropinaVista');
      propinaElemento.textContent = "La propina aplicada es de: " + propina.toFixed(2) + "€";
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
```


### Filtro de productos/categorías

	En este apartado la API recoge el valor del desplegable, y lo relaciona con el del div que contenga X categoria, pues este lo muestra y el resto lo oculta mediante Display: none.

	Ya que la parte de filtrar especificamente lo he hecho en las estrellas de las valoraciones aqui le he dado un enfoque diferente ya que mi web dispone de categorias en bloque y no de productos individuales pertenecientes a categorias.

```
		    `// Script para filtrar las categorías`
    `document.addEventListener("DOMContentLoaded", function () {`

        `// Manejador de cambio en el formulario de selección`
        `document.getElementById("categoryFilterForm").addEventListener("change", function () {`

            `// Obtener el valor seleccionado`
            `console.log("Categoría seleccionada:", this.elements["categoryFilter"].value);`
            `let selectedCategory = this.elements["categoryFilter"].value;`

            `// Ocultar todos los contenedores de productos`
            `document.querySelectorAll('.categoria-container').forEach(function (container) {`
                `container.style.display = 'none';`
            `});`

            `// Mostrar solo el contenedor de la categoría seleccionada`
            `if (selectedCategory !== 'all') {`
                `document.querySelector('.' + selectedCategory).style.display = 'block';`

            `} else {`

                `// Si se selecciona "Todas", mostrar todos los contenedores`
                `document.querySelectorAll('.categoria-container').forEach(function (container) {`
                    `container.style.display = 'block';`

                `});`
            `}`
        `});`
    `});`
```

	![[Pasted image 20240217115402.png]]
	
## Dificultades

Si bien el plazo ya era algo ajustado han sido muchas las dificultades que nos hemos encontrado tanto individualmente como el conjunto de alumnos, algunas de ellas son:

- Plazo ajustado.
- Explicaciones del siguiente proyecto durante el actual, si bien aun agrava más el anterior punto.
- Problemas con la caché que no permiten ver realmente el valor almacenado en algunos objetos.
- Problema con algunos útiles que forman parte de los requisitos como bien puede ser el "axios", se han tenido que buscar alternativas.
- Problemas de conexión o de configuración del sitio web en el Plesk, por algún motivo tras haber realizado el mismo procedimiento desde cero en reiteradas ocasiones e incluso junto a mis compañeros replicar su misma configuración no detecta bien las rutas y/o causa muchos problemas con comillas, mayúsculas, etc.
- Presentación de nuevos requisitos a última hora como puede ser el caso de subir la web al servidor Plesk o tener que realizar por primera vez un "readme.md" para documentar todo. Si tenemos en cuenta el punto anterior mas una plazo ajustado no es nada fácil de sobrellevar moralmente.
- A diferencia del anterior proyecto se  echa en falta ejemplos prácticos o explicaciones que se aproximen a lo que estamos haciendo, por ejemplo: el videoclub PHP con el profesor Rubén.

----
## Conclusión 

Personalmente este proyecto no ha sido muy fructuoso ya que se podría haber puesto algún requisito como opcional para reducir la carga del trabajo y así poder realizar un proceso de calidad y lo más importante; aprender de ello pues esa es la finalidad, sin embargo el clima en el aula a veces parecía indicar lo contrario. O al menos cambiar el formato y realizarlo en forma de actividades con entrega semanal. Supongo que de cara al siguiente proyecto (Laravel+Vue) veremos de primera mano si esta breve introducción nos ha sido de ayuda.
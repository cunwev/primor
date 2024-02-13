<?php

include_once 'model/ProductoDAO.php';
include_once 'model/PedidoDAO.php';
include_once 'model/Pedido.php';


class CestaController
{

    public function cesta()
    {
        $allProducts = ProductoDAO::getAllProducts();
        // Panel cesta
        include_once 'views/panelCesta.php';
    }

    public function eliminarProductoCesta()
    {
        unset($_SESSION['addproducto'][$_POST['btn_borrar']]);
        $_SESSION['addproducto'] = array_values($_SESSION['addproducto']);

        $this->cesta();
    }


    public function cantidadProducto()
    {
        if (isset($_POST['btn_suma'])) {
            $pedido = $_SESSION['addproducto'][$_POST['btn_suma']];
            $pedido->setCantidad($pedido->getCantidad() + 1);
        } elseif (isset($_POST['btn_resta'])) {
            $pedido = $_SESSION['addproducto'][$_POST['btn_resta']];
            if ($pedido->getCantidad() == 1) {
                unset($_SESSION['addproducto'][$_POST['btn_resta']]);

                //se reindexa el array
                $_SESSION['addproducto'] = array_values($_SESSION['addproducto']);
            } else {
                $pedido->setCantidad($pedido->getCantidad() - 1);
            }
        }

        $this->cesta();
    }


    public function final()
    {
        include_once 'views/panelFinal.php';
    }


    //Función nexo para almacenar el pedido, mostrar el pedido en el panel final, calcular propina, almacenar puntos.
    public function finalizar(){
        
    //Obtenemos los puntos de la SESSION
    $puntos = $_SESSION['puntosSumar'];
    //Obtenemos la ID del usuario de la SESSION
    $user_id = $_SESSION['iduser'];
    //Obtenemos la propina de la SESSION, la convertimos en valor tipo float
    $propina = floatval($_SESSION['propina']);
    $precioFinal = $_POST['precioFinal'] + $propina;
    $fechaActual = date('Y-m-d');

    // Inicializa una variable para almacenar la salida
    $contenidoPedido = "";

    foreach ($_SESSION['addproducto'] as $pedido) {
        // Concatena la información de cada pedido a la variable $contenido
        $contenidoPedido .= "[" . $pedido->getcantidad() . "|" . $pedido->getProducto()->getnombre() . "|" . $pedido->getCategoria() . "|" . $pedido->getProducto()->getimagen() . "|" . $pedido->getProducto()->getprecio() . "]";
    }

    // Convierte el array a formato JSON
    $contenidoPedidoJSON = json_encode($contenidoPedido, JSON_UNESCAPED_UNICODE);


    // Inserta el producto en la base de datos
    $exito = PedidoDAO::insertPedido($user_id, $contenidoPedidoJSON, $precioFinal, $fechaActual);

    // Inserta los puntos en la base de datos
    $exito = PedidoDAO::insertPuntos($user_id, $puntos);

    if ($exito) {
        $this->final();
        $productos = explode("]", $contenidoPedidoJSON);

        // Iterar sobre los productos
        foreach ($productos as $index => $producto) {
            // Limpiar caracteres no deseados
            $producto = str_replace(["[", '"'], "", $producto);

            // Dividir cada producto en sus elementos
            $elementos = explode("|", $producto);

            // Verificar si existen los índices y no están vacíos antes de imprimir
            if (isset($elementos[0]) && $elementos[0] !== "") {
                echo "Cantidad: " . $elementos[0] . "<br>";
            }
            if (isset($elementos[1]) && $elementos[1] !== "") {
                echo "Nombre: " . $elementos[1] . "<br>";
            }
            if (isset($elementos[2]) && $elementos[2] !== "") {
                echo "Categoria: " . $elementos[2] . "<br>";
            }
            if (isset($elementos[3]) && $elementos[3] !== "") {
                echo "Imagen: " . $elementos[3] . "<br>";
            }
            if (isset($elementos[4]) && $elementos[4] !== "") {
                echo "Precio: " . $elementos[4] . " €<br>";

                // Calcular y mostrar el total solo si la cantidad es mayor a 1
                $cantidad = isset($elementos[0]) ? $elementos[0] : 0;
                if ($cantidad > 1) {
                    $precio = isset($elementos[4]) ? $elementos[4] : 0;
                    $total = $cantidad * $precio;
                    echo "(" . $total . " €)<br>";
                }
            }

            // Verificar si es el último elemento antes de imprimir <hr>
            if ($index < count($productos) - 1) {
                echo "<hr>";
            }
        }

        include_once "views/panelFinal.php";
        include_once "views/footer.php";
    } else {
        echo "Error al insertar el producto";
    }
}





}

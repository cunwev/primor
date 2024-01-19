<?php

include_once 'model/ProductoDAO.php';
include_once 'model/PedidoDAO.php';
include_once 'model/Pedido.php';

class CestaController{

    public function cesta(){
        $allProducts = ProductoDAO::getAllProducts();
        // Panel cesta
        include_once 'views/panelCesta.php';
    }

    public function eliminarProductoCesta(){
        unset($_SESSION['addproducto'][$_POST['btn_borrar']]);
        $_SESSION['addproducto'] = array_values($_SESSION['addproducto']);
        
        $this->cesta();
    }


    public function cantidadProducto(){
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


    public function final(){
        include_once 'views/panelFinal.php';
    }
    

    public function finalizar(){
        $user_id = $_SESSION['iduser'];
        $precioFinal = $_POST['precioFinal'];
        $fechaActual = date('Y-m-d');

        // Inicializa una variable para almacenar la salida
        $contenidoPedido = "";

        foreach ($_SESSION['addproducto'] as $pedido) {
            // Concatena la información de cada pedido a la variable $contenido
            $contenidoPedido .= "[" . $pedido->getcantidad() . "|" . $pedido->getProducto()->getnombre() . "|" . $pedido->getCategoria() . "|" . $pedido->getProducto()->getimagen() . "|" . $pedido->getProducto()->getprecio() . "]";
        }

        // Puedes imprimir o utilizar la variable $contenido según tus necesidades
        echo $contenidoPedido;

        // Establece la cookie
        setcookie($_SESSION['iduser'], $precioFinal, time() + 3600);

        // Convierte el array a formato JSON
        $contenidoPedidoJSON = json_encode($contenidoPedido, JSON_UNESCAPED_UNICODE);
        echo $contenidoPedidoJSON;
        // Inserta el producto en la base de datos
        $exito = PedidoDAO::insertPedido($user_id, $contenidoPedidoJSON, $precioFinal, $fechaActual);

        if ($exito) {
            echo "Producto insertado correctamente";
            $this->final(); //header('Location:' . url . '?controller=cesta&action=final');
        } else {
            echo "Error al insertar el producto";
        }
    }
}

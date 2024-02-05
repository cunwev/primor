<?php
//Esto es un NUEVO CONTROLADOR
//hacer todas las configuraciones necesarias para que funcione como controlador

/** IMPORTANTE**/
//Cargar Modelos necesarios BBDD

/** IMPORTANTE**/
//Instala la extensión Thunder Client en VSC. Te permite probar si tu API funciona correctamente.

include_once 'model/ComentarioDAO.php';
class APIController{    

    public function mostrarcomentarios(){
            // Si quieres devolverle información al JS, codificas en json un array con la información
            // y se los devuelves al JS
            $comentarios = ComentarioDAO::mostrarcomentarios();

            echo json_encode($comentarios, JSON_UNESCAPED_UNICODE) ; 

            return; //return para salir de la funcion

    }

    public function datosultimopedido() {
        $pedidos = $_SESSION['addproducto'];
        $array = [];
    
        foreach ($pedidos as $pedido) {
    
            $array[] = [
                'Categoria_Producto' => $pedido->getCategoria(),
                'Nombre_Producto' => $pedido->getProducto()->getnombre(),
                'Precio_Producto' => $pedido->getProducto()->getprecio(),
                'Imagen_Producto' => $pedido->getProducto()->getimagen(),
                'Producto_ID' => $pedido->getProducto()->getproducto_id(),
                'Stock' => $pedido->getProducto()->getStock(),
                'Categoria_ID' => $pedido->getProducto()->getcategoria_id(),
                'Nombre_Categoria' => $pedido->getProducto()->getNombreCategoria(),
                'cantidad' => $pedido->getcantidad(),
            ];
        }

        echo json_encode($array, JSON_UNESCAPED_UNICODE);
        return;
    }
}
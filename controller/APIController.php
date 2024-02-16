<?php
//session_start();  Iniciamos la sesión si no se ha iniciado aún, quiza se pueda eliminar mas adelante.
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


    public function comprobarusuario(){
        $userid = $_SESSION['userid'];
        // Enviar respuesta al cliente
        $response = array(
            'userid' => $userid
        );
        echo json_encode($response);
    }


    public function agregarcomentarios(){
        $valorComentario = json_decode(file_get_contents('php://input'), true);

        $_SESSION['titulo'] = $valorComentario['titulo'];
        $_SESSION['comentario'] = $valorComentario['comentario'];
        $_SESSION['valoracion'] = $valorComentario['valoracion'];

        ComentarioDAO::insertcomentarios();
        return;
}

    // QR -------------------------------------------------------------------------------------------------------------------------
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
        //const localStorage.setItem('contenidoPedido');
        echo json_encode($array, JSON_UNESCAPED_UNICODE);

        return;
    }

    //PROPINA -------------------------------------------------------------------------------------------------------------------------
    // Función para guardar el valor de la propina en la sesión del usuario
    public function guardarPropina() {

        // Obtenemos el valor de la propina del cuerpo de la solicitud JSON
        $valorPropina = json_decode(file_get_contents('php://input'), true);

        // Lo guardaremos en una variable:
        $propina = $valorPropina['propina'];

        // Almacenaremos el valor de la propina en la sesión del usuario:
        $_SESSION['propina'] = $propina;

        return;
    }

    //PUNTOS -------------------------------------------------------------------------------------------------------------------------
    // Función para guardar el valor de los puntos en la sesión del usuario
    public function guardarPuntos() {

        // Obtenemos el valor de los puntos del cuerpo de la solicitud JSON
        $valorPuntos = json_decode(file_get_contents('php://input'), true);

        // Lo guardaremos en una variable:
        $puntos = $valorPuntos['puntos'];

        // Almacenaremos el valor de los puntos en la sesión del usuario:
        $_SESSION['puntosSumar'] = $puntos;

        return;
    }

    // Función para mostrar el valor de los puntos en la sesión del usuario
    public function mostrarPuntos() {

        $userid = $_SESSION['iduser'];
        PedidoDAO::mostrarPuntos($userid);
        $puntos = $_SESSION['puntosMostrar'];


        echo json_encode($puntos, JSON_UNESCAPED_UNICODE);

        return;
    }

    // Función para gastar los puntos
    public function gastarPuntos() {

        // Obtenemos el valor de los puntos del cuerpo de la solicitud JSON
        $checkboxPuntos = json_decode(file_get_contents('php://input'), true);

        // Lo guardaremos en una variable:
        $checkboxPuntosValue = $checkboxPuntos['checkbox'];

        // Almacenaremos el valor de los puntos en la sesión del usuario:
        $_SESSION['checkboxPuntos'] = $checkboxPuntosValue;
        return;
    }
}
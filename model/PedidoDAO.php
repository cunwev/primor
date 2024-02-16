<?php

include_once 'config/database.php';
include_once 'Pedido.php';

class PedidoDAO {

    public static function insertPedido($user_id, $contenidoPedidoJSON, $precioFinal, $propina, $puntosGastar, $puntos, $fechaActual){
        $conexion = Database::connect();

        $user_ide = $user_id;
        $pedido = $contenidoPedidoJSON;
        $precioTotal = $precioFinal;
        $propinae = $propina;
        $puntos_utilizados = $puntosGastar;
        $puntos_obtenidos = $puntos;
        $fecha = $fechaActual;
        
        $stmt = $conexion->prepare("INSERT INTO `pedidos` (user_id, pedido, precio, propina, puntos_utilizados, puntos_obtenidos, fecha) VALUES (?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("isddiis", $user_ide, $pedido, $precioTotal, $propinae, $puntos_utilizados, $puntos_obtenidos, $fecha);
        


        $exito = $stmt->execute();
        $stmt->close();
        return $exito;
    }


    //Al realizar el pedido se insertan los puntos en el usuario
    public static function insertPuntos($user_id, $puntos) {

        // Conexion con la basse de datos
        $conexion = DataBase::connect();
        
        $user_ide = $user_id;
        $puntose = $puntos;

        // Preparamos la consulta para actualizar los puntos del usuario actual
        $stmt = $conexion->prepare("UPDATE usuarios SET puntos = puntos + ? WHERE user_id = ?");
        $stmt->bind_param("ii", $puntose, $user_ide);

        $exito = $stmt->execute();
        $stmt->close();
        return $exito;
    }



    public static function mostrarPuntos($user_id) {

        // Conexión con la base de datos
        $conexion = DataBase::connect();
        
        // Preparamos la consulta para seleccionar los puntos del usuario
        $stmt = $conexion->prepare("SELECT puntos FROM usuarios WHERE user_id = ?");
        $stmt->bind_param("i", $user_id);
    
        // Ejecutamos la consulta
        $stmt->execute();
        
        // Obtenemos el resultado de la consulta
        $resultado = $stmt->get_result();
        
        // Verificamos si se encontró algún resultado
        if ($resultado->num_rows > 0) {
            // Obtenemos el valor de los puntos
            $fila = $resultado->fetch_assoc();
            $puntos = $fila['puntos'];
            
            // Almacenamos los puntos en una sesión
            $_SESSION['puntosMostrar'] = $puntos;
            
            // Cerramos el statement
            $stmt->close();
            
            // Retornamos los puntos obtenidos
            return;
        } else {
            // Si no se encontraron resultados, retornamos 0
            $stmt->close();
            return 0;
        }
    }

        //Al realizar el pedido se insertan los puntos en el usuario
        public static function updatePuntos($user_id) {

            // Conexion con la basse de datos
            $conexion = DataBase::connect();
            
            $user_ide = $user_id;
    
            // Preparamos la consulta para actualizar los puntos del usuario actual
            $stmt = $conexion->prepare("UPDATE usuarios SET puntos = 0 WHERE user_id = ?");
            $stmt->bind_param("i", $user_ide);
    
            $exito = $stmt->execute();
            $stmt->close();
            return $exito;
        }
}
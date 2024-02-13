<?php

include_once 'config/database.php';
include_once 'Pedido.php';

class PedidoDAO {

    public static function insertPedido($user_id, $contenidoPedidoJSON, $precioFinal, $fechaActual){
        $conexion = Database::connect();

        $user_ide = $user_id;
        $pedido = $contenidoPedidoJSON;
        $precioTotal = $precioFinal;
        $fecha = $fechaActual;
        
        $stmt = $conexion->prepare("INSERT INTO `pedidos` (user_id, pedido, precio, fecha) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("isis", $user_ide, $pedido, $precioTotal, $fecha);
        


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

    //Muestra los puntos de los que dispone el usuario.
    public static function mostrarPuntos($user_id) {

        // Conexion con la basse de datos
        $conexion = DataBase::connect();
        
        $user_ide = $user_id;

        // Preparamos la consulta para actualizar los puntos del usuario actual
        $stmt = $conexion->prepare("SELECT usuarios WHERE user_id = ?");
        $stmt->bind_param("i", $user_ide);

        $exito = $stmt->execute();
        $stmt->close();
        return $exito;
    }
}
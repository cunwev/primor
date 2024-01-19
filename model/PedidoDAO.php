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

}
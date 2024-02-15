<?php

include_once 'config/dataBase.php';
include_once 'Comentario.php';


class ComentarioDAO{ 

    public static function mostrarcomentarios() {
        // Conexion con la basse de datos
        $conexion = DataBase::connect();

        // Se hace una consulta con la base de datos donde nos devolvera todaos los comentarios
        $stmt = $conexion->query("
            SELECT comentarios.comentario_id, usuarios.nombre, comentarios.titulo, comentarios.comentario, comentarios.valoracion 
            FROM comentarios 
            LEFT JOIN usuarios ON comentarios.user_id = usuarios.user_id
            WHERE comentarios.user_id=usuarios.user_id
        ");

        /// Se crea una array para guardar los valores
        $comentarios = [];

        // Se guardan los resultados como un objeto de la classe Comentario
        while ($row = $stmt->fetch_assoc()) {
                $comentarios[] = [
                    'comentario_id'=> $row['comentario_id'],
                    'nombre'=> $row['nombre'],
                    'titulo'=> $row['titulo'],
                    'comentario'=> $row['comentario'],
                    'valoracion'=> $row['valoracion']
                ];
        }


        // Se devuelve comentarios
        return $comentarios;
    }

    public static function insertcomentarios() {
        // Conexion con la base de datos
        $conexion = DataBase::connect();
        $user_id = $_SESSION['iduser'];
        $titulo = $_SESSION['titulo'];
        $comentario = $_SESSION['comentario'];
        $valoracion = $_SESSION['valoracion'];

        $stmt = $conexion->prepare("INSERT INTO COMENTARIOS (user_id, titulo, comentario, valoracion) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("issi", $user_id, $titulo, $comentario, $valoracion);

        $exito = $stmt->execute();
        $stmt->close();
        return $exito;
    }
}
?>
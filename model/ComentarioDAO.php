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

}
?>
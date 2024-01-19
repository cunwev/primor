<?php

include_once 'config/database.php';
include_once 'Comentario.php';

class ComentarioDAO
{
    public static function insertComentario($comentario)
    {
        $conexion = Database::connect();

        $comentario_id = $comentario->getComentarioId();
        $user_id = $comentario->getUserId();
        $titulo = $comentario->getTitulo();
        $comentario_texto = $comentario->getComentario();
        $valoracion = $comentario->getValoracion();

        $stmt = $conexion->prepare("INSERT INTO comentarios (comentario_id, user_id, titulo, comentario, valoracion) VALUES (?, ?, ?, ?, ?)");
        $stmt->bind_param("iissi", $comentario_id, $user_id, $titulo, $comentario_texto, $valoracion); // iisss = Int, Int, String, String, Int

        $success = $stmt->execute();
        $stmt->close();

        return $success;
    }


    // Crearemos una función que nos recoja todas los comentarios de la base de datos:
    public static function getAllComentarios()
    {
        // Conexion con la basse de datos
        $conexion = DataBase::connect();

        // Se hace una consulta con la base de datos donde nos devolvera todos los comentarios
        $stmt = $conexion->query("SELECT * FROM COMENTARIO");

        /// Se crea una array para guardar los valores
        $comentarios = [];

        // Se gurdan los resultados como un objeto de la classe Comentario
        while ($row = $stmt->fetch_assoc()) {

            $comentarios[] = [
                'id_comentario' => $row['id_comentario'],
                'id_cliente' => $row['id_cliente'],
                'nombre' => $row['nombre'],
                'opinion' => $row['opinion'],
                'puntuacion' => $row['puntuacion']
            ];
        }

        return $comentarios;
    }

    public static function agregarComentario()
    {
    }
}

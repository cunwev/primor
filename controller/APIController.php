<?php

    include_once 'config/dataBase.php';
    include_once 'modelo/ComentarioDAO.php';

    // API devuelve JSON, PANEL VACIO QUE HACE UN FETCH PARA CARGAR TODAS LAS RESEÑAS
    class apiController {

        public function mostrarComentarios() {

            $comentarios = ComentarioDAO::getAllComentarios();

            echo json_encode($comentarios, JSON_UNESCAPED_UNICODE) ; 

            return;
        }

        public function solicitudCrearComentario(){
            include 'vistas/header.php';
        
            // Verificaremos si ha iniciado sesión previamente:
            if(isset($_SESSION['usuario_id']) && isset($_SESSION['usuario_nombre']) && isset($_SESSION['password']) && isset($_SESSION['tipo_usuario'])){
                
                include 'vistas/panelCrearComentario.php';
            } else {
                // Si las variables de sesión no existen, le mandaremos al panel que le preguntará si quiere iniciar sesión:
                include 'vistas/panelInicioSesionRequerido.php';
            }
        
            include 'vistas/footer.php';
        }
        
                
        // public function api(){
        
        //     if($_POST["accion"] == 'buscar_pedido'){

        //         $id_usuario = json_decode($_POST["id_usuario"]); //se decodifican los datos JSON que se reciben desde JS
        //         $pedidos = xxxxxxxxxxx; //puedes hacer un select de pedidos aqui, o un insert o lo que quieras, utilizando el MODELO
                
        //         // Si quieres devolverle información al JS, codificas en json un array con la información
        //         // y se los devuelves al JS
        //         echo json_encode($pedidos, JSON_UNESCAPED_UNICODE) ; 
        //         return; //return para salir de la funcion

        //     }else if($_POST["accion"] == 'add_review'){

        //         $id_pedido = json_decode($_POST["pedido"]); //se decodifican los datos JSON que se reciben desde JS
        //         $id_usuario = json_decode($_POST["id_usuario"]); //se decodifican los datos JSON que se reciben desde JS
                
        //         /*

        //             Otras operaciones

        //         */
                
        //         //si solo quieres devolver un pequeño mensaje, simplemente puedes hacer un echo de texto
        //         echo "Bienvenido Pedrito" 
        //         return;
        //     }
        // }

    }
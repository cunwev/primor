<?php

class Comentario{
    private $comentario_id;
    private $nombre;
    private $titulo;
    private $comentario;
    private $valoracion;

    // Define the constructor of the class
    public function __construct($comentario_id, $nombre, $titulo, $comentario, $valoracion){
        $this->comentario_id = $comentario_id;
        $this->nombre = $nombre;
        $this->titulo = $titulo;
        $this->comentario = $comentario;
        $this->valoracion = $valoracion;
    }

    /**
     * Get the value of comentario_id
     */
    public function getComentarioId()
    {
        return $this->comentario_id;
    }

    /**
     * Set the value of comentario_id
     */
    public function setComentarioId($comentario_id): self
    {
        $this->comentario_id = $comentario_id;
        return $this;
    }

    /**
     * Get the value of nombre
     */
    public function getNombre()
    {
        return $this->nombre;
    }

    /**
     * Set the value of nombre
     */
    public function setNombre($nombre): self
    {
        $this->nombre = $nombre;
        return $this;
    }

    /**
     * Get the value of titulo
     */
    public function getTitulo()
    {
        return $this->titulo;
    }

    /**
     * Set the value of titulo
     */
    public function setTitulo($titulo): self
    {
        $this->titulo = $titulo;
        return $this;
    }

    /**
     * Get the value of comentario
     */
    public function getComentario()
    {
        return $this->comentario;
    }

    /**
     * Set the value of comentario
     */
    public function setComentario($comentario): self
    {
        $this->comentario = $comentario;
        return $this;
    }

    /**
     * Get the value of valoracion
     */
    public function getValoracion()
    {
        return $this->valoracion;
    }

    /**
     * Set the value of valoracion
     */
    public function setValoracion($valoracion): self
    {
        $this->valoracion = $valoracion;
        return $this;
    }
}

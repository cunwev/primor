<?php

Class CalculadoraPrecios{

    public static function calculadorPrecioPedido($pedidos){
        $precioTotal = 0;
        
        foreach ($pedidos as $pedido){
            $precioTotal += $pedido->getProducto()->getprecio()*$pedido->getCantidad();
        }
        return number_format($precioTotal, 2);
    }



    public static function precioTotalPedido ($pedidos, $propinaSeleccionada) {

        $subTotal = self::calculadorPrecioPedido($pedidos);

        $precioTotal = $subTotal + ($subTotal * $propinaSeleccionada);

        $_SESSION['precioTotalPedido'] = $precioTotal + $_SESSION['propina'] ;

        return $precioTotal;

    }
}
?>
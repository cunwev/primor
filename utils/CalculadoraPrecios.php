<?php
/*Class CalculadoraPrecios{

    public static function calculadorPrecioPedido($pedidos){
        $precioTotal = 0;
        
        foreach ($pedidos as $pedido){
            $precioTotal += $pedido->getProducto()->getprecio()*$pedido->getCantidad();
        }
        
        return number_format($precioTotal, 2);
    }
}
*/


Class CalculadoraPrecios{

    public static function calculadorPrecioPedido($pedidos){
        $precioTotal = 0;
        
        foreach ($pedidos as $pedido){
            $precioTotal += $pedido->getProducto()->getprecio() * $pedido->getCantidad();
        }
        
        // Obtener la propina enviada por Axios
        $propina = isset($_POST['propina']) ? floatval($_POST['propina']) : 0;

        // Aplicar la propina al precio total
        $precioTotalConPropina = $precioTotal * (1 + $propina);

        return number_format($precioTotalConPropina, 2);
    }
}
?>
    // Script para filtrar las categorías
    document.addEventListener("DOMContentLoaded", function () {
        // Manejador de cambio en el formulario de selección
        document.getElementById("categoryFilterForm").addEventListener("change", function () {
            // Obtener el valor seleccionado
            var selectedCategory = this.elements["categoryFilter"].value;
    
            // Ocultar todos los contenedores de productos
            document.querySelectorAll('.container-xl').forEach(function (container) {
                container.style.display = 'none';
            });
    
            // Mostrar solo el contenedor de la categoría seleccionada
            if (selectedCategory !== 'all') {
                document.querySelector('.' + selectedCategory).style.display = 'block';
            } else {
                // Si se selecciona "Todas", mostrar todos los contenedores
                document.querySelectorAll('.container-xl').forEach(function (container) {
                    container.style.display = 'block';
                });
            }
        });
    });
<!DOCTYPE html PUBLIC>
<html>

<head>
  <title>Primor - CESTA</title>
  <?php include_once "views/meta.php" ?>
</head>

<body>

  <header>
    <?php include_once "views/header.php";?>
  </header>

<body>

<h2>Formulario de Valoración con Estrellitas</h2>

<form action="procesar_formulario.php" method="post">
    <label for="titulo">Título:</label>
    <input type="text" id="titulo" name="titulo" required>

    <br>

    <label for="descripcion">Descripción:</label>
    <textarea id="descripcion" name="descripcion" rows="4" required></textarea>

    <br>

    <label>Puntuación:</label>
    <div class="rating d-flex flex-row-reverse justify-content-end">
        <input type="radio" id="estrella5" name="puntuacion" value="5">
        <label for="estrella5"></label>
        <input type="radio" id="estrella4" name="puntuacion" value="4">
        <label for="estrella4"></label>
        <input type="radio" id="estrella3" name="puntuacion" value="3">
        <label for="estrella3"></label>
        <input type="radio" id="estrella2" name="puntuacion" value="2">
        <label for="estrella2"></label>
        <input type="radio" id="estrella1" name="puntuacion" value="1" checked>
        <label for="estrella1"></label>
    </div>

    <br>

    <input type="submit" value="Enviar">
</form>
</body>
<!-------------------------------------------------------------------------------->

<?php include_once "views/footer.php" ?>

</html>
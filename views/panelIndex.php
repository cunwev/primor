<!DOCTYPE html PUBLIC>
<html>

<head>
  <title>Primor</title>
  <?php include_once "views/meta.php" ?>
  <!-- <style>
    .rating {
      display: flex;
    }

    .rating input {
      display: none;
    }

    .rating label {
      cursor: pointer;
      width: 25px;
      height: 25px;
      background-image: url('assets/icons/estrella_no.svg');
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      background-size: cover;
    }

    .rating input:checked~label {
      background-image: url('assets/icons/estrella_si.svg');
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
    }

    /* Estilo para la ventana con scroll */
    .ventana-scroll {
      height: 200px;
      overflow-y: auto;
      /* Cambiado de scroll a auto */
      border: 1px solid #ccc;
      padding: 10px;
    }

    /* Ocultar la barra de desplazamiento en navegadores webkit (como Chrome y Safari) */
    .ventana-scroll::-webkit-scrollbar {
      width: 0;
      /* Ancho de la barra de desplazamiento a cero */
    }

    label {
      display: block;
      margin-bottom: 5px;
    }
  </style> -->
</head>

<body>

  <header>
    <?php include_once "views/header.php" ?>
  </header>

  <!----------------------------------------------------------------------------------------------------->

  <div class="container-xl mx-52 p-0 mt-5 mb-4 margin-mode-off">
    <div class="bg-image row m-0 p-0">
      <div class="col-md-6 m-0 p-0">
        <div class="banner-a mgright mgreset mgbottom" style="background-image: url('assets/images/banner1_1.PNG')">
        </div>
      </div>

      <div class="col-md-6 m-0 p-0">
        <div class="banner-a mgleft mgreset" style="background-image: url('assets/images/banner1_2.PNG')">
        </div>
      </div>
    </div>
  </div>

  <!---------------------------------------------------------------------------------------------------------------------------------------------->

  <h2 class="p-0 mx-0 mt-5 mb-4 text-center simple-title">CATEGORÍAS EN TENDENCIA</h2>


  <div class="container-xl p-0 my-5">
    <div class="row m-0 p-0 row-menu-home">
      <div class="col-6 col-lg-3 d-flex flex-column align-items-center justify-content-center">
        <div class="container-menu-home" style="background-image: url('assets/images/menu_imagen1.png')">
        </div>
        <div class="text-menu-home little-format d-inline-block text-center mt-3 justify-content-center align-items-end">
          <p class="p-0 m-0 fw-semibold align-self-end">Delicias del mar</p>
        </div>
      </div>

      <div class="col-6 col-lg-3 d-flex flex-column align-items-center justify-content-center">
        <div class="container-menu-home" style="background-image: url('assets/images/menu_imagen2.png')">
        </div>
        <div class="text-menu-home little-format d-inline-block text-center mt-3 justify-content-center align-items-end">
          <p class="p-0 m-0 fw-semibold align-self-end">Sabores de la tierra</p>
        </div>
      </div>

      <div class="col-6 col-lg-3 d-flex flex-column align-items-center justify-content-center">
        <div class="container-menu-home" style="background-image: url('assets/images/menu_imagen3.png')">
        </div>
        <div class="text-menu-home little-format d-inline-block text-center mt-3 justify-content-center align-items-end">
          <p class="p-0 m-0 fw-semibold align-self-end">Con un toque floral</p>
        </div>
      </div>

      <div class="col-6 col-lg-3 d-flex flex-column align-items-center justify-content-center">
        <div class="container-menu-home" style="background-image: url('assets/images/menu_imagen4.png')">
        </div>
        <div class="text-menu-home little-format d-inline-block text-center mt-3 justify-content-center align-items-end">
          <p class="p-0 m-0 fw-semibold align-self-end">Sorpresas al paladar</p>
        </div>
      </div>
    </div>

    <div class="row m-0 p-0 row-menu-home">

      <div class="col-6 col-lg-3 d-flex flex-column align-items-center justify-content-center">
        <div class="container-menu-home" style="background-image: url('assets/images/menu_imagen5.png')">
        </div>
        <div class="text-menu-home little-format d-inline-block text-center mt-3 justify-content-center align-items-end">
          <p class="p-0 m-0 fw-semibold align-self-end">Dulces secretos</p>
        </div>
      </div>

      <div class="col-6 col-lg-3 d-flex flex-column align-items-center justify-content-center">
        <div class="container-menu-home" style="background-image: url('assets/images/menu_imagen6.png')">
        </div>
        <div class="text-menu-home little-format d-inline-block text-center mt-3 justify-content-center align-items-end">
          <p class="p-0 m-0 fw-semibold align-self-end">Placeres veganos</p>
        </div>
      </div>

      <div class="col-6 col-lg-3 d-flex flex-column align-items-center justify-content-center">
        <div class="container-menu-home" style="background-image: url('assets/images/menu_imagen7.png')">
        </div>
        <div class="text-menu-home little-format d-inline-block text-center mt-3 justify-content-center align-items-end">
          <p class="p-0 m-0 fw-semibold align-self-end">Clásicos infalibles</p>
        </div>
      </div>

      <div class="col-6 col-lg-3 d-flex flex-column align-items-center justify-content-center">
        <div class="container-menu-home" style="background-image: url('assets/images/menu_imagen8.png')">
        </div>
        <div class="text-menu-home little-format d-inline-block text-center mt-3 justify-content-center align-items-end">
          <p class="p-0 m-0 fw-semibold align-self-end">Del mundo</p>
        </div>
      </div>



    </div>
  </div>
<br>
  <!---------------------------------------------------------------------------------------------------------------------------------------------->
<section class="my-5 py-5">
  <div class="bg-black my-5">
    <div class="container-xl mx-52 bg-black" style="padding: 40px 0px 40px 0px">
      <div class="row p-0 reverse d-flex justify-content-between " style="margin: 0px 0px 40px 0px;">

        <div class="main-banner-b bg-image col-12 col-md-8 m-0 p-0 mgtopbottom" style="background-image: url('assets/images/banner2.PNG')">
        </div>

        <div class="col-12 col-md-4 m-0 p-0 text-center d-flex">
          <div class="d-flex flex-column align-items-center justify-content-center mgreset p-5">
            <h3 class="p-0 m-0 mb-5 text-white">MER À VERSAILLES</h3>
            <p class="text-white text-center">"Desde el mar hasta Versalles, una brisa refrescante y con sabor floral en cada bocado"</p>
            <p class="text-white text-center">Descubre una combinación de platos inspirados más allá de las olas; desde Mousse demarisco con mayonesa derosa hasta reducción de Bouillabaisse con algas nori.</p>
            <div class="descubrir d-inline-block d-flex align-items-end">
              <p class="p-0 m-0 fw-semibold align-self-end text-white">Descubrir</p>
            </div>
          </div>
        </div>
      </div>

      <div class="row m-0 p-0 bg-black centrar-mini d-flex justify-content-between">
        <div class="banner-b big-format col-12 col-md-4 m-0 p-0">
        </div>

        <div class="banner-b big-format col-12 col-md-4 m-0 p-0">
        </div>

        <div class="banner-b big-format col-12 col-md-4 m-0 p-0">
        </div>
      </div>
    </div>
  </div>

  <div class="container-xl mx-52 p-0 mt-5 mb-4 margin-mode-off">
    <h2 class="page-title">Deja tu reseña</h2>
    <!-- Botones para ordenar -->
    <div class="container">
  <div class="row mt-3">
    <div class="col p-0">
      <form>
      <div class="form-check form-check-inline m-0 p-1">
        <button id="ascendente" type="button" class="btn-a p-1">↓ Ascendente</button>
        </div>
        <div class="form-check form-check-inline m-0 p-1">
        <button id="descendente" type="button" class="btn-a p-1">↑ Descendente</button>
        </div>
        <div class="form-check form-check-inline mr-1">
          <input class="form-check-input" type="checkbox" id="filtro-5" name="estrella" value="5">
          <label class="form-check-label" for="filtro-5">5 Estrellas</label>
        </div>
        <div class="form-check form-check-inline mr-1">
          <input class="form-check-input" type="checkbox" id="filtro-4" name="estrella" value="4">
          <label class="form-check-label" for="filtro-4">4 Estrellas</label>
        </div>
        <div class="form-check form-check-inline mr-1">
          <input class="form-check-input" type="checkbox" id="filtro-3" name="estrella" value="3">
          <label class="form-check-label" for="filtro-3">3 Estrellas</label>
        </div>
        <div class="form-check form-check-inline mr-1">
          <input class="form-check-input" type="checkbox" id="filtro-2" name="estrella" value="2">
          <label class="form-check-label" for="filtro-2">2 Estrellas</label>
        </div>
        <div class="form-check form-check-inline mr-1">
          <input class="form-check-input" type="checkbox" id="filtro-1" name="estrella" value="1">
          <label class="form-check-label" for="filtro-1">1 Estrella</label>
        </div>
      </form>
    </div>
  </div>
</div>
  <!---------------------------------------------------------------------------------------------------------------------------------------------->
    <div class="row m-0 p-0">
      <div class="col-md-8 m-0 p-0">
        <div class="mgright mgreset mgbottom" style="height: 450px">
          <div class="ventana-scroll" style="height: 100%">
            <!-- Contenido de la ventana con scroll -->
            <section id="containerReview">

            </section>
          </div>
        </div>
      </div>

      <div class="col-md-4 m-0 p-0">
        <div class="mgleft mgreset p-2" style="height: 400px !important;">
          <form class="m-0" id="resenaForm">
            <label class="label-text-login w-100">Título *</label>
            <input id="titulo" type="text" placeholder="Introduce un título" maxlength="45" style="width:100%;" required>
            <br><br>
            <label class="label-text-login w-100">Comentario *</label>
            <textarea id="comentario" placeholder="Introduce aquí tu reseña" cols="6" rows="1" maxlength="300" style="resize: none; width:100%; height:50%;" required></textarea>
            <br><br>
            <label class="label-text-login w-100">Valoración *</label>
            <div class="rating d-flex flex-row-reverse justify-content-end">
              <input type="radio" id="estrella5" name="valoracion" value="5">
              <label for="estrella5"></label>
              <input type="radio" id="estrella4" name="valoracion" value="4">
              <label for="estrella4"></label>
              <input type="radio" id="estrella3" name="valoracion" value="3">
              <label for="estrella3"></label>
              <input type="radio" id="estrella2" name="valoracion" value="2">
              <label for="estrella2"></label>
              <input type="radio" id="estrella1" name="valoracion" value="1" checked>
              <label for="estrella1"></label>
            </div>
            <br>
            </form>
            <?php if (isset($_SESSION['user'])) { ?>
            <button class="fw-semibold w-100 btn-login" type="button" id="boton_comentario">Envía tu comentario</button>
            </form>
            <?php } else { ?>
              <button class="fw-semibold w-100 btn-login" onclick="window.location.href='http://localhost/PRIMOR/index.php?controller=user&action=login'">Inicia sesión para agregar un comentario</button>
            <?php } ?>
        </div>
      </div>
    </div>
  </div>
            </section>
  <!---------------------------------------------------------------------------------------------------------------------------------------------->
  <div class="container-xl">
    <div class="row justify-content-between mx-3">
      <p class="my-4 cart-banner-text-a fw-semibold">Quizá pueda interesarte...</p>
      <?php foreach ($allProducts as $product) {
        if ($product->getcategoria_id() < 10) { ?>
          <div class="col-md-2 justify-content-center p-0 main-container-product">

            <a href="#" class="d-flex flex-column align-items-end ms-auto">
              <div class="bg-image btn-fav">
              </div>
            </a>
            <div class="text-center">
              <form action="<?= url . '?controller=producto&action=agregarProducto' ?>" method="post">
                <input type="hidden" name="id" value="<?= $product->getproducto_id() ?>">
                <input type="hidden" name="categoria" value="<?= $product->getNombreCategoria() ?>">
                <img src="assets/images/productos/<?= $product->getimagen() ?>" alt="imagen de <?= $product->getnombre() ?>" width="200px" height="200px">
                <button type="submit" class="fw-semibold btn-add-producto">AÑADIR A LA CESTA</button>
              </form>
            </div>
            <div class="sub-container-product">
              <!-- Da el nombre de la categoria en mayusculas y el nombre del producto -->
              <p class="product-categoria"><?= strtoupper($product->getNombreCategoria()) ?></p>
              <p class="product-name"><?= $product->getnombre() ?></p>
            </div>
            <div class="text-center my-4">
              <a href="#" class="btn-product-size">75g</a>
              <a href="#" class="btn-product-size">100g</a>
              <a href="#" class="btn-product-size">150g</a>
            </div>

            <div class="m-3">
              <p class="product-price"><?= $product->getprecio() . " €" ?></p>
            </div>
          </div>
      <?php }
      } ?>
    </div>
  </div>
  <script src="assets/js/agregarcomentarios.js"></script>
  <script src="assets/js/mostrarcomentarios.js"></script>
</body>

<?php include_once "views/footer.php" ?>

</html>
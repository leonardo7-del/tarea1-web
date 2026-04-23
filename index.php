<!DOCTYPE html>
<html lang="es">
<?php
    $ruta = "./";
    $titulo = "EduTech Perú - Cursos Virtuales";
    include("paginas/includes/cabecera.php");
?>
<body>
    <?php
        include("paginas/includes/menu.php");
        include("paginas/includes/cargar_clases.php");
    ?>

    <main class="container mt-4 flex-grow-1">
        <header>
            <h1 class="text-center mb-4 fw-bold" style="color: #2980B9;">
                EduTech Perú S.A.C.
            </h1>
            <hr>
        </header>

        <section>
            <article>
                <div class="card mb-4 border-0 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title fw-bold text-primary">Descripción de la Empresa</h5>
                        <p class="card-text text-muted">EduTech Perú S.A.C. es una empresa peruana dedicada a la comercialización de cursos virtuales. Nuestro equipo está compuesto por profesionales comprometidos con soluciones educativas en línea de alta calidad.</p>
                    </div>
                </div>

                <div id="mainCarousel" class="carousel slide rounded-4 overflow-hidden shadow" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="0" class="active"></button>
                        <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="1"></button>
                        <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="2"></button>
                        <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="3"></button>
                        <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="4"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active" data-bs-interval="3000">
                            <img src="https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=1200" alt="Cursos virtuales" class="d-block w-100" style="height: 450px; object-fit: cover;">
                            <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 rounded-3">
                                <h5>Cursos Virtuales</h5>
                                <p>Aprende desde cualquier lugar con nuestros cursos online</p>
                            </div>
                        </div>
                        <div class="carousel-item" data-bs-interval="3000">
                            <img src="https://images.unsplash.com/photo-1501504905252-473c47e087f8?w=1200" alt="Educación online" class="d-block w-100" style="height: 450px; object-fit: cover;">
                            <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 rounded-3">
                                <h5>Educación Online</h5>
                                <p>Calidad educativa sin fronteras</p>
                            </div>
                        </div>
                        <div class="carousel-item" data-bs-interval="3000">
                            <img src="https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=1200" alt="Aprendizaje digital" class="d-block w-100" style="height: 450px; object-fit: cover;">
                            <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 rounded-3">
                                <h5>Aprendizaje Digital</h5>
                                <p>Transforma tu futuro con conocimiento</p>
                            </div>
                        </div>
                        <div class="carousel-item" data-bs-interval="3000">
                            <img src="https://images.unsplash.com/photo-1531482615713-2afd69097998?w=1200" alt="Clases en vivo" class="d-block w-100" style="height: 450px; object-fit: cover;">
                            <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 rounded-3">
                                <h5>Clases en Vivo</h5>
                                <p>Interactúa con instructores expertos en tiempo real</p>
                            </div>
                        </div>
                        <div class="carousel-item" data-bs-interval="3000">
                            <img src="https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=1200" alt="Certificaciones" class="d-block w-100" style="height: 450px; object-fit: cover;">
                            <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 rounded-3">
                                <h5>Certificaciones</h5>
                                <p>Obten certificados reconocida en el mercado laboral</p>
                            </div>
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#mainCarousel" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#mainCarousel" data-bs-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </button>
                </div>
            </article>
        </section>
    </main>

    <?php include("paginas/includes/pie.php"); ?>
</body>
</html>
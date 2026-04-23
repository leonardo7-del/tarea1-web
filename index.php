<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduTech Perú - Cursos Virtuales</title>
    <link rel="stylesheet" href="/tarea1-web/css/bootstrap/bootstrap-5.3.3-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/tarea1-web/css/fontawesome/fontawesome-free-6.5.1-web/css/all.min.css">
</head>
<body class="d-flex flex-column min-vh-100">
    <nav class="navbar navbar-expand-lg bg-light border-bottom">
        <div class="container">
            <a class="navbar-brand fw-bold" href="/tarea1-web/index.php" style="color: #2980B9;">
                <i class="fa-solid fa-graduation-cap"></i> EduTech Perú
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="/tarea1-web/index.php">
                            <i class="fa-solid fa-house me-1"></i>Home
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/tarea1-web/producto/index.php">
                            <i class="fa-solid fa-box-open me-1"></i>Productos
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/tarea1-web/marca/index.php">
                            <i class="fa-solid fa-tags me-1"></i>Marcas
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <main class="container mt-4 flex-grow-1">
        <h1 class="text-center mb-4 fw-bold" style="color: #2980B9;">
            EduTech Perú S.A.C.
        </h1>

        <div class="card mb-4">
            <div class="card-body">
                <h5 class="card-title">Descripción de la Empresa</h5>
                <p class="card-text">EduTech Perú S.A.C. es una empresa peruana dedicada a la comercialización de cursos virtuales. Nuestro equipo está compuesto por profesionales comprometidos con soluciones educativas en línea de alta calidad.</p>
            </div>
        </div>

        <div id="mainCarousel" class="carousel slide" data-bs-ride="carousel">
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
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Cursos Virtuales</h5>
                        <p>Aprende desde cualquier lugar con nuestros cursos online</p>
                    </div>
                </div>
                <div class="carousel-item" data-bs-interval="3000">
                    <img src="https://images.unsplash.com/photo-1501504905252-473c47e087f8?w=1200" alt="Educación online" class="d-block w-100" style="height: 450px; object-fit: cover;">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Educación Online</h5>
                        <p>Calidad educativa sin fronteras</p>
                    </div>
                </div>
                <div class="carousel-item" data-bs-interval="3000">
                    <img src="https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=1200" alt="Aprendizaje digital" class="d-block w-100" style="height: 450px; object-fit: cover;">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Aprendizaje Digital</h5>
                        <p>Transforma tu futuro con conocimiento</p>
                    </div>
                </div>
                <div class="carousel-item" data-bs-interval="3000">
                    <img src="https://images.unsplash.com/photo-1531482615713-2afd69097998?w=1200" alt="Clases en vivo" class="d-block w-100" style="height: 450px; object-fit: cover;">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Clases en Vivo</h5>
                        <p>Interactúa con instructores expertos en tiempo real</p>
                    </div>
                </div>
                <div class="carousel-item" data-bs-interval="3000">
                    <img src="https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=1200" alt="Certificaciones" class="d-block w-100" style="height: 450px; object-fit: cover;">
                    <div class="carousel-caption d-none d-md-block">
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
    </main>

    <footer class="bg-light border-top mt-auto py-3">
        <div class="container text-center">
            <p class="mb-0">
                <i class="fa-solid fa-copyright"></i> <?php echo date('Y'); ?> EduTech Perú S.A.C.
            </p>
        </div>
    </footer>
    <script src="/tarea1-web/css/bootstrap/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduTech Perú - Productos</title>
    <link rel="stylesheet" href="/Tarea_Jueves/css/bootstrap/bootstrap-5.3.3-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Tarea_Jueves/css/fontawesome/fontawesome-free-6.5.1-web/css/all.min.css">
</head>
<body class="d-flex flex-column min-vh-100">
    <nav class="navbar navbar-expand-lg bg-light border-bottom">
        <div class="container">
            <a class="navbar-brand fw-bold" href="/Tarea_Jueves/index.php" style="color: #2980B9;">
                <i class="fa-solid fa-graduation-cap"></i> EduTech Perú
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/Tarea_Jueves/index.php">
                            <i class="fa-solid fa-house me-1"></i>Home
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/Tarea_Jueves/producto/index.php">
                            <i class="fa-solid fa-box-open me-1"></i>Productos
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/Tarea_Jueves/marca/index.php">
                            <i class="fa-solid fa-tags me-1"></i>Marcas
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <main class="container mt-4 flex-grow-1">
        <h1 class="text-center mb-4 fw-bold" style="color: #2980B9;">
            Productos
        </h1>
        <p>Contenido de la página de productos...</p>
    </main>

    <footer class="bg-light border-top mt-auto py-3">
        <div class="container text-center">
            <p class="mb-0">
                <i class="fa-solid fa-copyright"></i> <?php echo date('Y'); ?> EduTech Perú S.A.C.
            </p>
        </div>
    </footer>
    <script src="/Tarea_Jueves/css/bootstrap/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<!DOCTYPE html>
<html lang="es">
<?php
$ruta = "../../";
$titulo = "EduTech Perú - Listado de Cursos";
include("../includes/cabecera.php");
?>

<body>
    <?php
    include("../includes/menu.php");
    include("../includes/cargar_clases.php");
    include("../modelo/CRUDCurso.php");

    $crudcurso = new CRUDCurso();
    $rs_cur = $crudcurso->ListarCurso();
    ?>

    <div class="container mt-3 d-flex flex-column flex-grow-1">
        <header>
            <h1><i class="fa-solid fa-book-open"></i> Listado de Cursos</h1>
            <hr>
        </header>

        <nav></nav>

        <section class="flex-grow-1">
            <article>
                <div class="row justify-content-center mt-3">
                    <div class="col-md-12">
                        <table class="table table-hover table-sm table-success table-striped">
                            <tr class="table-primary text-center">
                                <th>N°</th>
                                <th>Código</th>
                                <th>Curso</th>
                                <th>Categoría</th>
                                <th>Instructor</th>
                                <th>Horas</th>
                                <th>Precio</th>
                            </tr>
                            <?php
                            $i = 0;
                            if (!empty($rs_cur)) {
                                foreach ($rs_cur as $cur) {
                                    $i++;
                                    ?>
                                    <tr>
                                        <td class="text-center"><?= $i ?></td>
                                        <td class="text-center"><?= $cur->codigo_curso ?></td>
                                        <td class="fw-bold"><?= $cur->curso ?></td>
                                        <td class="text-center"><?= $cur->categoria ?></td>
                                        <td><?= $cur->instructor ?></td>
                                        <td class="text-center"><?= $cur->duracion_horas ?> h</td>
                                        <td class="text-center">S/ <?= number_format($cur->precio, 2) ?></td>
                                    </tr>
                                    <?php
                                }
                            } else {
                                ?>
                                <tr>
                                    <td colspan="7" class="text-center py-4 text-muted">
                                        No se encontraron cursos registrados en la base de datos.
                                    </td>
                                </tr>
                                <?php
                            }
                            ?>
                        </table>
                    </div>
                </div>
            </article>
        </section>

        <?php
        include("../includes/pie.php");
        ?>
    </div>
</body>

</html>
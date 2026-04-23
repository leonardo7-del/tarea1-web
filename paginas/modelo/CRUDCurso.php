<?php
require_once __DIR__ . '/conexion.php';

class CRUDCurso {
    public function ListarCurso() {
        global $conexion;
        $query = "SELECT c.codigo_curso, c.curso, c.descripcion, c.duracion_horas,
                         c.precio, cat.categoria,
                         CONCAT(i.ap_paterno, ' ', i.nombre) AS instructor
                  FROM tb_curso c
                  INNER JOIN tb_categoria_curso cat ON c.curso_codigo_categoria = cat.codigo_categoria
                  INNER JOIN tb_instructor i        ON c.curso_codigo_instructor = i.codigo_instructor
                  ORDER BY c.curso ASC";
                  
        $resultado = mysqli_query($conexion, $query);
        
        $cursos = [];
        if ($resultado) {
            while ($row = mysqli_fetch_object($resultado)) {
                $cursos[] = $row;
            }
        } else {
            die("Error en la consulta: " . mysqli_error($conexion));
        }
        return $cursos;
    }
}
?>

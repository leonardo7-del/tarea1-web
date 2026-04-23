-- ============================================================
--  BASE DE DATOS: EduTech Perú S.A.C.
--  Curso: Desarrollo de Software
--  Descripción: Script completo de creación de tablas,
--               relaciones, procedimientos almacenados
--               e inserción de datos de prueba.
-- ============================================================

DROP DATABASE IF EXISTS bd_edutechperu;
CREATE DATABASE bd_edutechperu CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;
USE bd_edutechperu;

-- ============================================================
-- TABLAS DE UBICACIÓN GEOGRÁFICA
-- ============================================================

CREATE TABLE tb_departamento (
    codigo_departamento CHAR(5)     NOT NULL,
    departamento        VARCHAR(50) NOT NULL,
    CONSTRAINT pk_departamento PRIMARY KEY (codigo_departamento)
);

CREATE TABLE tb_provincia (
    codigo_provincia            CHAR(5)     NOT NULL,
    provincia                   VARCHAR(50) NOT NULL,
    provincia_codigo_departamento CHAR(5)   NOT NULL,
    CONSTRAINT pk_provincia     PRIMARY KEY (codigo_provincia),
    CONSTRAINT fk_prov_dep      FOREIGN KEY (provincia_codigo_departamento)
        REFERENCES tb_departamento(codigo_departamento)
);

CREATE TABLE tb_distrito (
    codigo_distrito           CHAR(5)     NOT NULL,
    distrito                  VARCHAR(50) NOT NULL,
    distrito_codigo_provincia CHAR(5)     NOT NULL,
    CONSTRAINT pk_distrito    PRIMARY KEY (codigo_distrito),
    CONSTRAINT fk_dist_prov   FOREIGN KEY (distrito_codigo_provincia)
        REFERENCES tb_provincia(codigo_provincia)
);

-- ============================================================
-- TABLAS PRINCIPALES
-- ============================================================

CREATE TABLE tb_alumno (
    codigo_alumno           CHAR(5)      NOT NULL,
    nombre                  VARCHAR(30)  NOT NULL,
    ap_paterno              VARCHAR(30)  NOT NULL,
    ap_materno              VARCHAR(30)  NOT NULL,
    fecha_nacimiento        DATE,
    correo_electronico      VARCHAR(80),
    telefono                VARCHAR(15),
    alumno_codigo_distrito  CHAR(5)      NOT NULL,
    CONSTRAINT pk_alumno    PRIMARY KEY (codigo_alumno),
    CONSTRAINT fk_alum_dist FOREIGN KEY (alumno_codigo_distrito)
        REFERENCES tb_distrito(codigo_distrito)
);

CREATE TABLE tb_categoria_curso (
    codigo_categoria    CHAR(5)      NOT NULL,
    categoria           VARCHAR(50)  NOT NULL,
    CONSTRAINT pk_categoria PRIMARY KEY (codigo_categoria)
);

CREATE TABLE tb_instructor (
    codigo_instructor       CHAR(5)      NOT NULL,
    nombre                  VARCHAR(30)  NOT NULL,
    ap_paterno              VARCHAR(30)  NOT NULL,
    ap_materno              VARCHAR(30)  NOT NULL,
    especialidad            VARCHAR(60)  NOT NULL,
    correo_electronico      VARCHAR(80),
    CONSTRAINT pk_instructor PRIMARY KEY (codigo_instructor)
);

CREATE TABLE tb_curso (
    codigo_curso                CHAR(5)       NOT NULL,
    curso                       VARCHAR(80)   NOT NULL,
    descripcion                 VARCHAR(255),
    duracion_horas              INT           NOT NULL DEFAULT 0,
    precio                      FLOAT         NOT NULL DEFAULT 0,
    curso_codigo_categoria      CHAR(5)       NOT NULL,
    curso_codigo_instructor     CHAR(5)       NOT NULL,
    CONSTRAINT pk_curso         PRIMARY KEY (codigo_curso),
    CONSTRAINT fk_cur_cat       FOREIGN KEY (curso_codigo_categoria)
        REFERENCES tb_categoria_curso(codigo_categoria),
    CONSTRAINT fk_cur_ins       FOREIGN KEY (curso_codigo_instructor)
        REFERENCES tb_instructor(codigo_instructor)
);

CREATE TABLE tb_matricula (
    codigo_matricula            CHAR(6)      NOT NULL,
    fecha_matricula             DATE         NOT NULL,
    monto_pagado                FLOAT        NOT NULL DEFAULT 0,
    estado                      VARCHAR(20)  NOT NULL DEFAULT 'Activo',
    matricula_codigo_alumno     CHAR(5)      NOT NULL,
    matricula_codigo_curso      CHAR(5)      NOT NULL,
    CONSTRAINT pk_matricula     PRIMARY KEY (codigo_matricula),
    CONSTRAINT fk_mat_alum      FOREIGN KEY (matricula_codigo_alumno)
        REFERENCES tb_alumno(codigo_alumno),
    CONSTRAINT fk_mat_cur       FOREIGN KEY (matricula_codigo_curso)
        REFERENCES tb_curso(codigo_curso)
);

CREATE TABLE tb_certificado (
    codigo_certificado              CHAR(6)      NOT NULL,
    fecha_emision                   DATE         NOT NULL,
    url_certificado                 VARCHAR(255),
    certificado_codigo_matricula    CHAR(6)      NOT NULL,
    CONSTRAINT pk_certificado       PRIMARY KEY (codigo_certificado),
    CONSTRAINT fk_cert_mat          FOREIGN KEY (certificado_codigo_matricula)
        REFERENCES tb_matricula(codigo_matricula)
);

-- ============================================================
-- DATOS DE PRUEBA — UBICACIÓN
-- ============================================================

INSERT INTO tb_departamento VALUES
('D0001', 'Lima'),
('D0002', 'Arequipa'),
('D0003', 'Cusco');

INSERT INTO tb_provincia VALUES
('P0001', 'Lima',     'D0001'),
('P0002', 'Callao',   'D0001'),
('P0003', 'Arequipa', 'D0002'),
('P0004', 'Cusco',    'D0003');

INSERT INTO tb_distrito VALUES
('DT001', 'San Isidro',          'P0001'),
('DT002', 'Miraflores',          'P0001'),
('DT003', 'San Borja',           'P0001'),
('DT004', 'Los Olivos',          'P0001'),
('DT005', 'San Martín de Porres','P0001'),
('DT006', 'Callao',              'P0002'),
('DT007', 'Arequipa',            'P0003'),
('DT008', 'Cusco',               'P0004');

-- ============================================================
-- DATOS DE PRUEBA — CATEGORÍAS
-- ============================================================

INSERT INTO tb_categoria_curso VALUES
('C0001', 'Programación'),
('C0002', 'Diseño Gráfico'),
('C0003', 'Marketing Digital'),
('C0004', 'Base de Datos'),
('C0005', 'Redes y Seguridad');

-- ============================================================
-- DATOS DE PRUEBA — INSTRUCTORES
-- ============================================================

INSERT INTO tb_instructor VALUES
('I0001', 'Carlos',   'Mendoza',  'Ríos',     'Desarrollo Web',        'cmendoza@edutechperu.pe'),
('I0002', 'Lucía',    'Flores',   'Quispe',   'Diseño UX/UI',          'lflores@edutechperu.pe'),
('I0003', 'Roberto',  'Huanca',   'Mamani',   'Base de Datos',         'rhuanca@edutechperu.pe'),
('I0004', 'Valeria',  'Torres',   'Cárdenas', 'Marketing Digital',     'vtorres@edutechperu.pe'),
('I0005', 'Andrés',   'Salas',    'Vega',     'Ciberseguridad',        'asalas@edutechperu.pe');

-- ============================================================
-- DATOS DE PRUEBA — CURSOS
-- ============================================================

INSERT INTO tb_curso VALUES
('CR001', 'PHP y MySQL desde Cero',         'Aprende backend web con PHP y base de datos MySQL.',    40, 149.90, 'C0001', 'I0001'),
('CR002', 'Diseño Web con Figma',            'Crea prototipos profesionales con Figma.',              25, 99.90,  'C0002', 'I0002'),
('CR003', 'MySQL Avanzado y Optimización',   'Procedimientos, triggers y optimización de consultas.', 30, 129.90, 'C0004', 'I0003'),
('CR004', 'SEO y Google Ads',                'Posicionamiento orgánico y campañas pagadas.',          20, 89.90,  'C0003', 'I0004'),
('CR005', 'Ethical Hacking Básico',          'Fundamentos de pentesting y seguridad ofensiva.',       35, 179.90, 'C0005', 'I0005'),
('CR006', 'JavaScript y React',              'Desarrollo frontend moderno con React.js.',             50, 199.90, 'C0001', 'I0001'),
('CR007', 'Adobe Photoshop para Web',        'Edición y exportación de recursos gráficos para web.',  20, 79.90,  'C0002', 'I0002');

-- ============================================================
-- DATOS DE PRUEBA — ALUMNOS
-- ============================================================

INSERT INTO tb_alumno VALUES
('A0001', 'Ana',      'Ramos',    'Gutiérrez', '2000-03-15', 'aramos@gmail.com',    '987654321', 'DT001'),
('A0002', 'Luis',     'Vargas',   'Paredes',   '1998-07-22', 'lvargas@hotmail.com', '976543210', 'DT002'),
('A0003', 'Milagros', 'Ccoicca',  'Huayta',    '2001-11-08', 'mccoicca@gmail.com',  '965432109', 'DT005'),
('A0004', 'Diego',    'Pinedo',   'Sánchez',   '1999-05-30', 'dpinedo@yahoo.com',   '954321098', 'DT003'),
('A0005', 'Sofía',    'Bustamante','Chávez',   '2002-01-18', 'sbustamante@gmail.com','943210987','DT006'),
('A0006', 'José',     'Mamani',   'Condori',   '1997-09-25', 'jmamani@gmail.com',   '932109876', 'DT008');

-- ============================================================
-- DATOS DE PRUEBA — MATRÍCULAS
-- ============================================================

INSERT INTO tb_matricula VALUES
('M00001', '2024-03-01', 149.90, 'Activo',     'A0001', 'CR001'),
('M00002', '2024-03-05', 99.90,  'Activo',     'A0002', 'CR002'),
('M00003', '2024-03-10', 129.90, 'Completado', 'A0003', 'CR003'),
('M00004', '2024-04-01', 179.90, 'Activo',     'A0004', 'CR005'),
('M00005', '2024-04-15', 199.90, 'Activo',     'A0005', 'CR006'),
('M00006', '2024-05-01', 89.90,  'Completado', 'A0001', 'CR004'),
('M00007', '2024-05-20', 149.90, 'Activo',     'A0006', 'CR001');

-- ============================================================
-- DATOS DE PRUEBA — CERTIFICADOS
-- ============================================================

INSERT INTO tb_certificado VALUES
('CE0001', '2024-04-20', 'https://edutechperu.pe/cert/CE0001.pdf', 'M00003'),
('CE0002', '2024-06-10', 'https://edutechperu.pe/cert/CE0002.pdf', 'M00006');

-- ============================================================
-- PROCEDIMIENTOS ALMACENADOS — tb_categoria_curso
-- ============================================================

DELIMITER $$

CREATE PROCEDURE sp_listar_categoria()
BEGIN
    SELECT * FROM tb_categoria_curso ORDER BY categoria ASC;
END; $$

CREATE PROCEDURE sp_buscar_categoria_por_codigo(IN cod_cat CHAR(5))
BEGIN
    SELECT * FROM tb_categoria_curso
    WHERE codigo_categoria = cod_cat;
END; $$

CREATE PROCEDURE sp_registrar_categoria(
    IN cod_cat CHAR(5),
    IN cat     VARCHAR(50)
)
BEGIN
    INSERT INTO tb_categoria_curso VALUES (cod_cat, cat);
END; $$

CREATE PROCEDURE sp_editar_categoria(
    IN cod_cat CHAR(5),
    IN cat     VARCHAR(50)
)
BEGIN
    UPDATE tb_categoria_curso
    SET categoria = cat
    WHERE codigo_categoria = cod_cat;
END; $$

CREATE PROCEDURE sp_borrar_categoria(IN cod_cat CHAR(5))
BEGIN
    DELETE FROM tb_categoria_curso
    WHERE codigo_categoria = cod_cat;
END; $$

-- ============================================================
-- PROCEDIMIENTOS ALMACENADOS — tb_instructor
-- ============================================================

CREATE PROCEDURE sp_listar_instructor()
BEGIN
    SELECT * FROM tb_instructor ORDER BY ap_paterno ASC;
END; $$

CREATE PROCEDURE sp_buscar_instructor_por_codigo(IN cod_ins CHAR(5))
BEGIN
    SELECT * FROM tb_instructor
    WHERE codigo_instructor = cod_ins;
END; $$

CREATE PROCEDURE sp_registrar_instructor(
    IN cod_ins  CHAR(5),
    IN nom      VARCHAR(30),
    IN apat     VARCHAR(30),
    IN amat     VARCHAR(30),
    IN espec    VARCHAR(60),
    IN correo   VARCHAR(80)
)
BEGIN
    INSERT INTO tb_instructor VALUES (cod_ins, nom, apat, amat, espec, correo);
END; $$

CREATE PROCEDURE sp_editar_instructor(
    IN cod_ins  CHAR(5),
    IN nom      VARCHAR(30),
    IN apat     VARCHAR(30),
    IN amat     VARCHAR(30),
    IN espec    VARCHAR(60),
    IN correo   VARCHAR(80)
)
BEGIN
    UPDATE tb_instructor
    SET nombre = nom, ap_paterno = apat, ap_materno = amat,
        especialidad = espec, correo_electronico = correo
    WHERE codigo_instructor = cod_ins;
END; $$

CREATE PROCEDURE sp_borrar_instructor(IN cod_ins CHAR(5))
BEGIN
    DELETE FROM tb_instructor
    WHERE codigo_instructor = cod_ins;
END; $$

-- ============================================================
-- PROCEDIMIENTOS ALMACENADOS — tb_curso
-- ============================================================

CREATE PROCEDURE sp_listar_curso()
BEGIN
    SELECT c.codigo_curso, c.curso, c.descripcion, c.duracion_horas,
           c.precio, cat.categoria,
           CONCAT(i.ap_paterno, ' ', i.ap_materno, ', ', i.nombre) AS instructor
    FROM tb_curso c
    INNER JOIN tb_categoria_curso cat ON c.curso_codigo_categoria = cat.codigo_categoria
    INNER JOIN tb_instructor i        ON c.curso_codigo_instructor = i.codigo_instructor
    ORDER BY c.curso ASC;
END; $$

CREATE PROCEDURE sp_buscar_curso_por_codigo(IN cod_cur CHAR(5))
BEGIN
    SELECT * FROM tb_curso WHERE codigo_curso = cod_cur;
END; $$

CREATE PROCEDURE sp_mostrar_curso_por_codigo(IN cod_cur CHAR(5))
BEGIN
    SELECT c.codigo_curso, c.curso, c.descripcion, c.duracion_horas,
           c.precio, cat.categoria,
           CONCAT(i.ap_paterno, ' ', i.ap_materno, ', ', i.nombre) AS instructor
    FROM tb_curso c
    INNER JOIN tb_categoria_curso cat ON c.curso_codigo_categoria = cat.codigo_categoria
    INNER JOIN tb_instructor i        ON c.curso_codigo_instructor = i.codigo_instructor
    WHERE c.codigo_curso = cod_cur;
END; $$

CREATE PROCEDURE sp_filtrar_curso(IN valor VARCHAR(80))
BEGIN
    SELECT c.codigo_curso, c.curso, c.duracion_horas, c.precio,
           cat.categoria,
           CONCAT(i.ap_paterno, ' ', i.nombre) AS instructor
    FROM tb_curso c
    INNER JOIN tb_categoria_curso cat ON c.curso_codigo_categoria = cat.codigo_categoria
    INNER JOIN tb_instructor i        ON c.curso_codigo_instructor = i.codigo_instructor
    WHERE c.curso LIKE CONCAT('%', valor, '%');
END; $$

CREATE PROCEDURE sp_registrar_curso(
    IN cod_cur  CHAR(5),
    IN cur      VARCHAR(80),
    IN desc     VARCHAR(255),
    IN horas    INT,
    IN prec     FLOAT,
    IN cod_cat  CHAR(5),
    IN cod_ins  CHAR(5)
)
BEGIN
    INSERT INTO tb_curso VALUES (cod_cur, cur, desc, horas, prec, cod_cat, cod_ins);
END; $$

CREATE PROCEDURE sp_editar_curso(
    IN cod_cur  CHAR(5),
    IN cur      VARCHAR(80),
    IN desc     VARCHAR(255),
    IN horas    INT,
    IN prec     FLOAT,
    IN cod_cat  CHAR(5),
    IN cod_ins  CHAR(5)
)
BEGIN
    UPDATE tb_curso
    SET curso = cur, descripcion = desc, duracion_horas = horas,
        precio = prec, curso_codigo_categoria = cod_cat,
        curso_codigo_instructor = cod_ins
    WHERE codigo_curso = cod_cur;
END; $$

CREATE PROCEDURE sp_borrar_curso(IN cod_cur CHAR(5))
BEGIN
    DELETE FROM tb_curso WHERE codigo_curso = cod_cur;
END; $$

-- ============================================================
-- PROCEDIMIENTOS ALMACENADOS — tb_alumno
-- ============================================================

CREATE PROCEDURE sp_listar_alumno()
BEGIN
    SELECT a.codigo_alumno,
           CONCAT(a.ap_paterno, ' ', a.ap_materno, ', ', a.nombre) AS alumno,
           a.correo_electronico, a.telefono, d.distrito
    FROM tb_alumno a
    INNER JOIN tb_distrito d ON a.alumno_codigo_distrito = d.codigo_distrito
    ORDER BY a.ap_paterno ASC;
END; $$

CREATE PROCEDURE sp_buscar_alumno_por_codigo(IN cod_alum CHAR(5))
BEGIN
    SELECT * FROM tb_alumno WHERE codigo_alumno = cod_alum;
END; $$

CREATE PROCEDURE sp_mostrar_alumno_por_codigo(IN cod_alum CHAR(5))
BEGIN
    SELECT a.codigo_alumno,
           CONCAT(a.ap_paterno, ' ', a.ap_materno, ', ', a.nombre) AS alumno,
           a.fecha_nacimiento, a.correo_electronico, a.telefono,
           d.distrito, p.provincia, dep.departamento
    FROM tb_alumno a
    INNER JOIN tb_distrito   d   ON a.alumno_codigo_distrito        = d.codigo_distrito
    INNER JOIN tb_provincia  p   ON d.distrito_codigo_provincia     = p.codigo_provincia
    INNER JOIN tb_departamento dep ON p.provincia_codigo_departamento = dep.codigo_departamento
    WHERE a.codigo_alumno = cod_alum;
END; $$

CREATE PROCEDURE sp_filtrar_alumno(IN valor VARCHAR(60))
BEGIN
    SELECT a.codigo_alumno,
           CONCAT(a.ap_paterno, ' ', a.ap_materno, ', ', a.nombre) AS alumno,
           a.correo_electronico, d.distrito, p.provincia, dep.departamento
    FROM tb_alumno a
    INNER JOIN tb_distrito    d   ON a.alumno_codigo_distrito          = d.codigo_distrito
    INNER JOIN tb_provincia   p   ON d.distrito_codigo_provincia       = p.codigo_provincia
    INNER JOIN tb_departamento dep ON p.provincia_codigo_departamento  = dep.codigo_departamento
    WHERE CONCAT(a.ap_paterno, ' ', a.ap_materno, ' ', a.nombre) LIKE CONCAT('%', valor, '%');
END; $$

CREATE PROCEDURE sp_registrar_alumno(
    IN cod_alum CHAR(5),
    IN nom      VARCHAR(30),
    IN apat     VARCHAR(30),
    IN amat     VARCHAR(30),
    IN fnac     DATE,
    IN correo   VARCHAR(80),
    IN tel      VARCHAR(15),
    IN cod_dist CHAR(5)
)
BEGIN
    INSERT INTO tb_alumno VALUES (cod_alum, nom, apat, amat, fnac, correo, tel, cod_dist);
END; $$

CREATE PROCEDURE sp_editar_alumno(
    IN cod_alum CHAR(5),
    IN nom      VARCHAR(30),
    IN apat     VARCHAR(30),
    IN amat     VARCHAR(30),
    IN fnac     DATE,
    IN correo   VARCHAR(80),
    IN tel      VARCHAR(15),
    IN cod_dist CHAR(5)
)
BEGIN
    UPDATE tb_alumno
    SET nombre = nom, ap_paterno = apat, ap_materno = amat,
        fecha_nacimiento = fnac, correo_electronico = correo,
        telefono = tel, alumno_codigo_distrito = cod_dist
    WHERE codigo_alumno = cod_alum;
END; $$

CREATE PROCEDURE sp_borrar_alumno(IN cod_alum CHAR(5))
BEGIN
    DELETE FROM tb_alumno WHERE codigo_alumno = cod_alum;
END; $$

-- ============================================================
-- PROCEDIMIENTOS ALMACENADOS — tb_matricula
-- ============================================================

CREATE PROCEDURE sp_listar_matricula()
BEGIN
    SELECT m.codigo_matricula, m.fecha_matricula, m.monto_pagado, m.estado,
           CONCAT(a.ap_paterno, ' ', a.nombre) AS alumno,
           c.curso
    FROM tb_matricula m
    INNER JOIN tb_alumno a ON m.matricula_codigo_alumno = a.codigo_alumno
    INNER JOIN tb_curso   c ON m.matricula_codigo_curso  = c.codigo_curso
    ORDER BY m.fecha_matricula DESC;
END; $$

CREATE PROCEDURE sp_buscar_matricula_por_codigo(IN cod_mat CHAR(6))
BEGIN
    SELECT * FROM tb_matricula WHERE codigo_matricula = cod_mat;
END; $$

CREATE PROCEDURE sp_mostrar_matricula_por_codigo(IN cod_mat CHAR(6))
BEGIN
    SELECT m.codigo_matricula, m.fecha_matricula, m.monto_pagado, m.estado,
           CONCAT(a.ap_paterno, ' ', a.ap_materno, ', ', a.nombre) AS alumno,
           c.curso, c.duracion_horas, c.precio,
           cat.categoria
    FROM tb_matricula m
    INNER JOIN tb_alumno          a   ON m.matricula_codigo_alumno   = a.codigo_alumno
    INNER JOIN tb_curso           c   ON m.matricula_codigo_curso    = c.codigo_curso
    INNER JOIN tb_categoria_curso cat ON c.curso_codigo_categoria    = cat.codigo_categoria
    WHERE m.codigo_matricula = cod_mat;
END; $$

CREATE PROCEDURE sp_filtrar_matricula(IN valor VARCHAR(80))
BEGIN
    SELECT m.codigo_matricula, m.fecha_matricula, m.monto_pagado, m.estado,
           CONCAT(a.ap_paterno, ' ', a.nombre) AS alumno,
           c.curso
    FROM tb_matricula m
    INNER JOIN tb_alumno a ON m.matricula_codigo_alumno = a.codigo_alumno
    INNER JOIN tb_curso   c ON m.matricula_codigo_curso  = c.codigo_curso
    WHERE c.curso LIKE CONCAT('%', valor, '%')
       OR CONCAT(a.ap_paterno, ' ', a.nombre) LIKE CONCAT('%', valor, '%');
END; $$

CREATE PROCEDURE sp_registrar_matricula(
    IN cod_mat  CHAR(6),
    IN fmat     DATE,
    IN monto    FLOAT,
    IN est      VARCHAR(20),
    IN cod_alum CHAR(5),
    IN cod_cur  CHAR(5)
)
BEGIN
    INSERT INTO tb_matricula VALUES (cod_mat, fmat, monto, est, cod_alum, cod_cur);
END; $$

CREATE PROCEDURE sp_editar_matricula(
    IN cod_mat  CHAR(6),
    IN fmat     DATE,
    IN monto    FLOAT,
    IN est      VARCHAR(20),
    IN cod_alum CHAR(5),
    IN cod_cur  CHAR(5)
)
BEGIN
    UPDATE tb_matricula
    SET fecha_matricula = fmat, monto_pagado = monto, estado = est,
        matricula_codigo_alumno = cod_alum, matricula_codigo_curso = cod_cur
    WHERE codigo_matricula = cod_mat;
END; $$

CREATE PROCEDURE sp_borrar_matricula(IN cod_mat CHAR(6))
BEGIN
    DELETE FROM tb_matricula WHERE codigo_matricula = cod_mat;
END; $$

DELIMITER ;


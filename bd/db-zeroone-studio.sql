-- Database: db-zeroone-studio
-- Create database script

CREATE DATABASE IF NOT EXISTS db_zeroone_studio;
USE db_zeroone_studio;

-- Tabla: dbo.Asignaciones (relacion proyectos-tareas-colaboradores)
CREATE TABLE IF NOT EXISTS dbo_Asignaciones (
    id_asignacion INT AUTO_INCREMENT PRIMARY KEY,
    id_proyecto INT NOT NULL,
    id_tarea INT NOT NULL,
    id_colaborador INT NOT NULL,
    fecha_asignacion DATE NOT NULL,
    estado ENUM('activa', 'completada', 'cancelada') DEFAULT 'activa',
    observaciones TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla: dbo.Colaboradores
CREATE TABLE IF NOT EXISTS dbo_Colaboradores (
    id_colaborador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    cargo VARCHAR(100),
    area VARCHAR(100),
    fecha_ingreso DATE,
    estado ENUM('activo', 'inactivo') DEFAULT 'activo',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla: dbo.Detalle_Factura
CREATE TABLE IF NOT EXISTS dbo_Detalle_Factura (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_factura INT NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla: dbo.Facturas
CREATE TABLE IF NOT EXISTS dbo_Facturas (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    numero_factura VARCHAR(50) NOT NULL UNIQUE,
    id_cliente INT NOT NULL,
    fecha_emision DATE NOT NULL,
    fecha_vencimiento DATE,
    total DECIMAL(10,2) NOT NULL,
    estado ENUM('pagada', 'pendiente', 'cancelada', 'vencida') DEFAULT 'pendiente',
    metodo_pago VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla: dbo.Gastos
CREATE TABLE IF NOT EXISTS dbo_Gastos (
    id_gasto INT AUTO_INCREMENT PRIMARY KEY,
    id_proyecto INT,
    categoria VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    monto DECIMAL(10,2) NOT NULL,
    fecha_gasto DATE NOT NULL,
    tipo_gasto ENUM('operativo', 'administrativo', 'inversion', 'otro') DEFAULT 'otro',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla: dbo.Proyectos
CREATE TABLE IF NOT EXISTS dbo_Proyectos (
    id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATE NOT NULL,
    fecha_fin_estimada DATE,
    fecha_fin_real DATE,
    presupuesto DECIMAL(12,2),
    estado ENUM('planificacion', 'en_progreso', 'completado', 'cancelado') DEFAULT 'planificacion',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla: dbo.Tareas
CREATE TABLE IF NOT EXISTS dbo_Tareas (
    id_tarea INT AUTO_INCREMENT PRIMARY KEY,
    id_proyecto INT NOT NULL,
    titulo VARCHAR(200) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATE NOT NULL,
    fecha_fin_estimada DATE,
    fecha_fin_real DATE,
    prioridad ENUM('baja', 'media', 'alta', 'urgente') DEFAULT 'media',
    estado ENUM('pendiente', 'en_progreso', 'completada', 'cancelada') DEFAULT 'pendiente',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla: dbo.Usuarios
CREATE TABLE IF NOT EXISTS dbo_Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    rol ENUM('admin', 'manager', 'colaborador', 'cliente') DEFAULT 'colaborador',
    estado ENUM('activo', 'inactivo') DEFAULT 'activo',
    ultimo_login DATETIME,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
-- Crear la base de datos
CREATE DATABASE GestionProyectosConstruccion;

-- Usar la base de datos
USE GestionProyectosConstruccion;

-- Tabla Empleados
CREATE TABLE Empleados (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    NumeroCarnet NVARCHAR(50) UNIQUE NOT NULL,
    Nombre NVARCHAR(100) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Categoria NVARCHAR(20) CHECK (Categoria IN ('Administrador', 'Operario', 'Peón')) NOT NULL,
    Salario DECIMAL(10, 2) CONSTRAINT CK_Salario CHECK (Salario BETWEEN 250000 AND 500000) DEFAULT 250000,
    Direccion NVARCHAR(255) DEFAULT 'San José',
    Telefono NVARCHAR(20) NULL,
    Correo NVARCHAR(100) UNIQUE NOT NULL
);

-- Tabla Proyectos
CREATE TABLE Proyectos (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Codigo NVARCHAR(50) UNIQUE NOT NULL,
    Nombre NVARCHAR(100) UNIQUE NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE NOT NULL
);

-- Tabla Asignaciones
CREATE TABLE Asignaciones (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    EmpleadoId INT NOT NULL,
    ProyectoId INT NOT NULL,
    FechaAsignacion DATE NOT NULL,
    CONSTRAINT FK_Asignaciones_Empleado FOREIGN KEY (EmpleadoId) REFERENCES Empleados(Id),
    CONSTRAINT FK_Asignaciones_Proyecto FOREIGN KEY (ProyectoId) REFERENCES Proyectos(Id),
    CONSTRAINT UQ_EmpleadoProyecto UNIQUE (EmpleadoId, ProyectoId)
);


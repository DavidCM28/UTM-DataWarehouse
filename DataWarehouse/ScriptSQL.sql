DROP DATABASE IF EXISTS universidad_dw;
CREATE DATABASE universidad_dw
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

USE universidad_dw;

CREATE TABLE dim_alumno (
    id_alumno INT PRIMARY KEY AUTO_INCREMENT,
    matricula VARCHAR(20) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    edad INT NOT NULL,
    sexo VARCHAR(20) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE dim_carrera (
    id_carrera INT PRIMARY KEY AUTO_INCREMENT,
    nombre_carrera VARCHAR(100) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE dim_tiempo (
    id_tiempo INT PRIMARY KEY AUTO_INCREMENT,
    semestre INT NOT NULL,
    periodo VARCHAR(50) NOT NULL,
    anio INT NOT NULL
) ENGINE = InnoDB;

CREATE TABLE dim_materia (
    id_materia INT PRIMARY KEY AUTO_INCREMENT,
    nombre_materia VARCHAR(100) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE dim_profesor (
    id_profesor INT PRIMARY KEY AUTO_INCREMENT,
    nombre_profesor VARCHAR(100) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE hechos_rendimiento (
    id_hecho INT PRIMARY KEY AUTO_INCREMENT,
    id_alumno INT NOT NULL,
    id_carrera INT NOT NULL,
    id_tiempo INT NOT NULL,
    id_materia INT NOT NULL,
    id_profesor INT NOT NULL,
    promedio DECIMAL(5,2) NOT NULL,
    asistencia DECIMAL(5,2) NOT NULL,
    accesos_moodle INT NOT NULL,
    nivel_academico VARCHAR(20) NOT NULL,

    CONSTRAINT fk_hechos_alumno
        FOREIGN KEY (id_alumno)
        REFERENCES dim_alumno(id_alumno),

    CONSTRAINT fk_hechos_carrera
        FOREIGN KEY (id_carrera)
        REFERENCES dim_carrera(id_carrera),

    CONSTRAINT fk_hechos_tiempo
        FOREIGN KEY (id_tiempo)
        REFERENCES dim_tiempo(id_tiempo),

    CONSTRAINT fk_hechos_materia
        FOREIGN KEY (id_materia)
        REFERENCES dim_materia(id_materia),

    CONSTRAINT fk_hechos_profesor
        FOREIGN KEY (id_profesor)
        REFERENCES dim_profesor(id_profesor)
) ENGINE = InnoDB;
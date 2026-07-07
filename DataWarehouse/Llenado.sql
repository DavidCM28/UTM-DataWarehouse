use universidad_dw;
INSERT INTO dim_alumno (matricula, nombre, edad, sexo)
SELECT DISTINCT
    matricula,
    nombre,
    edad,
    sexo
FROM alumnos_limpios;
INSERT INTO dim_carrera (nombre_carrera)
SELECT DISTINCT
    carrera
FROM alumnos_limpios;
INSERT INTO hechos_rendimiento (
    id_alumno,
    id_carrera,
    id_tiempo,
    id_materia,
    id_profesor,
    promedio,
    asistencia,
    accesos_moodle,
    nivel_academico
)
SELECT
    da.id_alumno,
    dc.id_carrera,

    CASE 
        WHEN da.id_alumno % 3 = 1 THEN 1
        WHEN da.id_alumno % 3 = 2 THEN 2
        ELSE 3
    END AS id_tiempo,

    CASE 
        WHEN da.id_alumno % 5 = 1 THEN 1
        WHEN da.id_alumno % 5 = 2 THEN 2
        WHEN da.id_alumno % 5 = 3 THEN 3
        WHEN da.id_alumno % 5 = 4 THEN 4
        ELSE 5
    END AS id_materia,

    CASE 
        WHEN da.id_alumno % 5 = 1 THEN 1
        WHEN da.id_alumno % 5 = 2 THEN 2
        WHEN da.id_alumno % 5 = 3 THEN 3
        WHEN da.id_alumno % 5 = 4 THEN 4
        ELSE 5
    END AS id_profesor,

    al.promedio,
    al.asistencia,
    al.accesos_moodle,
    al.nivel_academico
FROM alumnos_limpios al
INNER JOIN dim_alumno da
    ON al.matricula = da.matricula
INNER JOIN dim_carrera dc
    ON al.carrera = dc.nombre_carrera;
SELECT 
    a.matricula,
    a.nombre,
    c.nombre_carrera,
    t.semestre,
    t.periodo,
    m.nombre_materia,
    p.nombre_profesor,
    h.promedio,
    h.asistencia,
    h.accesos_moodle,
    h.nivel_academico
FROM hechos_rendimiento h
INNER JOIN dim_alumno a
    ON h.id_alumno = a.id_alumno
INNER JOIN dim_carrera c
    ON h.id_carrera = c.id_carrera
INNER JOIN dim_tiempo t
    ON h.id_tiempo = t.id_tiempo
INNER JOIN dim_materia m
    ON h.id_materia = m.id_materia
INNER JOIN dim_profesor p
    ON h.id_profesor = p.id_profesor
;

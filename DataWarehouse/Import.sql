USE universidad_dw;
LOAD DATA LOCAL INFILE 'C:/Users/bdavi/Documents/Escuela/Noveno/Extraccion_bd/alumnos_limpios.csv'
INTO TABLE alumnos_limpios
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(matricula, nombre, carrera, edad, sexo, promedio, asistencia, accesos_moodle, nivel_academico);
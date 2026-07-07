# DW_Universidad

Proyecto de diseño e implementación de un Data Warehouse para el análisis del rendimiento académico de estudiantes universitarios.

Este proyecto utiliza un proceso ETL para extraer, limpiar y cargar datos académicos de alumnos. El objetivo es integrar información relacionada con estudiantes, carreras, promedio, asistencia y accesos a Moodle, con el fin de preparar los datos para análisis académico, minería de datos o proyectos de Machine Learning.

## Caso de estudio

La Universidad Tecnológica Montemorelos cuenta con información académica distribuida en diferentes fuentes, como el Sistema Escolar, la plataforma Moodle y archivos de Excel de Servicios Escolares.

Para este proyecto se simuló una base de datos con registros de estudiantes, incluyendo errores intencionales como datos faltantes, valores ilógicos y registros duplicados. Posteriormente, los datos fueron limpiados mediante Power Query y cargados en un Data Warehouse diseñado con esquema estrella.

## Objetivo

Diseñar e implementar un Data Warehouse académico utilizando un proceso ETL, aplicando técnicas de limpieza de datos y organizando la información en un modelo estrella para facilitar el análisis del rendimiento estudiantil.

## Herramientas utilizadas

- Microsoft Excel
- Power Query
- MySQL Workbench
- Draw.io
- GitHub
- SQL

## Estructura del repositorio

```txt
Proyecto_DataWarehouse/
├── DatosOriginales/
│   └── alumnos.xlsx
├── DatosProcesados/
│   └── alumnos_limpios.csv
├── DataWarehouse/
│   └── ScriptSQL.sql
├── Diagramas/
│   └── esquema_estrella.png
├── Documentacion/
│   └── Reporte.pdf
└── README.md
Descripción de carpetas
DatosOriginales

Contiene el archivo alumnos.xlsx, el cual incluye los registros originales de estudiantes con errores intencionales. Estos errores fueron agregados para simular una base de datos real con problemas de calidad.

DatosProcesados

Contiene el archivo alumnos_limpios.csv, generado después de aplicar el proceso de limpieza en Power Query. Este archivo contiene los datos listos para ser cargados al Data Warehouse.

DataWarehouse

Contiene el archivo ScriptSQL.sql, donde se encuentra el código utilizado para crear la base de datos universidad_dw, las tablas de dimensiones, la tabla de hechos y la carga de datos.

Diagramas

Contiene el archivo esquema_estrella.png, que representa el diseño del Data Warehouse mediante un modelo estrella.

Documentacion

Contiene el reporte final del proyecto en formato PDF, incluyendo introducción, caso de estudio, tipos y fuentes de datos, proceso ETL, limpieza de datos, diseño del Data Warehouse, configuración y conclusiones.

Proceso ETL
Extracción

Los datos fueron extraídos desde el archivo alumnos.xlsx utilizando Power Query en Microsoft Excel.

Transformación

Se aplicaron técnicas de limpieza de datos, incluyendo:

Eliminación de registros duplicados.
Corrección de edades ilógicas.
Corrección de promedios fuera de rango.
Corrección de asistencias inválidas.
Reemplazo de campos vacíos.
Creación de la columna nivel_academico.

La clasificación del nivel académico se realizó con las siguientes reglas:

Promedio	Nivel académico
90 - 100	Excelente
80 - 89	Bueno
70 - 79	Regular
Menor a 70	Riesgo
Carga

Los datos limpios fueron exportados como alumnos_limpios.csv y cargados en MySQL Workbench dentro de una tabla auxiliar llamada alumnos_limpios.

Posteriormente, la información fue distribuida en las tablas del esquema estrella:

dim_alumno
dim_carrera
dim_tiempo
dim_materia
dim_profesor
hechos_rendimiento
Diseño del Data Warehouse

El Data Warehouse fue diseñado utilizando un esquema estrella.

La tabla central es:

hechos_rendimiento

Las dimensiones son:

dim_alumno
dim_carrera
dim_tiempo
dim_materia
dim_profesor

La tabla de hechos almacena los indicadores principales del rendimiento académico:

Promedio
Asistencia
Accesos a Moodle
Nivel académico
Base de datos

Nombre de la base de datos:

universidad_dw

Sistema gestor utilizado:

MySQL

Motor:

InnoDB

Codificación:

utf8mb4
Consultas de verificación

Ejemplo de consulta para verificar la carga de datos:

SELECT COUNT(*) AS total_registros
FROM alumnos_limpios;

Ejemplo de consulta para visualizar los datos integrados en el modelo estrella:

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
LIMIT 20;
Integrantes
Nombre del integrante 1
Nombre del integrante 2
Nombre del integrante 3

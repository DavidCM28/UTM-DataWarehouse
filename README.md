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

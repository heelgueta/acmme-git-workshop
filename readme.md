# Flujos reproducibles con Git y GitHub (ACMME 2026 @ ULS)

Repo de apoyo para el workshop:
**“Flujos reproducibles con Git y GitHub para investigaciones psicológicas y sociales (cómo dejar de perder tus análisis, archivos y scripts)”**

## Qué hay aquí
- `index.html`  
  Diapositivas (Reveal.js). Se pueden abrir directo en el navegador.
- `analysis.R`  
  Script simple de R para demo (carga `iris_dataset.csv`, hace 2 gráficos y un par de outputs).
- `iris_dataset.csv`  
  Dataset en CSV (Iris).
- `output/`  
  Carpeta donde el script guarda un archivo de salida para demostrar commits.

## Uso rápido (sin instalación extra)
1. Descarga o clona el repo.
2. Abre `index.html` en tu navegador.

## Correr el análisis en R
Requisitos: R instalado.

En R (o RStudio), con el directorio de trabajo en la carpeta del repo:

```r
source("analysis.R")

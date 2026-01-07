# analysis.R
# Analisis simple para demo Git/GitHub
# Requiere: iris_dataset.csv en la carpeta del proyecto

rm(list = ls())

# ---------- Cargar datos ----------
csv_path <- "iris_dataset.csv"
if (!file.exists(csv_path)) {
  stop("No encuentro iris_dataset.csv en la carpeta actual. Revisa la ruta/ubicación.")
}

iris_df <- read.csv(csv_path, stringsAsFactors = FALSE)

# Normalizar columna Species si viene como texto
if ("Species" %in% names(iris_df)) {
  iris_df$Species <- as.factor(iris_df$Species)
}

# ---------- Chequeos rápidos ----------
cat("Filas:", nrow(iris_df), "Columnas:", ncol(iris_df), "\n\n")
cat("Primeras filas:\n")
print(head(iris_df))
cat("\nResumen:\n")
print(summary(iris_df))

# ---------- Histograma ----------
# Histograma simple (Sepal.Length)
hist(
  iris_df$Sepal.Length,
  breaks = 12,
  col = "steelblue",
  border = "white",
  main = "Iris: histograma de Sepal.Length",
  xlab = "Sepal.Length"
)

# ---------- Otra wea chica: boxplot por especie ----------
boxplot(
  Sepal.Length ~ Species,
  data = iris_df,
  col = c("#7dd3fc", "#a78bfa", "#34d399"),
  main = "Sepal.Length por especie",
  xlab = "Species",
  ylab = "Sepal.Length"
)

# ---------- Otra wea chica: correlaciones ----------
num_cols <- sapply(iris_df, is.numeric)
num_df <- iris_df[, num_cols, drop = FALSE]

if (ncol(num_df) >= 2) {
  cor_mat <- cor(num_df, use = "pairwise.complete.obs")
  cat("\nMatriz de correlaciones (numéricas):\n")
  print(round(cor_mat, 3))
}

# ---------- Modelo mini: ANOVA ----------
if (all(c("Sepal.Length", "Species") %in% names(iris_df))) {
  fit <- aov(Sepal.Length ~ Species, data = iris_df)
  cat("\nANOVA Sepal.Length ~ Species:\n")
  print(summary(fit))
}

# ---------- Guardar un output (para versionar) ----------
# Ojo: en proyectos reales usualmente NO versionas outputs pesados,
# pero esto sirve para demo de commits.
out_dir <- "output"
if (!dir.exists(out_dir)) dir.create(out_dir)

write.csv(
  iris_df,
  file = file.path(out_dir, "iris_preview.csv"),
  row.names = FALSE
)

cat("\nListo. Se guardó output/iris_preview.csv\n")

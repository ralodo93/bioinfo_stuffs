# 1. ¿Dónde está trabajando R?
getwd() # Muestra la ruta de la carpeta actual

# ¿Y si quiero cambiar de ruta?
# setwd("C:/Users/Usuario/MisProyectos/R") # Cambia la ruta de trabajo
# Más sencillo desde RStudio: Files -> Buscar carpeta de trabajo -> More -> Set as Working Directory

# 2. Listar archivos en la carpeta de trabajo
list.files() # Muestra los archivos en la carpeta actual
list.files(pattern = "\\.csv$") # Muestra solo los archivos CSV
list.files(pattern = "error") # Muestra archivos que contienen "error" en su nombre

# 3. Leer y guardar archivos

# Descargar un archivo de ejemplo
download.file("https://gist.githubusercontent.com/MorganZhang100/0c489d1f376a04d5436a/raw/7c335ebe48e5751f1334bb6e4502254e3c1d1c55/cars.csv", destfile = "cars.csv")

# Leer un archivo CSV
datos_coches <- read.csv("cars.csv")

# Verificación rápida post-lectura
dim(datos_coches)    # ¿Cuántas filas y columnas han entrado realmente?
names(datos_coches)  # ¿Se han leído bien los nombres de las columnas?

# Leer archivos ignorando las filas de encabezado si fuera necesario
datos <- read.csv("cars.csv", skip = 2)

# Ver las primeras filas
head(datos_coches)

# Guardar un archivo CSV
write.csv(datos_coches, "datos_coches_guardados.csv")
write.csv(datos_coches, "datos_coches_guardados.csv", row.names = FALSE)
write.csv(datos_coches, "datos_coches_guardados.csv", row.names = FALSE, quote = FALSE)

# Guardar un archivo Excel
library(openxlsx)
write.xlsx(datos_coches, "datos_coches_guardados.xlsx")

# Guardar un archivo de texto delimitado por tabulaciones
write.table(datos_coches, "datos_coches_guardados.txt", sep = "\t", row.names = FALSE, quote = FALSE)

## Objetos específicos de R

# RData
save(datos_coches, file = "datos_coches.RData")
rm(list = ls()) # borrar todos los objetos de la sesión
load("datos_coches.RData")

# Guardar toda la session
a <- 5
b <- 8
save.image("mi_sesion.RData")
rm(list = ls()) # borrar todos los objetos de la sesión
load("mi_sesion.RData")


# RDS (un solo objeto)
saveRDS(datos_coches, "datos_coches.rds")
rm(datos_coches)
datos_coches <- readRDS("datos_coches.rds") # lo cargo en el mismo objeto
datos_coches_2 <- readRDS("datos_coches.rds") # puedo cargarlo en otro objeto diferente
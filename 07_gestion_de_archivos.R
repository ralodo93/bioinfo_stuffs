### Directorio de Trabajo
## Donde estamos?
getwd() # Muestra la ruta de la carpeta actual

# ¿Y si quiero cambiar de ruta?
# setwd("C:/Users/Usuario/MisProyectos/R") # Cambia la ruta de trabajo
# Más sencillo desde RStudio: Files -> Buscar carpeta de trabajo -> More -> Set as Working Directory

### Escritura, Lectura, Descarga

# cargar algunas librerías útiles
library(openxlsx) # Para .xlsx
library(readr)    # Para .csv y .txt (más rápido que las funciones base)

rm(list = ls()) # eliminar todas las variables del entorno

# Creamos un Data Frame sencillo para las pruebas
pacientes_db <- data.frame(
  ID = c("P01", "P02", "P03"),
  Edad = c(25, 40, 35),
  Ciudad = c("Granada", "Madrid", "Sevilla")
)

## Escritura
# A. Exportar a CSV (Texto separado por comas)
# row.names = FALSE es vital para no crear una columna extra de números
write.csv(pacientes_db, "mis_pacientes.csv", row.names = FALSE)
write_csv(pacientes_db, "mis_pacientes_alt.csv") # alternativa usando función write_csv

# B. Exportar a Excel
write.xlsx(pacientes_db, "mis_pacientes.xlsx")

# C. Exportar a formato nativo de R (RDS)
# Es el mejor formato para guardar objetos de R manteniendo sus propiedades
saveRDS(pacientes_db, "mis_pacientes.rds")

# D. Exportar todo el espacio de trabajo (RData)
save(pacientes_db, file = "sesion_completa.RData")

message("¡Archivos creados en tu carpeta de trabajo!")

## Lectura
# A. Leer CSV
datos_leidos_csv <- read.csv("mis_pacientes.csv")

# B. Leer Excel
datos_leidos_xlsx <- read.xlsx("mis_pacientes.xlsx", sheet = 1)

# C. Leer RDS
# Al leer un RDS, debemos asignar el contenido a una nueva variable
datos_leidos_rds <- readRDS("mis_pacientes.rds")

# D. Leer RData
# No necesita asignación, las variables "aparecen" con el nombre original
load("sesion_completa.RData")

## Descarga
# Definimos la URL del archivo y el nombre que queremos que tenga en nuestro PC
url_datos <- "https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv"
nombre_destino <- "datos_titanic.csv"

# Descargamos el archivo
download.file(url = url_datos, destfile = nombre_destino)
message("Archivo descargado con éxito")

## Listar ficheros en el entorno de trabajo
list.files()

## Buenas prácticas
if (file.exists("datos_titanic.csv")) {
  print("El archivo está listo para ser procesado")
} else {
  warning("¡Atención! El archivo no se encuentra en la carpeta")
}

## --- 6. IMPORTACIÓN MEDIANTE INTERFAZ (Truco RStudio) ---
# En el panel de 'Environment' (arriba a la derecha):
# Botón "Import Dataset" -> From Text (readr) o From Excel
# Esto genera el código automáticamente en la consola, que podemos copiar al script.
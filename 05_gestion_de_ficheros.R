### Lectura y Escritura de Ficheros

## Ficheros CSV/TXT/TSV
# Son los formatos más comunes. R base tiene funciones (read.csv), 
# pero se recomienda la librería 'readr' por ser más rápida.
library(readr) # la librería readr pertenece al tidyverse, por lo que ya está instalada

# Cargamos el dataset iris para tenerlo en el Environment
data(iris)
head(iris) # Vemos las primeras 6 filas

# Escritura de Ficheros
# Guardamos un dataframe en el disco. 'row.names = FALSE' evita una columna extra de índices.
write.csv(iris, file = "dataset_iris.csv", row.names = FALSE)
write_csv(iris, file = "dataset_iris.csv") # usando readr

# Lectura de Ficheros
# Leemos el archivo que acabamos de crear
iris_importado <- read.csv("dataset_iris.csv")
iris_importado <- read_csv("dataset_iris.csv")

## Ficheros Excel
# install.packages("xlsx)
library(xlsx)

# Escritura de Ficheros Excel
# Es ideal para compartir datos con personas que no usan R.
write.xlsx(iris, file="iris.xlsx", sheetName="sheet1", row.names=FALSE)
write.xlsx(iris, file="iris.xlsx", sheetName="sheet2", append=TRUE, row.names=FALSE)

# Lectura de Ficheros Excel
# Podemos especificar el nombre de la hoja si tuviera varias.
iris_xlsx <- read.xlsx("iris.xlsx", sheetIndex = 1)

# RDS: Recomendado para guardar objetos individuales de R.
# Ventaja: Mantiene los tipos de datos exactos (factores, fechas, etc.)
saveRDS(iris, file = "iris_objeto.rds")

# Lectura de RDS
# Al leer un RDS debemos asignarlo a una variable nueva.
iris_rds <- readRDS("iris_objeto.rds")

# RData: Guarda TODO el entorno de trabajo (todas tus variables).
save.image(file = "mi_sesion_trabajo.RData")

# RDATA: También se pueden guardar solo una serie de variables
save(iris, iris_desde_excel, file = "mi_sesion_trabajo2.RData")

# Lectura de RData
# Al cargarlo, los objetos aparecen con el nombre que tenían originalmente.
load("mi_sesion_trabajo.RData")
load("mi_sesion_trabajo2.RData")


### Buenas Prácticas

## Usar rutas relativas
# El "." indica "esta carpeta". Esto permite que si envías la carpeta a un 
# compañero, el código funcione sin cambiar rutas.
# read.csv("./datos/iris.csv")

## Comprobar si los ficheros existen
# Un seguro de vida para que tu código no se detenga con errores.
if (file.exists("dataset_iris.csv")) {
  print("Archivo encontrado. Procediendo a la lectura...")
  mi_data <- read.csv("dataset_iris.csv")
} else {
  warning("¡Atención! No se encuentra el fichero en la ruta indicada.")
}

## Trabajar con datos más pequeños
# Si iris fuera un archivo de millones de filas, podríamos leer solo un trozo
# para probar si nuestra función de limpieza funciona.
iris_mini <- read.csv("dataset_iris.csv", nrows = 10)

## Gestión de Directorios y Ficheros

# Crear Directorios (Carpetas)
# Es útil para organizar salidas (gráficos, tablas) sin salir de R.
# Usamos showWarnings = FALSE para que no dé error si la carpeta ya existe.

nombre_carpeta <- "resultados_analisis"

dir.create(nombre_carpeta, showWarnings = FALSE)
if (!dir.exists(nombre_carpeta)) {
  dir.create(nombre_carpeta)
  print(paste("Carpeta", nombre_carpeta, "creada con éxito."))
}

# Crear Ficheros vacíos
# A veces necesitamos generar un archivo base antes de escribir en él.
file.create("registro_log.txt")

## Eliminar Ficheros
# ¡CUIDADO! Esta acción es permanente y no pasa por la papelera de reciclaje.
if (file.exists("archivo_temporal.csv")) {
  file.remove("archivo_temporal.csv")
}

## Eliminar Directorios
# Para borrar una carpeta vacía:
# dir.create("carpeta_vacia")
# unlink("carpeta_vacia", recursive = FALSE)

# Para borrar una carpeta QUE CONTIENE ARCHIVOS (Uso de recursive = TRUE):
# ¡CUIDADO EXTREMO con este comando! Borrará todo lo que haya dentro.
# unlink("carpeta_con_datos", recursive = TRUE)


## Crear un fichero ZIP desde R
# Útil para empaquetar resultados, gráficas o múltiples CSVs antes de enviarlos.
# La función zip() requiere: 1) nombre del zip, 2) archivos a incluir.

# Ejemplo 1: Comprimir un solo archivo
# Creamos un archivo de prueba primero
write.csv(iris, "datos_para_comprimir.csv", row.names = FALSE)

# Creamos el ZIP
zip(zipfile = "datos_para_comprimir.zip", files = "datos_para_comprimir.csv")

# Ejemplo 2: Comprimir varios archivos a la vez
# Primero creamos una lista de los archivos que queremos guardar
archivos_a_guardar <- c("dataset_iris.csv", "dataset_iris.xlsx")

# Verificamos que todos existan antes de comprimir (Buena práctica)
if(all(file.exists(archivos_a_guardar))) {
  zip(zipfile = "entrega_final.zip", files = archivos_a_guardar)
  print("ZIP creado con éxito")
} else {
  warning("Faltan archivos para crear el ZIP")
}

# Ejemplo 3: Comprimir una carpeta completa
# Si quieres guardar todo lo que hay en una subcarpeta
zip(zipfile = "respaldo_total.zip", files = "resultados_analisis")



### EJERCICIOS INTEGRAL: FLUJO DE TRABAJO CON EL TITANIC

# Preparación previa: Cargamos el dataset
library(readr)
library(openxlsx)
library(titanic)
datos <- titanic_train
head(datos)

# --------------------------------------------------------------------------
# EJERCICIO 1: Organización y Funciones de Limpieza
# --------------------------------------------------------------------------

# 1.1 Crea una carpeta llamada "Export_Titanic" usando dir.create().
# Asegúrate de que si ya existe no devuelva un error.


# --------------------------------------------------------------------------
# EJERCICIO 2: Exportación Multiformato
# --------------------------------------------------------------------------

# 2.1 Guarda el dataframe 'datos' dentro de la carpeta "Export_Titanic"
# usando tres formatos diferentes:
#   - Un CSV (usa write_csv de readr).
#   - Un Excel
#   - Un archivo RDS.


# --------------------------------------------------------------------------
# EJERCICIO 3: Comprobación y Empaquetado
# --------------------------------------------------------------------------

# 3.1 Crea una lista con las rutas de los 3 archivos creados.


# 3.2 Comprueba si los 3 archivos existen realmente en el disco.
# Si existen, comprímelos en un fichero llamado "Resultados_Titanic.zip".


# --------------------------------------------------------------------------
# EJERCICIO 4: Limpieza de entorno
# --------------------------------------------------------------------------

# 4.1 Imagina que ya no necesitas los archivos sueltos, solo el ZIP. 
# Borra el archivo .csv y el .rds de la carpeta "Export_Titanic" (pero no el Excel).

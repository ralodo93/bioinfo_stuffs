#### Escribir Ficheros
# Cargar Iris
data(iris)

# Filtrar iris
iris_filt <- iris[iris$Species == "setosa", ]

### Exportar a CSV
## write.csv() -> write.csv(dataframe, file = nombre_fichero)
write.csv(iris_filt, file = "iris.csv") # comportamiento por defecto
write.csv(iris_filt, file = "iris.csv", quote = FALSE) # no queremos poner comillas
write.csv(iris_filt, file = "iris.csv", quote = FALSE, row.names = FALSE) # ni comillas ni rownames

## write_csv() -> write_csv(dataframe, file = nombre_fichero) -> de la librería readr
library(readr)
write_csv(iris_filt, file = "iris.csv")

### Exportar a TXT / TSV
## write.table() -> write.table(dataframe, file = nombre_fichero)
write.table(iris_filt, file = "iris.txt", quote = FALSE, row.names = FALSE, sep = " ") # indicar el separador
write.table(iris_filt, file = "iris.tsv", quote = FALSE, row.names = FALSE, sep = "\t") # indicar el separador

## write_tsv() -> write_tsv(dataframe, file = nombre_fichero) -> de la librería readr
write_tsv(iris_filt, file = "iris.tsv") 
write_delim(iris_filt, file = "iris.txt") # por defecto el separador es " "

### Exportar a Excel
## write.xlsx() -> write.xlsx(dataframe, file = nombre_fichero, sheetName = nombre hoja, append = TRUE/FALSE) -> de la librería xlsx
library(xlsx)
write.xlsx(iris_filt, file="iris.xlsx", sheetName="sheet1", row.names=FALSE)
write.xlsx(iris_filt, file="iris.xlsx", sheetName="sheet2", append=TRUE, row.names=FALSE) # crea una nueva hoja sin eliminar el fichero (append = TRUE)

### Exportar a RData
# RData: Recomendado para guardar objetos de R.
# Ventaja: Mantiene los tipos de datos exactos (factores, fechas, etc.)
## save() -> save(objetos, file = nombre fichero) # guarda los objetos que pongamos
save(iris_filt, iris, file = "iris.Rdata")

## save.image() -> save.image(file=nombre fichero) # guarda todas las variables de la sesión
variable_inventada <- 1:10
save.image(file = "iris_image.Rdata")

### Exportar a Rds
# RDS: Recomendado para guardar objetos individuales de R.
# Ventaja: Mantiene los tipos de datos exactos (factores, fechas, etc.)
## saveRDS() -> saveRDS(variable, file = nombre_fichero) # almacena el valor de una variable
saveRDS(iris_filt, "iris.Rds")

#### Leer Ficheros

### Leer CSV
## read.csv() / read_csv() -> read.csv(nombre fichero) -> read_csv() es de la librería readr
iris_filt <- read.csv("iris.csv")
iris_filt <- read_csv("iris.csv")

### Leer TXT / TSV
## read.delim() / read_delim() / read_tsv() -> indicar el separador en read.delim -> read_delim() y read_tsv() son de la librería readr
iris_filt <- read.delim("iris.txt", sep = " ")
iris_filt <- read_delim("iris.txt")

iris_filt <- read.delim("iris.tsv", sep = "\t")
iris_filt <- read_tsv("iris.tsv")

### Leer Excel
## read.xlsx() -> read.xlsx(nombre fichero, sheetName, sheetIndex) -> leemos la hoja según sheetName o sheetIndex (el número de hoja) -> es de la librería xlsx
iris_filt <- read.xlsx("iris.xlsx", sheetName = "sheet1")
iris_filt <- read.xlsx("iris.xlsx", sheetIndex = 2)

### Leer RData
# Rdata: Recomendado para guardar objetos de R.
# Ventaja: Mantiene los tipos de datos exactos (factores, fechas, etc.)
## load() -> load(nombre fichero) -> No hace falta asignar, se carga con los nombres que las guardamos
load("iris.Rdata")
load("iris_image.Rdata")

### Leer Rds
# RDS: Recomendado para guardar objetos individuales de R.
# Ventaja: Mantiene los tipos de datos exactos (factores, fechas, etc.)
## readRDS() -> readRDS(nombre_fichero)
iris_filt <- readRDS("iris.Rds")

# MiniReto

# Usando la tabla de mtcars (es una tabla con varias especificaciones de coches)
data(mtcars)

# Filtra la tabla para quedarte con las primeras 6 filas (usa head()) y llama a la nueva tabla mtcars_filt
mtcars_filt <- head(mtcars)

# 1. escribe un fichero en cada uno de los formatos que hemos aprendido. Llámalo "mtcars.[extensión]"

# 2. lee cada uno de los ficheros


#### Manejo de carpetas y rutas

### ¿Qué es una ruta relativa? ¿Qué es una ruta absoluta?

## La ruta absoluta hace referencia a la ruta completa donde estamos trabajando o donde está alojado un archivo
getwd() # nos genera una ruta absoluta sobre donde estamos... está bien si vamos a trabajar en el mismo pc siempre pero...
# /home/raul/Desktop/bioinfo_stuffs

# ¿Y si quiero usar este código en otro PC? ¿O pasárselo a un compañero?
# No todos vamos a tener la misma ruta, por lo que en estos casos es mejor trabajar con rutas relativas

## Las rutas relativas son las rutas que parten desde nuestro directorio de trabajo, por ejemplo, para acceder al fichero iris.csv

# Ruta absoluta: /home/raul/Desktop/bioinfo_stuffs/iris.csv
# Ruta relativa: iris.csv

#### Manejo de carpetas

### Crear Carpeta

## Usando el directorio

## Con código
## dir.create(nombre carpeta, showWarnings = TRUE) -> Crea la carpeta, si ya existe nos sale un warning (no error)
dir.create("iris")
dir.create("iris")
dir.create("iris", showWarnings = FALSE)

## Guardar y cargar un archivo en una carpeta
saveRDS(iris_filt, file = "iris/iris.Rds")
iris_filt2 <- readRDS(file = "iris/iris.Rds")

### Eliminar un archivo

## Usando el directorio

## Con código
## unlink(nombre fichero)
unlink("iris/iris.Rds")
file.remove("iris.txt") # devuelve un TRUE si lo elimina

### Eliminar una carpeta

## Usando el directorio

## unlink(nombre directorio, recursive = TRUE)
unlink("iris", recursive = TRUE)

### Crear un fichero zip
## zip(nombre fichero zip, vector de los ficheros y/o carpetas a incluir)
zip(zipfile = "datos_para_comprimir.zip", files = "iris.csv")

### Descomprimir fichero zip
## unzip(nombre fichero zip, )
unzip("datos_para_comprimir.zip") 

# MiniReto

# Crea una carpeta llamada "mtcars"

# Guarda un fichero llamado "mtcars.txt" en la carpeta

# Guarda la carpeta mtcars en un fichero zip

# Elimina la carpeta mtcars (comando)



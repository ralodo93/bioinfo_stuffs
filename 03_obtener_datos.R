# Simulación de Datos ----
set.seed(145)
peso_kg <- rnorm(100, mean = 75, sd = 10)
altura_cm <- rnorm(100, mean = 175, sd = 10) / 100
genero <- sample(c("Mujer", "Hombre"), size = 100, replace = TRUE)
imc <- peso_kg / altura_cm^2
tabla_datos <- data.frame(peso = peso_kg,
                          altura = altura_cm,
                          genero = genero,
                          imc = imc)

## Datos en Librerías ----

### iris ----
# Es un dataset clásico en estadística. Contiene 150 observaciones 
# de 3 especies de flores Iris (setosa, versicolor y virginica). 
# Registra 4 variables numéricas: longitud y anchura de sépalos y pétalos.
data("iris")
head(iris)

### palmerpenguins ----
# Recoge medidas biométricas de 344 pingüinos adultos de 3 especies (Adelia, 
# Chinstrap y Gentoo) en el Archipiélago Palmer, Antártida.
# Incluye variables como masa corporal, longitud de aleta y profundidad del pico.
install.packages("palmerpenguins")
library(palmerpenguins)
data("penguins")
head(penguins)

### msleep ----
# Dataset sobre los hábitos de sueño de 83 especies de mamíferos.
# Contiene variables sobre el tiempo total de sueño, ciclo REM, peso corporal 
# y peso del cerebro.
library(tidyverse)
data("msleep")
head(msleep)

### pasilla ----
# Proviene de un experimento de RNA-seq en Drosophila melanogaster para estudiar 
# el gen "pasilla", involucrado en el splicing alternativo.
# - cts: Matriz de conteos (counts) que indica cuántas lecturas mapean a cada gen.
# - coldata: Tabla de metadatos que describe las condiciones experimentales 
install.packages("BiocManager") # instalar bioconductor
BiocManager::install("DESeq2") # instalar DESeq2
pasCts <- system.file("extdata", # obtener ruta a fichero de counts
                      "pasilla_gene_counts.tsv.gz",
                      package="DESeq2", mustWork=TRUE)
pasAnno <- system.file("extdata", # obtener ruta a fichero de anotación
                       "pasilla_sample_annotation.csv",
                       package="DESeq2", mustWork=TRUE)

cts <- as.matrix(read.csv(pasCts,sep="\t",row.names="gene_id")) # Leer fichero de counts
head(cts)

coldata <- read.csv(pasAnno, row.names=1) # Leer fichero de anotación
head(coldata)

# Leer Datos Propios ----

# Comprueba que estás en el directorio correcto
getwd()

## Ficheros EXCEL ----
# Hay varias librerías que podemos usar para leer y escribir ficheros de excel. La que vamos a usar para este curso es xlsx

# install.packages("xlsx")
library(xlsx)

### Escribir ficheros ----
# Para escribir ficheros usamos la función write.xlsx
# Crea un fichero excel llamado dataframes.xlsx que consta de una hoja llamada sheet1
write.xlsx(iris, file = "dataframes.xlsx", sheetName = "sheet1", row.names = FALSE)
# Con el argumento append, indicamos que no queremos sobreescribir el fichero anterior
write.xlsx(penguins, file = "dataframes.xlsx", sheetName = "sheet2", append = TRUE, row.names = FALSE)

### Leer ficheros ----
# Para leer ficheros usamos la función read.xlsx
iris_xlsx <- read.xlsx("dataframes.xlsx", sheetName = "sheet1") # podemos leer una hoja por su nombre
penguins_xlsx <- read.xlsx("dataframes.xlsx", sheetIndex = 2) # o por su índice 


## Ficheros CSV, TXT, TSV ----
# En general ficheros de texto plano

### Escribir ficheros ----
# Por defecto usamos la función write.table
write.table(iris, file = "iris.csv", sep = ",", row.names = FALSE, quote = FALSE) # indicamos sep = "," para csv
write.table(iris, file = "iris.tsv", sep = "\t", row.names = FALSE, quote = FALSE) # indicamos sep = "\t" para tsv
write.table(iris, file = "iris.txt", sep = " ", row.names = FALSE, quote = FALSE)

# Alternativas (librería tidyverse). Más rápido y más simple
write_csv(iris, file = "iris.csv")
write_tsv(iris, file = "iris.tsv")

### Leer ficheros ----
# Por defecto usamos la función read.delim
iris_csv <- read.delim("iris.csv", sep = ",")
iris_tsv <- read.delim("iris.tsv", sep = "\t")

# Alternativas (librería tidyverse). Más rápido y más simple
iris_csv <- read_csv("iris.csv") # lo carga como tibble
iris_tsv <- read_tsv("iris.tsv") # lo carga como tibble


## Ficheros RData y RDS ----
# Son ficheros específicos de R que nos sirven para cargar objetos directamente

### Escribir ficheros ----
# Por defecto usamos las funciones save, save.image y saveRDS
save(iris, penguins, file = "iris_penguins.RData") # guarda los objetos iris y starwars
save.image(file = "all.RData") # Guarda TODOS los objetos del entorno
saveRDS(iris, file = "iris.RDS") # guarda solo un objeto

# Alternativas (librería tidyverse). Más rápido y más simple
write_rds(iris, file = "iris.RDS")


### Leer ficheros ----
# Por defecto usamos las funciones load y readRDS
load("iris_penguins.RData") # carga el objeto con solo dos variables; los nombres de las variables se mantienen
load("all.RData") # cargar el objeto con todas las variables; los nombres de las variables se mantienen
iris2 <- readRDS("iris.RDS") # cargar el objeto en una variable que nosotros decidimos

# Alternativas (librería tidyverse). Más rápido y más simple
iris2 <- read_rds("iris.RDS")


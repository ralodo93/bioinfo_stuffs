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
# Iris es un dataframe de datos de longitud y anchura de pétalo y sepalo de 150 flores de 3 especies diferentes. Pertenece a la librería base
data("iris") # se almacena el dataframe en la variable iris
head(iris)

### mtcars ----
# mtcars es un dataframe de de diferentes aspectos mecánicos de 18 modelos de coche. Pertenece a la librería base
data("mtcars") # se almacena el dataframe en la variable iris
head(mtcars)

### palmerpenguins ----
# Palmerpenguins es una librería que aporta datos biométricos de pingüinos de 3 especies diferentes, recolectados en 3 islas del archipiélago Palmer (Antártida)
# Pertenecen a una librería llamada palmerpenguins
install.packages("palmerpenguins") # la instalamos si no está instalada
library(palmerpenguins) # la cargamos
data("penguins")
head(penguins) # vemos que no es un dataframe como tal, sino un objeto tibble, que es una mejora de un dataframe, lo veremos mañana

### starwars ----
# starwars es una librería que recopila información variada acerca de los personajes de la saga starwars
# Pertenecen a la librería tidyverse
library(tidyverse) # no es necesario cargarla porque la hemos cargado antes
data("starwars")
head(starwars) # vemos que no es un dataframe como tal, sino un objeto tibble, que es una mejora de un dataframe, lo veremos mañana

# Cargar Nuestros Datos ----

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
write.xlsx(mtcars, file = "dataframes.xlsx", sheetName = "sheet2", append = TRUE, row.names = FALSE)

### Leer ficheros ----
# Para leer ficheros usamos la función read.xlsx
iris.xlsx <- read.xlsx("dataframes.xlsx", sheetName = "sheet1") # podemos leer una hoja por su nombre
mtcars.xlsx <- read.xlsx("dataframes.xlsx", sheetIndex = 2) # o por su índice 


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
iris.csv <- read.delim("iris.csv", sep = ",")
iris.tsv <- read.delim("iris.tsv", sep = "\t")

# Alternativas (librería tidyverse). Más rápido y más simple
iris.csv <- read_csv("iris.csv") # lo carga como tibble
iris.tsv <- read_tsv("iris.tsv") # lo carga como tibble


## Ficheros RData y RDS ----
# Son ficheros específicos de R que nos sirven para cargar objetos directamente

### Escribir ficheros ----
# Por defecto usamos las funciones save, save.image y saveRDS
save(iris, starwars, file = "iris_starwars.RData") # guarda los objetos iris y starwars
save.image(file = "all.RData") # Guarda TODOS los objetos del entorno
saveRDS(iris, file = "iris.RDS") # guarda solo un objeto

# Alternativas (librería tidyverse). Más rápido y más simple
write_rds(iris, file = "iris.RDS")


### Leer ficheros ----
# Por defecto usamos las funciones load y readRDS
load("iris_starwars.RData") # carga el objeto con solo dos variables; los nombres de las variables se mantienen
load("all.RData") # cargar el objeto con todas las variables; los nombres de las variables se mantienen
iris2 <- readRDS("iris.RDS") # cargar el objeto en una variable que nosotros decidimos

# Alternativas (librería tidyverse). Más rápido y más simple
iris2 <- read_rds("iris.RDS")


#==============================================================================#
# EJERCICIOS DE REPASO
#==============================================================================#

# CONTEXTO:
# Trabajamos con un equipo de ecología marina que monitoriza el estado de 
# salud de los pingüinos en el archipiélago Palmer. Se requiere un script 
# robusto que procese datos biométricos, identifique individuos en riesgo 
# metabólico según su especie y gestione la exportación de resultados en 
# diferentes formatos para su posterior análisis en laboratorio.

# ENUNCIADO:
# 1. Carga el dataset 'penguins' de la librería 'palmerpenguins'.
# 2. Crea un nuevo dataframe llamado 'penguins_clean' que contenga solo 
#    las columnas: species, island, body_mass_g, y flipper_length_mm. 
#    Elimina las filas que contengan valores NA.
# 3. Añade una columna llamada 'condition_index' que sea el resultado de 
#    dividir la masa corporal (g) por la longitud de la aleta (mm).
# 4. Genera una variable categórica llamada 'status' siguiendo este criterio:
#    - Si 'condition_index' > 17.5: TRUE
#    - Si 'condition_index' <= 17.5: FALSE
# 5. Filtra para quedarte solo con los pingüinos cuyo status sea TRUE
# 6. Exporta el objeto final en dos pasos de seguridad:
#    - Un archivo 'metabolic_report.xlsx' con una hoja llamada 'Field_Data'.
#    - Un archivo comprimido de R 'metabolic_report.RData'

# SOLUCIÓN 

# 1. Carga de datos
library(palmerpenguins)
library(xlsx)
data("penguins")

# 2. Filtrado y limpieza
penguins_clean <- penguins[,c("species", "island", "body_mass_g", "flipper_length_mm")]
penguins_clean <- na.omit(penguins_clean)

# 3 y 4. Cálculo de índices y categorización biológica
penguins_clean$condition_index <- penguins_clean$body_mass_g / penguins_clean$flipper_length_mm
penguins_clean$status <- penguins_clean$condition_index > 17.5

# 5 y 6. Filtrado de individuos en riesgo y exportación 
non_risk_cases <- penguins_clean[penguins_clean$status == TRUE,]
write.xlsx(as.data.frame(non_risk_cases), 
           file = "metabolic_report.xlsx", 
           sheetName = "Field_Data", 
           row.names = FALSE)
save(non_risk_cases, file = "metabolic_report.RData")

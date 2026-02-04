#### Datos Estructurales ####
# Son formas de organizar los datos atómicos en estructuras más complejas

### Vectores ###
## Estructura de Datos Unidimensional ##

# --- Creación de Vectores ---
# Conjunto de datos del mismo tipo. Se asignan con c() (combinar)
c(10, 20)                       # Vector de dos elementos numéricos
vector_numeros <- c(10, 20)     # Asignación a variable

# Tipos de datos en vectores (siempre homogéneos)
c(20, 4, 8.3, -5)               # Numérico
c("Hola", "Hello")              # Texto
c(TRUE, FALSE, TRUE)            # Booleano

# IMPORTANTE: Coerción (R convierte todo al tipo más flexible si hay mezcla)
c(TRUE, "HOLA", 125)            # Se convierte todo a texto ("TRUE", "HOLA", "125")

# Concatenación y vectores vacíos
c(vector_numeros, -10, -20)     # Unir vectores existentes con nuevos datos
vector_vacio <- c()             # Crear vector vacío
vector_vacio <- c(vector_vacio, 10, 30) # Rellenar vector


# MINIRETO: Crea un vector con los elementos: 4, 8, 20 y -9 y guárdalo en la variable: vector_numeros


# SOLUCIÓN:
vector_numeros <- c(4, 8, 20, -9)


## Operaciones Vectorializadas ##
# --- Aritmética y Lógica ---
# Las operaciones se aplican a CADA elemento (vectorización)
vector_numeros * 10             # Multiplica cada elemento por 10
vector_numeros > 0              # Evalúa qué elementos son mayores de 0

# Operador de pertenencia (%in%)
"uva" %in% c("manzana", "fresa") # Comprueba si el elemento está en el conjunto

# MINIRETO: Usa el vector que hemos creado antes (vector_numeros) y evaúa que elementos son mayores de 0


# SOLUCIÓN:
vector_numeros > 0


## Crear Vectores Automáticos ##
# --- Secuencias y Repeticiones ---
1:10                            # Secuencia de 1 en 1
seq(1, 10, by = 2)              # Secuencia de 1 a 10 saltando de 2 en 2
rep("Hola", times = 5)          # Repite el bloque 5 veces
rep(c("Hola", "Hello"), times = 5) # Repite el bloque 5 veces
rep(c("A", "B"), each = 3)      # Repite cada elemento 3 veces ("A","A","A","B"...)

## Crear vectores automáticos ##

# Por secuencia #
1:10 # se usa el operador : para crear un vector de 1 a 10 (de 1 en 1)
-10:1 # crea un vector de -10 a 1 (de 1 en 1)
seq(1, 10, 2) # crea un vector numérico de 1 a 10 (de 2 en 2)

# Por repetición #
rep("Hola", times = 5) # Crea un vector de texto con 5 elementos "Hola"
rep(c("Hola", "Hello"), times = 5) # Crea un vector de 5 repeticiones de los elementos "Hola" y "Hello" (10 elementos)
rep(c("Hola", "Hello"), each = 3) # Crea un vector repitiendo cada elemento 3 veces

# --- Vectores Aleatorios ---
set.seed(12345)                 # Fija la semilla para que los resultados sean reproducibles
runif(5, min = 0, max = 1)      # 5 números aleatorios (Distribución Uniforme) entre min y max
rnorm(10, mean = 0, sd = 1)     # 10 números aleatorios (Distribución Normal) con mean y sd

# Muestreo (Sampling)
sample(1:10, size = 1)          # 1 número al azar entre el 1 y el 10
sample(vector_numeros, size = 3, replace = TRUE) # Muestreo con reemplazo

# MINIRETO: Crea un vector de 3 elementos aleatorios (con reemplazo) del vector 'vector_numeros'


# SOLUCIÓN:
sample(vector_numeros, size = 3, replace = TRUE)



## Funciones Asociadas a Vectores ##
# --- Propiedades y Limpieza ---
length(vector_numeros) # indica el número de elementos de un vector
names(vector_numeros) # muestra los nombres de los vectores, por defecto es NULL porque no existen
# Asignar nombres (Debe coincidir la longitud del vector con la de los nombres)
names(vector_numeros) <- c("num1", "num2", "num3", "num4", "num5") # Esto da error... sabrías decir por qué?
names(vector_numeros) <- c("num1", "num2", "num3") # Esto no da error... pero no es del todo correcto
vector_numeros # ¿por qué?
names(vector_numeros) <- c("num1", "num2", "num3", "num4") # Esto si es correcto
vector_numeros # mostrar vector completo
names(vector_numeros) # mostrar solo nombres de los elementos
# Manipulación de texto en vectores
paste("Mi número favorito es el", vector_numeros) # la función paste se ejecuta elemento a elemento
paste(vector_numeros, collapse =", ") # para colapsar todos lo elementos de un vector en un texto usamos collapse y el separador que queramos
paste("Mis números favoritos son", paste(vector_numeros, collapse = ", ")) # de este modo podemos jugar con diferentes paste para generar un texto complejo
# Eliminar NAs de un vector
vector_con_NA <- c(10, NA, 15, 25, 8)
na.omit(vector_con_NA) # elimina los NA de un vector
# Valores repetidos
mi_vector_repetido <- c(rep("Hola", 4), "Hello")
duplicated(mi_vector_repetido) # la primera vez que se encuentra un elemento repetido es FALSE, a partir de la segunda es TRUE
unique(mi_vector_repetido) # devuelve los elementos únicos de un vector

# MINIRETO: Asigna nombres "num1", "num2", etc., de forma automática a vector_numeros


# SOLUCIÓN:
names(vector_numeros) <- paste("num",1:length(vector_numeros), sep = "")
vector_numeros

## Operaciones Estadísticas ##
# --- Resumen de Datos ---
mean(vector_numeros) # media
median(vector_numeros) # mediana
max(vector_numeros) # valor máximo
min(vector_numeros) # valor mínimo
sd(vector_numeros) # desviación estándar
sum(vector_numeros) # suma total
prod(vector_numeros) # producto total
quantile(vector_numeros) # cuartiles
quantile(vector_numeros, probs = c(0.10, 0.30)) # percentiles 10 y 30
summary(vector_numeros) # resumen

# si sumamos un vector booleano, el resultado es el número de TRUE que hay
sum(c(TRUE, FALSE, FALSE, FALSE, TRUE))

# Operaciones con vectores de texto #
# Ya hemos visto paste() con el argumento collapse


## Acceso a Elementos (Indexación) ##
# --- Selección por Posición y Condición ---
# IMPORTANTE: En R las posiciones empiezan en 1 (no en 0)
vector_numeros[2]               # Acceder al segundo elemento
vector_numeros[c(1, 3)]         # Acceder a la primera y tercera posición

# Selección por condición (Filtrado)
vector_numeros[vector_numeros > 0] # Devuelve solo los positivos

## Reasignar Valores ##
# --- Modificación de Contenido ---
vector_numeros[3] <- 8          # Cambia la posición 3 por el valor 8
vector_numeros[vector_numeros < 0] <- 0 # Cambia todos los negativos a 0


# MINIRETO: Usando el vector c(10, 50, 20, 30, 80), crea una variable vector_minireto y determina: 
# 1) posiciones 1, 3 y 4. 2) elementos <= 30


# SOLUCIÓN:
vector_minireto <- c(10, 50, 20, 30, 80)
vector_minireto[c(1, 3, 4)]
vector_minireto[vector_minireto <= 30]


### Factores ###
## Variables Categóricas ##

# --- Definición de Factores ---
# Aunque es un dato atómico, se entiende como un vector con etiquetas de categorías (levels).
# Se definen con la función factor()
factor(c("Hombre", "Mujer", "Mujer", "Hombre"))

# Los factores son muy útiles para representar datos cualitativos (etiquetas)
# que se repiten a lo largo de un conjunto de datos.
factor(rep(c(1,2), 8)) # Los factores también pueden ser números

# MINIRETO: Crea un factor con las preferencias de clima: "Calor", "Frío", "Templado"
# Usa una muestra aleatoria de 15 elementos.


# SOLUCIÓN:
vector_climas <- sample(c("Calor", "Frío", "Calor", "Templado"), 15, replace = TRUE)
factor_climas <- factor(vector_climas)
factor_climas


## Niveles (Levels) ##
# --- Control de Categorías ---
# Los niveles definen las categorías únicas y, muy importante, su orden jerárquico.

# Orden por defecto:
factor(c("Hombre", "Mujer", "Mujer", "Hombre")) # Se establecen por orden alfabético (Hombre, Mujer)

# Orden personalizado:
# Usamos el parámetro levels = para definir el orden que nosotros queramos
factor(c("Hombre", "Mujer", "Mujer", "Hombre"), levels = c("Mujer", "Hombre"))


# MINIRETO: Usa el factor de climas anterior estableciendo el orden: "Frío", "Templado", "Calor"


# SOLUCIÓN:
factor(vector_climas, levels = c("Frío", "Templado", "Calor"))


## Propiedades de los Factores ##
levels(factor_climas)  # Muestra las categorías únicas del factor
nlevels(factor_climas) # Indica cuántas categorías diferentes existen
table(factor_climas)   # Crea una tabla de frecuencias (cuenta cuántos hay de cada nivel)



### Matrices ###
## Estructuras Bidimensionales Homogéneas ##

# --- Creación de Matrices ---
# Estructuras de filas y columnas donde todos los datos son del mismo tipo.
# Se crean con matrix(), indicando datos y número de filas (nrow) o columnas (ncol).
matrix(1:9, ncol = 3) # Rellena por defecto por columnas
matrix(c("Hola", "Bonjour", "Hello", "Ciao"), ncol = 2)

# Almacenamiento en variables
mi_matriz <- matrix(1:9, ncol = 3)

# Ver la matriz (abre una pestaña nueva en RStudio)
View(mi_matriz)


# MINIRETO: Crea una matriz de 2 filas y 3 columnas con los números del 1 al 6. 
# Guárdala en la variable 'minireto_matriz'


# SOLUCIÓN:
minireto_matriz <- matrix(1:6, nrow = 2)


## Operaciones con Matrices ##
# --- Aritmética Elemental ---
# Las operaciones se aplican a cada celda individualmente
matrix(1:4, nrow = 2) * 10
matrix(1:4, nrow = 2) + 5

# Funciones globales
# Se aplican sobre el total de los elementos de la matriz
mean(mi_matriz) # Media de todos los valores


# MINIRETO: Crea una matriz de 2x2 con los números 10, 20, 30, 40 y divídela toda entre 2


# SOLUCIÓN:
matriz_reto <- matrix(c(10, 20, 30, 40), nrow = 2)
matriz_reto / 2


## Acceso a Elementos (Indexación) ##
# --- Selección por [fila, columna] ---
mi_matriz[1, 2] # Elemento específico (Fila 1, Columna 2)
mi_matriz[1, ]  # Fila completa (deja el espacio de columna vacío)
mi_matriz[, 3]  # Columna completa (deja el espacio de fila vacío)

# Filtrado por Booleanos
mi_matriz[mi_matriz > 5] # Devuelve un vector con los elementos que cumplen la condición

# --- Reasignación de Valores ---
mi_matriz[1, 2] <- 8            # Cambia una celda específica
mi_matriz[, 2] <- 7             # Cambia una columna entera
mi_matriz[mi_matriz > 5] <- 10  # Cambia todos los valores que cumplen el criterio


# MINIRETO: De una matriz de 3x3 con números del 1 al 9, extrae solo la segunda columna.


# SOLUCIÓN:
matriz_3x3 <- matrix(1:9, ncol = 3)
matriz_3x3[, 2]


## Funciones de Estructura ##
# --- Dimensiones y Nombres ---
ncol(mi_matriz) # Número de columnas
nrow(mi_matriz) # Número de filas
dim(mi_matriz)  # Dimensiones totales (Filas y Columnas)

# Gestión de etiquetas
colnames(mi_matriz) <- paste("Col", 1:ncol(mi_matriz), sep = ".")
rownames(mi_matriz) <- paste("Fila", 1:nrow(mi_matriz), sep = ".")

mi_matriz # Mostrar matriz con sus nuevos nombres

# Es posible filtrar la matriz en base al nombre de columnas y filas
mi_matriz[rownames(mi_matriz)[1:2],]
mi_matriz[,colnames(mi_matriz)[1:2]]


# MINIRETO: Cambia los rownames de 'mi_matriz' usando paste() y seq() y muestra las columnas 1 y 3


# SOLUCIÓN:
rownames(mi_matriz) <- paste("ID", seq(1:nrow(mi_matriz)), sep = "_")
mi_matriz[,colnames(mi_matriz)[c(1, 3)]]


### DataFrames ###
## Estructura Tabular Heterogénea ##

# --- Creación de DataFrames ---
# A diferencia de las matrices, cada columna puede tener un tipo de dato distinto.
data.frame(nombre = c("Luis", "Sara"), edad = c(30, 20))

# Creación a partir de vectores previos
nombres <- c("Luis", "Sara")
edades <- c(30, 20)
df <- data.frame(nombre = nombres, edad = edades) # 'df' es el nombre estándar por convención

# Ver el dataframe en una pestaña nueva
View(df)


# MINIRETO: Crea un DataFrame llamado "tienda" con una columna "producto" (manzana, pera) 
# y otra "precio" (1.5, 2.0)


# SOLUCIÓN:
tienda <- data.frame(producto = c("manzana", "pera"), precio = c(1.5, 2.0))


## Acceso a Elementos ##
# --- Selección y Filtrado ---

# 1. Por Posiciones (como las matrices)
df[1, 2] # Fila 1, columna 2

# 2. Por Columnas (Acceso directo con $)
# Extrae la columna completa transformándola en un VECTOR
df$nombre
df$edad

# 3. Por Nombres (usando corchetes)
df[, "nombre"]
df[, c("nombre", "edad")]
df[,colnames(df)[1]]

# 4. Filtrado por Booleanos (Condiciones)
# IMPORTANTE: La condición se pone en el lugar de las filas, dejando vacía la columna
df[df$edad > 25, ] # Filas donde la edad es mayor a 25


# --- Reasignación de Valores ---
df[1, 2] <- 31 # Cambia el valor de la celda específica


# MINIRETO: Del DataFrame "tienda", extrae solo la columna de precios usando el símbolo $


# SOLUCIÓN:
tienda$precio


## Funciones con DataFrames ##
# --- Estructura y Metadatos ---
ncol(df)      # número de columnas
nrow(df)      # número de filas
dim(df)       # dimensiones (filas y columnas)
colnames(df)  # nombres de las columnas

# Modificar nombres de columnas
colnames(df) <- paste("Col", seq(1:ncol(df)), sep = ".")

# Nombres de las filas
rownames(df)  # por defecto es un índice de 1 a nrow() en formato texto


# MINIRETO: Cambia los rownames de 'tienda' por "Id_1" e "Id_2"


# SOLUCIÓN:
rownames(tienda) <- paste("Id", 1:nrow(tienda), sep = "_")
tienda


### Listas ###
## Estructuras Flexibles y Heterogéneas ##

# --- Creación de Listas ---
# Es el objeto más flexible: puede contener vectores, matrices, DataFrames o incluso otras listas.
# Cada elemento puede tener un tamaño y tipo de dato diferente.
list(num = 546, vector = c(1,2,5), df = data.frame(nombre = c("Luis", "Sara"), edad = c(30, 20)))

# Asignación a variable
lista <- list(num = 546, 
              vector = c(1,2,5), 
              df = data.frame(nombre = c("Luis", "Sara"), edad = c(30, 20)))


# MINIRETO: Crea una lista que contenga tu nombre (texto) y un vector con tus 3 números de la suerte.


# SOLUCIÓN:
mi_lista <- list(nombre = "TuNombre", suerte = c(7, 13, 22))


## Acceso a Elementos ##
# --- Extracción de Contenido ---

# 1. Posiciones (Dobles Corchetes)
# Usamos [[]] para entrar "dentro" del elemento de la lista
lista[[2]]        # Extrae el contenido de la segunda posición (el vector)

# 2. Nombres de elementos (Operador $)
# Es la forma más rápida y legible si los elementos están nombrados
lista$vector
lista$df$nombre   # Acceder a una columna específica de un DataFrame que está dentro de la lista

# 3. Nombres con Dobles Corchetes
# Útil si el nombre del elemento está guardado en otra variable
lista[["vector"]]


# MINIRETO: De la lista creada en el minireto anterior, accede a tu nombre usando el operador $


# SOLUCIÓN:
mi_lista$nombre


## Funciones que devuelven una Lista ##
# --- El caso de strsplit() ---
# Esta función divide cadenas de texto y siempre devuelve una lista para no perder información
resultado_split <- strsplit("Hola Mundo", split = " ") 

# Ejemplo con vectores de texto
vector_climas <- c("Calor", "Frío", "Templado")
climas_split <- strsplit(vector_climas, split = "al")

# Acceso a un elemento específico del resultado
climas_split[[1]] # Acceder a los trozos del primer elemento ("C" "or")


# MINIRETO: De la frase "R-es-genial", separa las palabras por el guion e imprime solo la tercera palabra.


# SOLUCIÓN:
palabras <- strsplit("R-es-genial", split = "-")
palabras[[1]][3]



#### EJERCICIOS COMPLEMENTARIOS: DATOS ESTRUCTURALES ####

## Ejercicio 1: Biodiversidad en Parcelas (Vectores) ##
# Crea un vector llamado 'especies_contadas' con el número de ejemplares 
# detectados de 5 especies: 12, 45, 7, 89 y 21.
# 1. Asigna nombres automáticos (p. ej., "Esp_1", "Esp_2"...) usando paste() y length().
# 2. Calcula cuántas especies tienen una población superior a 20 ejemplares.






# SOLUCIÓN:
especies_contadas <- c(12, 45, 7, 89, 21)
names(especies_contadas) <- paste("Esp", 1:length(especies_contadas), sep = "_")
sum(especies_contadas > 20)


## Ejercicio 2: Crecimiento de Plantas (Vectores aleatorios) ##
# Genera un vector 'crecimiento' con 30 valores aleatorios de una distribución 
# normal (media = 15 cm, sd = 4). Fija la semilla en 123.
# 1. Debido a limitaciones del macetero, ningún valor puede superar los 20 cm. 
#    Sustituye los valores > 20 por 20.
# 2. Calcula la media final de crecimiento.





# SOLUCIÓN:
set.seed(123)
crecimiento <- rnorm(30, mean = 15, sd = 4)
crecimiento[crecimiento > 20] <- 20
mean(crecimiento)


## Ejercicio 3: Análisis de Microorganismos (Matrices) ##
# Crea una matriz 'muestras_agua' de 4 filas (puntos de muestreo) y 3 columnas (réplicas)
# con valores aleatorios entre 0 y 1 (concentración de un patógeno) usando runif().
# 1. Nombra las columnas como "Replica.A", "Replica.B" y "Replica.C".
# 2. Extrae en un vector los valores de la "Replica.B" que sean menores a 0.5.





# SOLUCIÓN:
muestras_agua <- matrix(runif(12), nrow = 4)
colnames(muestras_agua) <- paste("Replica", c("A", "B", "C"), sep = ".")
filtro_patogeno <- muestras_agua[muestras_agua[, "Replica.B"] < 0.5, "Replica.B"]


## Ejercicio 4: Monitoreo de Fauna (DataFrames) ##
# Crea un DataFrame 'monitoreo' con tres columnas:
# 1) 'especie': Lince, Águila, Lobo, Corzo.
# 2) 'peso': secuencia de 10 a 40 de 10 en 10.
# 3) 'transmisor': vector booleano alternado (TRUE, FALSE, TRUE, FALSE).
# Filtra y muestra solo las filas de animales que pesen más de 25 kg.





# SOLUCIÓN:
monitoreo <- data.frame(
  especie = c("Lince", "Águila", "Lobo", "Corzo"),
  peso = seq(10, 40, by = 10),
  transmisor = c(TRUE, FALSE, TRUE, FALSE)
)
monitoreo[monitoreo$peso > 25, ]


## Ejercicio 5: Estado de Conservación (Factores) ##
# Tienes el estado de 10 zonas protegidas: "Vulnerable", "En Peligro", "Vulnerable", 
# "Crítico", "Crítico", "Vulnerable", "En Peligro", "Crítico", "Vulnerable", "En Peligro".
# 1. Conviértelo en factor.
# 2. Asegura el orden jerárquico: "Vulnerable", "En Peligro", "Crítico".





# SOLUCIÓN:
estados <- c("Vulnerable", "En Peligro", "Vulnerable", "Crítico", "Crítico", 
             "Vulnerable", "En Peligro", "Crítico", "Vulnerable", "En Peligro")
factor_conservacion <- factor(estados, levels = c("Vulnerable", "En Peligro", "Crítico"))


## Ejercicio 6: Expedición Científica (Listas) ##
# Crea una lista 'expedicion' que contenga:
# 1) El vector 'crecimiento' del ejercicio 2.
# 2) El DataFrame 'monitoreo' del ejercicio 4.
# 3) Un resumen (summary) del vector 'especies_contadas' del ejercicio 1.
# Accede mediante el operador $ a la columna 'especie' del DataFrame dentro de la lista.





# SOLUCIÓN:
expedicion <- list(
  botanica = crecimiento,
  zoologia = monitoreo,
  conteo_especies = summary(especies_contadas)
)
expedicion$zoologia$especie
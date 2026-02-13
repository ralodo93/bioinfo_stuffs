# Tipos de Datos Estructurales ----
# Son estructuras formadas por conjuntos de datos atómicos. Pueden ser 5 tipos.
# Vectores: Conjunto de datos de un mismo tipo de una dimensión. Se definen con c()
c(8, 5, 4, 1) # vector numérico
c("Hola", "Hello", "Bonjour") # vector de character
c(TRUE, TRUE, FALSE) # vector booleano

# Factores: Conjunto de datos de un mismo tipo de una dimensión que se agrupan en categorías
# Se definen con factor()
factor(c("Hombre", "Mujer")) # factor con dos categorías

# Matrices: Conjunto de datos de un mismo tipo de dos dimensiones (filas y columnas)
# Se definen con matrix()
matrix(c(1, 2, 3, 4), ncol = 2) # matriz de dos filas y dos columnas con los valores de un vector

# Dataframes: Conjunto de datos heterogéneos de dos dimensiones (filas y columnas)
# Se definen con data.frame()
# dataframe de dos filas y dos columnas, los valores de cada columna se asignan según los vectores
data.frame(nombre = c("Luis", "Ana"), edad = c(20, 30)) 

# Listas: Conjunto de datos heterogéneos de infinitas dimensiones
# Se definen con list()
# lista de 3 elementos (un número, un character y un vector)
list(1, "Hola", c(12, 34, 56))

#-------------------------------------------------------------------------#

# Vectores ----
## Crear un vector ----

### Usando la función c() ----
vector_numeros <- c(1, 2, 3, 4, 5, 6)

# Si usamos más de un tipo de dato, lo transformará todos en el dato más flexible (texto)
# A esto se le llama coerción
c("Hola", 54, TRUE)

# Vectores vacíos y concatenación
vector_vacio <- c() # esto crea un vector vacío (NULL)
vector_relleno <- c(vector_vacio, 8) # añadir elementos a un vector
vector_final <- c(vector_relleno, vector_numeros) # concatenar vectores

### Vectores secuenciales ----
# Operador :
1:10 # crea un vector numérico con los números de 1 a 10 (enteros)

# Función seq()
seq(1, 10, 2) # Crea un vector numéricos de 1 a 10, pero de 2 en 2

# Función rep()
rep(c("Hola", "Hello"), times = 3) # repite un vector 3 veces
rep(c("Hola", "Hello"), each = 3) # repite cada elemento de un vector 3 veces

### Vectores con valores aleatorios ----
# Función sample()
sample(c(2, 8), size = 1) # Extrae 1 valor aleatorio entre 2 y 8
sample(c(2, 8, 9), size = 2) # Extrae 2 valores aleatorio entre 2, 8 y 9 sin poder repetir número
sample(c(2, 8, 9), size = 4, replace = TRUE) # Extrae 4 valores aleatorio entre 2, 8 y 9 pudiendo repetir número

# Función rnorm()
rnorm(12) # genera un vector con 12 valores aleatorios que siguen una distribución normal con media=0 y desviacion estandar=1
rnorm(12, media = 10, sd = 0.5) # genera un vector con 12 valores aleatorios que siguen una distribución normal con media=10 y desviacion estandar=0.5

# Funcion runif()
runif(5) # Genera un vector de 5 números aleatorios distribuidos de forma uniforma con valores entre 0 y 1
runif(5, min = -1, max = 1) # Genera un vector de 5 números aleatorios distribuidos de forma uniforma con valores entre -1 y 1

# Control de los valores aleatorios
# Usamos la funcion set.seed() para fijar una semilla de aleatoriedad universal
set.seed(12345)
sample(1:10, size = 2) # se obtienen los valores 3 y 8

## Matemáticas y Lógica ----
vector_numeros * 9 # genera un vector del mismo tamaño multiplicando cada elemento por 9
vector_numeros < 3 # genera un vector del mismo tamaño devolviendo TRUE o FALSE para cada elemento

# Operador especial para vectores: %in%
"uva" %in% c("uva", "manzana", "naranja") # devuelve TRUE si "uva" está en el vector

## Funciones de vectores ----
length(vector_numeros) # indica el número de elementos de un vector
names(vector_numeros) # muestra los nombres de los vectores, por defecto es NULL porque no existen

# Asignar nombres (Debe coincidir la longitud del vector con la de los nombres)
names(vector_numeros) <- c("num1", "num2", "num3", "num4", "num5", "num6", "num7") # Esto da error... sabrías decir por qué?
names(vector_numeros) <- c("num1", "num2", "num3") # Esto no da error... pero no es del todo correcto
vector_numeros # ¿por qué?
names(vector_numeros) <- c("num1", "num2", "num3", "num4", "num5", "num6") # Esto si es correcto
vector_numeros # mostrar vector completo
names(vector_numeros) # mostrar solo nombres de los elementos

# Manipulación de texto en vectores
paste(vector_numeros, collapse = ", ") # para colapsar todos lo elementos de un vector en un texto usamos collapse y el separador que queramos
paste("Mis números favoritos son", paste(vector_numeros, collapse = ", ")) # de este modo podemos jugar con diferentes paste para generar un texto complejo

# Eliminar NAs de un vector
vector_con_NA <- c(10, NA, 15, 25, 8) # incluimos un elemento NA en un vector
na.omit(vector_con_NA) # elimina los NA de un vector

# Valores repetidos y únicos
mi_vector_repetido <- c(rep("Hola", 4), "Hello")
duplicated(mi_vector_repetido) # la primera vez que se encuentra un elemento repetido es FALSE, a partir de la segunda es TRUE
unique(mi_vector_repetido) # devuelve los elementos únicos de un vector

# Todos o ningñun elemento cumplen una condición
any(vector_numeros < 5) # algún elemento es menor de 5
all(vector_numeros < 5) # todos los elementos son menores de 5


### Operaciones Estadísticas ----
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


## Acceso a Elementos (Indexación) ----
### Selección por Posición y Condición ----
# IMPORTANTE: En R las posiciones empiezan en 1 (no en 0)
vector_numeros[2]               # Acceder al segundo elemento
vector_numeros[c(1, 3)]         # Acceder a la primera y tercera posición

# Selección por condición (Filtrado)
vector_numeros[vector_numeros > 3] # Devuelve solo los mayores de 3

### Reasignar Valores ----
vector_numeros[3] <- 8          # Cambia la posición 3 por el valor 8
vector_numeros[vector_numeros < 3] <- 0 # Cambia todos los menores de 3 a 0

############################################################
# EJERCICIO 1
# Contexto:
# Un ecólogo está estudiando una población de anfibios en una charca. 
# Durante 7 días, registra el número de ejemplares avistados. Sin embargo, 
# el segundo día no pudo realizar el muestreo por lluvia, y el quinto día 
# anotó un valor erróneo que debe ser corregido.
#
# Enunciado:
# 1. Crea un vector llamado 'avistamientos' con los valores: 12, NA, 15, 8, 42, 10, 14.
# 2. El valor 42 (posición 5) es un error; cámbialo por el valor correcto: 11.
# 3. Asigna nombres al vector 'avistamientos' ("Lunes", "Martes", etc.)
# 4. Calcula la media de avistamientos eliminando primero el valor NA con la 
#    función na.omit(). Guarda el resultado en 'media_presencia'. Redondea el resultado a 1 decimal
############################################################

# El estudiante debe completar a partir de aquí:



# SOLUCIÓN

avistamientos <- c(12, NA, 15, 8, 42, 10, 14)

avistamientos[5] <- 11

names(avistamientos) <- c("Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo")
avistamientos

avistamientos <- na.omit(avistamientos)

media_presencia <- round(mean(avistamientos), 1)

############################################################
# EJERCICIO 2
# Contexto:
# En un laboratorio de genética se generan 100 secuencias cortas de ADN 
# de forma aleatoria para testear un algoritmo. Se sabe que el contenido 
# GC (Guanina-Citosina) en estas secuencias sigue una distribución normal.
#
# Enunciado:
# 1. Fija una semilla de aleatoriedad con el número 2024.
# 2. Genera un vector llamado 'contenido_gc' con 100 valores aleatorios 
#    que sigan una distribución normal con media 50 y desviación estándar 5.
# 3. ¿Hay algún valor en el vector que sea mayor a 65? Usa una función 
#    que devuelva un solo valor lógico (TRUE/FALSE).
# 4. Crea un nuevo vector llamado 'altos_gc' que contenga únicamente los 
#    valores de 'contenido_gc' que sean superiores a 55.
# 5. Calcula cuántos valores hay en el vector 'altos_gc' utilizando la 
#    función que mide la longitud del vector.
############################################################

# El estudiante debe completar a partir de aquí:



# SOLUCIÓN

set.seed(2024)

contenido_gc <- rnorm(100, mean = 50, sd = 5)

any(contenido_gc > 65)

altos_gc <- contenido_gc[contenido_gc > 55]

length(altos_gc)


############################################################
# EJERCICIO 3
# Contexto:
# Un nutricionista analiza los componentes de varias dietas. Tiene una 
# lista de "Superalimentos" y quiere comprobar si los ingredientes de 
# un paciente están en esa lista, además de limpiar duplicados.
#
# Enunciado:
# 1. Crea el vector 'superalimentos' con: "Arándano", "Espinaca", "Nuez", "Chía".
# 2. Crea el vector 'dieta_paciente' repitiendo "Nuez" 3 veces y "Manzana" 2 veces.
# 3. Obtén los elementos únicos de 'dieta_paciente' y guárdalos en 'ingredientes'.
# 4. Usa el operador %in% para verificar cuáles de los 'ingredientes' están 
#    en la lista de 'superalimentos'.
# 5. Genera un texto colapsado (en una sola cadena) que diga: 
#    "Ingredientes a analizar: [aquí los elementos de tu vector ingredientes]" 
#    separados por un guion (" - ").
############################################################

# El estudiante debe completar a partir de aquí:



# SOLUCIÓN

superalimentos <- c("Arándano", "Espinaca", "Nuez", "Chía")

dieta_paciente <- c(rep("Nuez", 3), rep("Manzana", 2))

ingredientes <- unique(dieta_paciente)

ingredientes %in% superalimentos

paste("Ingredientes a analizar:", paste(ingredientes, collapse = " - "))


############################################################


# Factores ----
## Crear un Factor ----
# Los factores son muy útiles para representar datos cualitativos (etiquetas)
# que se repiten a lo largo de un conjunto de datos.
factor(c("Hombre", "Mujer", "Mujer", "Hombre"))
factor(rep(c(1,2), 8)) # Los factores también pueden ser números

# Se pueden asignar a variables
vector_climas <- sample(c("Calor", "Frío", "Templado"), size = 10, replace = TRUE)
factor_climas <- factor(vector_climas)

## Niveles (Levels) ----
# Los niveles definen las categorías únicas y, muy importante, su orden jerárquico.
# Orden por defecto es alfanumérico
factor(c("Hombre", "Mujer", "Mujer", "Hombre"))

# Para usar un orden personalizado usamos el argumento levels
factor(c("Hombre", "Mujer", "Mujer", "Hombre"), levels = c("Mujer", "Hombre"))

## Propiedades de los Factores ----
levels(factor_climas)  # Muestra las categorías únicas del factor
nlevels(factor_climas) # Indica cuántas categorías diferentes existen
table(factor_climas)   # Crea una tabla de frecuencias (cuenta cuántos hay de cada nivel)

############################################################
# EJERCICIO 1
# Contexto:
# En un estudio sobre oncología, se clasifica la gravedad de los tumores 
# de 15 pacientes utilizando la escala TNM simplificada: "Benigno", 
# "Moderado" y "Grave". Es vital que el factor mantenga un orden clínico 
# lógico (de menor a mayor gravedad) para que los análisis posteriores 
# no sigan el orden alfabético por defecto.
#
# Enunciado:
# 1. Crea un vector llamado 'muestras_cancer' que contenga 15 valores 
#    aleatorios de las categorías: "Benigno", "Moderado" y "Grave". 
#    (Usa sample con reemplazo).
# 2. Convierte ese vector en un factor llamado 'factor_cancer'.
# 3. Define manualmente los niveles (levels) para que el orden sea: 
#    1. Benigno, 2. Moderado, 3. Grave.
# 4. Utiliza una función para contar cuántos pacientes hay en cada 
#    categoría de gravedad.
# 5. Muestra por consola cuántos niveles o categorías distintas 
#    tiene tu factor.
############################################################

# El estudiante debe completar a partir de aquí:
set.seed(2024)


# SOLUCIÓN

muestras_cancer <- sample(c("Benigno", "Moderado", "Grave"), size = 15, replace = TRUE)

factor_cancer <- factor(muestras_cancer)

factor_cancer <- factor(muestras_cancer, levels = c("Benigno", "Moderado", "Grave"))

table(factor_cancer)

nlevels(factor_cancer)

############################################################


# Matrices ----
## Crear una matriz ----
matrix(1:9, ncol = 3) # matriz con los elementos de 1 a 9, con 3 columnas
matrix(c("Hola", "Bonjour", "Hello", "Ciao"), ncol = 2) # matriz con elementos de texto
matrix(c(TRUE, FALSE, FALSE, FALSE), ncol = 2) # matriz con Booleanos

# Asignar a una variable
matriz1 <- matrix(1:9, ncol = 3)

# Ver la matriz (abre una pestaña nueva)
View(matriz1)

## Matemáticas y Lógica ----
# Al igual que los vectores, las operaciones matemáticas y lógicas se hacen elemento a elemento
matriz1 * 8
matriz1 < 5

## Funciones Aplicadas a Matrices ----
ncol(matriz1) # número de columnas de una matriz
nrow(matriz1) # número de filas de una matriz
dim(matriz1) # número de filas y columnas de una matriz
head(matriz1) # Ver las primeras 6 filas de la matriz
tail(matriz1, n = 2) # Ver las últimas 2 filas de la matriz

# Gestión de etiquetas
colnames(matriz1) <- c("col1", "col2", "col3") # por defecto colnames() es NULL, pero podemos asignarle un valor
rownames(matriz1) <- c("row1", "row2", "row3") # por defecto rownames() es NULL, pero podemos asignarle un valor
matriz1

# Gestión de NA
vector_numeros <- 1:9
vector_numeros[5] <- NA
matriz_con_NA <- matrix(vector_numeros, ncol = 3)
na.omit(matriz_con_NA) # Elimina las filas que tengan un NA

### Operaciones estadísticas ----
# Las operaciones estadísticas que vimos en los vectores también se pueden aplicar al conjunto de la matriz
mean(matriz1) # media de los elementos de la matriz

## Acceso a Elementos ----
### Por Posición, Condición y Nombre ----
# Por posición: matrix[filas, columnas]
matriz1[1,2] # Acceder a la celda de la fila 1, columna 2
matriz1[1,] # Acceder a la fila 1 completa
matriz1[,2] # Acceder a la columna 2 completa
matriz1[c(1, 3), 2] # Acceder a las celdas de las filas 1 y 3, de la columna 2

# Por condición: matrix[condicón]
matriz1[matriz1 > 2] # devuelve todos los elementos mayores que dos

# Por nombre: matrix[nombre filas, nombre columnas]
matriz1["row1", c("col1", "col3")] # Fila de nombre row1, columnas col1 y col3

### Reasignación Valores ----
matriz1[1, 2] <- 8 # Modifica el valor de la celda fila 1, columna 2
matriz1["row1", "col2"] <- 4 # Modifica el valor de la fila row1, columna col2

matriz1[1,] <- 7 # Modifica todos los valores de la fila 1 y los convierte en 7
matriz1[1,] <- c(1, 4, 7) # Modifica todos los valores de la fila 1 mediante un vector

matriz1[matriz1 > 2] <- 8 # Modifica todos los valores mayores que 2 y los convierte en 8

############################################################
# EJERCICIO 1
# Contexto:
# Un laboratorio de análisis clínicos registra los niveles de tres 
# metabolitos (Glucosa, Urea y Ácido Úrico) en tres pacientes distintos. 
# Los datos deben organizarse en una estructura bidimensional para su 
# correcta interpretación y etiquetado.
#
# Enunciado:
# 1. Crea una matriz llamada 'analisis' con los números del 1 al 9, 
#    distribuidos en 3 columnas.
# 2. Asigna nombres a las columnas: "Glucosa", "Urea" y "Ac_Urico".
# 3. Asigna nombres a las filas: "Paciente_A", "Paciente_B" y "Paciente_C".
# 4. Accede únicamente a la columna "Urea" por su nombre y muestra el 
#    resultado.
# 5. Muestra por consola las dimensiones (filas y columnas) de la matriz.
############################################################

# El estudiante debe completar a partir de aquí:



# SOLUCIÓN

analisis <- matrix(1:9, ncol = 3)

colnames(analisis) <- c("Glucosa", "Urea", "Ac_Urico")

rownames(analisis) <- c("Paciente_A", "Paciente_B", "Paciente_C")

analisis[,"Urea"]

dim(analisis)


############################################################
# EJERCICIO 2
# Contexto:
# Estás analizando la expresión de 4 genes en 5 muestras de tejido. 
# Debido a un error de lectura, algunos valores son extremadamente altos 
# y deben ser normalizados. Además, una de las muestras presenta un valor 
# perdido (NA) que debe ser gestionado antes del análisis estadístico.
#
# Enunciado:
# 1. Crea una matriz llamada 'expresion' de 5 filas y 4 columnas usando 
#    valores aleatorios de una distribución normal (media=10, sd=2). 
#    Usa set.seed(42) antes de generar los datos.
# 2. Introduce un valor NA en la celda de la fila 2, columna 3.
# 3. Crea una nueva matriz llamada 'expresion_limpia' eliminando la fila 
#    que contiene el valor NA.
# 4. En la matriz 'expresion_limpia', busca todos los valores que sean 
#    mayores a 12 y sustitúyelos por el valor exacto 12 (truncamiento).
# 5. Calcula la media global de todos los elementos de 'expresion_limpia'.
############################################################

# El estudiante debe completar a partir de aquí:



# SOLUCIÓN
set.seed(42)
expresion <- matrix(rnorm(20, mean = 10, sd = 2), ncol = 4)

expresion[2, 3] <- NA

expresion_limpia <- na.omit(expresion)

expresion_limpia[expresion_limpia > 12] <- 12

mean(expresion_limpia)

############################################################


# DataFrames ----
## Crear un DataFrame ----
data.frame(nombre = c("Luis", "Sara"), edad = c(30, 20))

# Asignar a una variable
tabla_nombres <- data.frame(nombre = c("Luis", "Sara"), edad = c(30, 20))

# Creación a partir de vectores previos
nombres <- c("Luis", "Sara")
edades <- c(30, 20)
tabla_nombres <- data.frame(nombre = nombres, edad = edades) 

# Ver un dataframe
View(tabla_nombres)

## Funciones aplicadas a DataFrames ----
ncol(tabla_nombres) # número de columnas de un dataframe
nrow(tabla_nombres) # número de filas de un dataframe
dim(tabla_nombres) # número de filas y columnas de un dataframe
head(tabla_nombres) # Ver las primeras 6 filas de un dataframe
tail(tabla_nombres, n = 2) # Ver las últimas 2 filas de un dataframe

# Gestión de etiquetas
colnames(tabla_nombres) <- c("col1", "col2") # por defecto colnames() tiene los valores que se asignan en la función data.frame()
rownames(tabla_nombres) <- c("row1", "row2") # por defecto rownames() es un vector character de 1 a nrow
tabla_nombres

# Gestión de NA
nombres[2] <- NA
tabla_nombres <- data.frame(nombre = nombres, edad = edades)
na.omit(tabla_nombres) # Elimina las filas que tengan un NA

# Unir Dataframes

# Concatenar filas
tabla_nombres2 <- data.frame(nombre = c("Ana", "Alex"), edad = c(35, 45))
tabla_final <- rbind(tabla_nombres, tabla_nombres2)

# Concatenar Columnas
bioquimica <- data.frame(glucosa = rnorm(4, mean = 85, sd = 2), proteina = rnorm(4, mean = 7, sd = 0.2))
tabla_final <- cbind(tabla_final, bioquimica)


## Acceso a Elementos ----
### Por Posición, Nombre y Condición ----
nombres <- c("Luis", "Sara", "Esteban")
edades <- c(30, 20, 45)
tabla_nombres <- data.frame(nombre = nombres, edad = edades) 

# Por posicion: dataframe[filas, columnas] Igual que las matrices
tabla_nombres[1, 2] # Celda de fila 1, columna 2
tabla_nombres[,2] # Todas las filas de la columna 2

# Por nombre: dataframe[nombre filas, nombre columnas] Ó dataframe$nombre_columna
tabla_nombres[,"nombre"] # solo muestra columna nombre
tabla_nombres$edad # solo muestra columna edad

# Por condición: dataframe[condicion para filas, condición para columnas]
tabla_nombres[tabla_nombres$edad > 25,] # filtra las columnas que no cumplen la condición

### Reasignación de Valores ----
tabla_nombres[1, 2] <- 31 # Cambia el valor de la celda específica

# Todos los elementos de la columna "nombre" cuyo valor de "edad" sea menor de 25 ahora pasan a tener el valor "Juan"
tabla_nombres[tabla_nombres$edad < 25, "nombre"] <- "Juan" 

# Crear una nueva columna
tabla_nombres$Telefono <- c(900800100, 900700100, 900600100)
tabla_nombres

############################################################
# EJERCICIO 1
# Contexto:
# Un equipo de investigación está realizando un seguimiento de constantes 
# vitales en pacientes de una unidad de cuidados intensivos. Se dispone 
# de los nombres y la frecuencia cardíaca, pero se necesita consolidar 
# la información y limpiar los registros incompletos.
#
# Enunciado:
# 1. Crea un dataframe llamado 'pacientes' con dos columnas: 
#    'nombre' (Marcos, Elena, NA) y 'ppm' (frecuencia cardíaca: 72, 85, 60).
# 2. Utiliza una función para visualizar el número total de filas y 
#    columnas que tiene el dataframe.
# 3. Elimina del dataframe cualquier fila que contenga un valor NA.
# 4. Añade una nueva columna llamada 'Estado' con el valor "Estable" 
#    para todos los pacientes restantes.
############################################################

# El estudiante debe completar a partir de aquí:



# SOLUCIÓN

pacientes <- data.frame(nombre = c("Marcos", "Elena", NA),
                        frecuencia_cardiaca = c(72, 85, 60))

dim(pacientes)

pacientes <- na.omit(pacientes)

pacientes$Estado <- "Estable"


############################################################
# EJERCICIO 2
# Contexto:
# En un estudio multicéntrico sobre diabetes, se han recogido datos de 
# glucosa en dos hospitales diferentes. Es necesario unir ambas bases de 
# datos, añadir información sobre el tratamiento y filtrar aquellos 
# pacientes con niveles de glucosa en riesgo (superiores a 100 mg/dL).
#
# Enunciado:
# 1. Crea 'hospital_A' con los pacientes "P1" y "P2" (columna 'id') 
#    y glucosa 95 y 110 (columna 'glucosa').
# 2. Crea 'hospital_B' con los pacientes "P3" y "P4" y glucosa 88 y 120.
# 3. Une ambos dataframes por filas en una variable llamada 'estudio_total'.
# 4. Crea un segundo dataframe llamado 'clinica' que contenga una sola 
#    columna 'insulina' con 4 valores lógicos (TRUE, FALSE, TRUE, FALSE).
# 5. Une 'estudio_total' y 'clinica' por columnas.
# 6. Filtra el dataframe final para mostrar solo las filas donde la 
#    'glucosa' sea mayor a 100.
############################################################

# El estudiante debe completar a partir de aquí:



# SOLUCIÓN

hospital_1 <- data.frame(id = c("P1", "P2"),
                         glucosa = c(95, 110))

hospital_2 <- data.frame(id = c("P3", "P4"),
                         glucosa = c(88, 120))

estudio_total <- rbind(hospital_1, hospital_2)

clinica <- data.frame(insulina = c(TRUE, FALSE, TRUE, FALSE))

estudio_total <- cbind(estudio_total, clinica)

estudio_total[estudio_total$glucosa > 100,]

############################################################

# Listas ----
## Crear Listas ----
list(1, "Hola", c(8, 7, 4))

# Asignar a variables
lista1 <- list(1, "Hola", c(8, 7, 4))

# Podemos asignar directamente nombres a cada elemento de la lista
lista1 <- list(num = 1, text = "Hola", vector_numeros = c(8, 7, 4))
lista1


## Funciones aplicadas a listas ----
length(lista1) # devuelve el número de elementos de la lista
names(lista1) # devuelve los nombres de la lista
names(lista1)[2] <- "texto" # modificar los nonbres de una lista

### Función especial strsplit() ---- 
# Esta función divide cadenas de texto y siempre devuelve 
# una lista para no perder información
resultado_split <- strsplit("Hola Mundo", split = " ")
resultado_split

# Si queremos desplegar los elementos de una lista (pasar de lista a matriz) usamos unlist()
unlist(resultado_split)


## Acceso a los elementos de una lista ----
### Por Posición y Nombre ----
# Por Posición: lista[posicion] devuelve el elemento como una lista de un elemento
lista1[1]

# Por Posición: lista[[posicion]] devuelve el elemento tal cual es
lista1[[3]]

# Por nombre: lista[nombre] Ó lista[[nombre]]. Mismo funcionamiento que las posiciones
lista1["num"]
lista1[["texto"]]

# Por nombre: lista$nombre es una alternativa a lista[[nombre]]
lista1$num


############################################################
# EJERCICIO 15
# Contexto:
# Un investigador en genómica está procesando una muestra de tejido. 
# Para organizar la información, decide utilizar una lista que contenga 
# el nombre del proyecto, las lecturas de expresión de tres genes y los 
# nombres de dichos genes obtenidos a partir de una cadena de texto.
#
# Enunciado:
# 1. Crea una variable 'cadena_genes' con el texto "GAPDH;BRCA1;TP53".
# 2. Utiliza la función strsplit() para dividir la cadena por el separador ";" 
#    y guarda el resultado en una lista llamada 'lista_nombres'.
# 3. Crea una lista maestra llamada 'experimento' que contenga tres elementos:
#    - 'id': un número entero (p.ej. 101).
#    - 'genes': el vector con los nombres de los genes (pista: usa unlist() 
#       sobre 'lista_nombres').
#    - 'expresion': un vector numérico con los valores 14.5, 2.3, 8.9.
# 4. Accede al vector de 'expresion' dentro de la lista 'experimento' 
#    usando el operador $ y calcula su media.
# 5. Cambia el nombre del primer elemento de la lista 'experimento' 
#    de "id" a "codigo_muestra" usando la función names().
############################################################

# El estudiante debe completar a partir de aquí




# SOLUCIÓN

cadena_genes <- "GAPDH;BRCA1;TP53"

lista_nombres <- strsplit(cadena_genes, ";")

experimento <- list(
  id = 101,
  genes = unlist(lista_nombres),
  expresion = c(14.5, 2.3, 8.9)
)

mean(experimento$expresion)

names(experimento)[1] <- "codigo_muestra"

############################################################

############################################################
# EJERCICIO 1
# Contexto:
# Un equipo de epidemiología está analizando la prevalencia de una variante 
# vírica en 4 regiones. Tienen los datos de casos detectados y quieren 
# etiquetarlos por niveles de riesgo, asegurando que la estructura sea 
# fácil de leer para el informe final.
#
# Enunciado:
# 1. Crea un vector 'casos' con los valores: 120, 450, 80, 310.
# 2. Crea un factor 'riesgo' basado en esos casos. Si el valor es mayor 
#    a 200 es "Alto", si es menor o igual es "Bajo". 
#    Nota: Crea el factor manualmente con: c("Bajo", "Alto", "Bajo", "Alto") 
#    y asegúrate de que el nivel "Bajo" sea el primero.
# 3. Construye un dataframe llamado 'informe_viral' que combine los 
#    vectores 'casos' y 'riesgo' como columnas.
# 4. Asigna como nombres de fila de este dataframe las regiones: 
#    "Norte", "Sur", "Este", "Oeste".
# 5. Filtra el dataframe para mostrar solo las regiones con riesgo "Alto".
#
############################################################

# El estudiante debe completar a partir de aquí




# SOLUCIÓN

casos <- c(120, 450, 80, 310)

riesgo <- factor(c("Bajo", "Alto", "Bajo", "Alto"), levels = c("Bajo", "Alto"))

informe_viral <- data.frame(casos = casos, riesgo = riesgo)

rownames(informe_viral) <- c("Norte", "Sur", "Este", "Oeste")

informe_viral[informe_viral$riesgo == "Alto", ]


############################################################
# EJERCICIO 2
# Contexto:
# En un ensayo de toxicología, se mide la respuesta celular a 5 dosis 
# diferentes. Los datos se recogen en una matriz, pero se sospecha que 
# una lectura es errónea (un valor negativo imposible) y debe ser 
# tratada como un dato faltante (NA) antes de procesar la media.
#
# Enunciado:
# 1. Crea una matriz 'ensayo' de 5 filas y 2 columnas (Dosis A y Dosis B) 
#    con los valores: 10, 12, 15, -1, 18 (columna 1) y 20, 22, 25, 27, 30 (columna 2).
# 2. Identifica el valor -1 por su posición [4, 1] y cámbialo por NA.
# 3. Crea una variable 'ensayo_limpio' eliminando la fila que contiene el NA.
# 4. Calcula la suma total de todos los valores de 'ensayo_limpio'.
# 5. Comprueba si "algún" (any) valor en 'ensayo_limpio' es mayor a 28.
############################################################

# El estudiante debe completar a partir de aquí




# SOLUCIÓN

ensayo <- matrix(c(10, 12, 15, -1, 18, 20, 22, 25, 27, 30), ncol = 2)
colnames(ensayo) <- c("Dosis A", "Dosis B")

ensayo[4, 1] <- NA

ensayo_limpio <- na.omit(ensayo)

sum(ensayo_limpio)

any(ensayo_limpio > 28)


############################################################
# EJERCICIO 3
# Contexto:
# Un bioinformático organiza la información de un paciente en una lista 
# compleja. La lista contiene datos personales, un historial de glucosa 
# y una matriz de expresión proteica. Necesita extraer y manipular 
# elementos específicos de esta jerarquía.
#
# Enunciado:
# 1. Crea una lista 'paciente_X' con 3 elementos:
#    - 'info': "Paciente_001"
#    - 'glucosa': un vector de 1 a 5.
#    - 'proteinas': una matriz de 2x2 con los valores c(1.2, 2.4, 0.8, 3.1).
# 2. Accede al vector 'glucosa' mediante el operador $ y multiplícalo por 10.
# 3. Accede al valor de la matriz 'proteinas' que está en la fila 1, 
#    columna 2 (2.4) y súmale 0.5.
# 4. Añade un cuarto elemento a la lista llamado 'apto' con el valor TRUE.
# 5. Usa la función length() para verificar cuántos elementos tiene ahora la lista.
############################################################

# El estudiante debe completar a partir de aquí




# SOLUCIÓN

paciente_X <- list(
  info = "Paciente_001",
  glucosa = 1:5,
  proteinas = matrix(c(1.2, 2.4, 0.8, 3.1), nrow = 2, ncol = 2)
)

paciente_X$glucosa <- paciente_X$glucosa * 10

paciente_X$proteinas[1, 2] <- paciente_X$proteinas[1, 2] + 0.5

paciente_X$apto <- TRUE

length(paciente_X)
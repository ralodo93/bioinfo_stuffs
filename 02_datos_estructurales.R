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


# EJERCICIO 1: Diseño experimental y repeticiones
# Contexto: Vas a montar un experimento con 3 tratamientos: "Control", 
# "Nitrógeno" y "Fósforo". Necesitas 5 réplicas por tratamiento.
# 1. Crea un vector llamado 'tratamientos' que repita cada etiqueta 5 veces 
#    seguidas (es decir: Control, Control..., Nitrógeno, Nitrógeno...).
# 2. Crea un vector llamado 'id_parcela' que contenga una secuencia de 
#    números del 1 al 15.
# 3. Usa la función 'length()' para comprobar que ambos vectores miden lo mismo.


# SOLUCIÓN
tratamientos <- rep(c("Control", "Nitrogeno", "Fosforo"), each = 5)
id_parcela <- 1:15
length(tratamientos) == length(id_parcela)

#-------------------------------------------------------------------------#

# EJERCICIO 2: Simulación de datos y estadística descriptiva
# Contexto: Simulamos la longitud (en cm) de 50 individuos de una población 
# de peces que sigue una distribución normal (media = 15, sd = 2).
# 1. Fija la semilla en '123' para que el resultado sea reproducible.
# 2. Genera el vector 'peces_longitud' con 50 valores aleatorios normales.
# 3. Calcula la media, la desviación estándar y el valor máximo de la muestra.
# 4. ¿Cuántos peces miden más de 18 cm? (Pista: usa sum() sobre un vector lógico).


# SOLUCIÓN
set.seed(123)
peces_longitud <- rnorm(50, mean = 15, sd = 2)
mean(peces_longitud)
sd(peces_longitud)
max(peces_longitud)
sum(peces_longitud > 18)

#-------------------------------------------------------------------------#

# EJERCICIO 3: Muestreo aleatorio y operadores de pertenencia
# Contexto: Tienes un inventario de 6 especies presentes en un ecosistema.
# 1. Crea el vector 'especies' con: "Quercus", "Pinus", "Fagus", "Betula", 
#    "Abies" y "Acer".
# 2. Selecciona aleatoriamente 3 especies para un análisis genético (sin repetición).
# 3. Comprueba mediante el operador %in% si la especie "Betula" ha sido 
#    seleccionada en tu sorteo aleatorio.


# SOLUCIÓN
especies <- c("Quercus", "Pinus", "Fagus", "Betula", "Abies", "Acer")
seleccionadas <- sample(especies, size = 3)
"Betula" %in% seleccionadas

#-------------------------------------------------------------------------#

# EJERCICIO 4: Indexación, limpieza y sustitución (Outliers)
# Contexto: Dispones de un vector de biomasa (kg) con algunos errores de 
# medición y valores ausentes (NA).
# 1. Crea el vector: biomasa <- c(1.2, 2.5, NA, 450, 3.1, 1.8).
# 2. El valor 450 es un error (outlier); cámbialo por un valor de 4.5 
#    usando indexación por posición (es la 4ª posición).
# 3. Crea un nuevo vector 'biomasa_limpia' eliminando los valores NA.
# 4. En 'biomasa_limpia', sustituye todos los valores menores a 2 por el valor 0.


# SOLUCIÓN
biomasa <- c(1.2, 2.5, NA, 450, 3.1, 1.8)
biomasa[4] <- 4.5
biomasa_limpia <- na.omit(biomasa)
biomasa_limpia[biomasa_limpia < 2] <- 0
biomasa_limpia

#-------------------------------------------------------------------------#


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

# EJERCICIO 1: Categorización de la degradación del hábitat
# Contexto: En un estudio de conservación, has evaluado 12 parcelas y las has 
# clasificado según su nivel de degradación: "Baja", "Media" y "Alta".
# 1. Crea un vector llamado 'muestreo' que repita 4 veces cada categoría 
#    usando la función 'rep()' con el argumento 'each'.
# 2. Transforma ese vector en un factor llamado 'factor_degradacion'.
# 3. Define los niveles ('levels') para que sigan un orden lógico de menor 
#    a mayor impacto: "Baja", "Media", "Alta".
# 4. Usa la función 'table()' para obtener el recuento de parcelas en cada 
#    categoría y comprueba que aparecen en el orden correcto.


# SOLUCIÓN
muestreo <- rep(c("Baja", "Media", "Alta"), each = 4)
factor_degradacion <- factor(muestreo, levels = c("Baja", "Media", "Alta"))

# Comprobación de la estructura y frecuencias
levels(factor_degradacion)
table(factor_degradacion)

#-------------------------------------------------------------------------#


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

# EJERCICIO 1: Creación y etiquetado de una matriz de abundancia
# Contexto: Has muestreado 3 parcelas (P1, P2, P3) y has registrado la 
# abundancia de 3 especies de insectos.
# 1. Crea una matriz llamada 'comunidad' con los valores del 1 al 9, 
#    organizados en 3 columnas (una columna por especie).
# 2. Asigna nombres a las filas: "Parcela_1", "Parcela_2" y "Parcela_3".
# 3. Asigna nombres a las columnas: "Especie_A", "Especie_B" y "Especie_C".
# 4. Usa la función 'dim()' para verificar las dimensiones de tu matriz.


# SOLUCIÓN
comunidad <- matrix(1:9, ncol = 3)
rownames(comunidad) <- c("Parcela_1", "Parcela_2", "Parcela_3")
colnames(comunidad) <- c("Especie_A", "Especie_B", "Especie_C")
dim(comunidad)
comunidad

#-------------------------------------------------------------------------#

# EJERCICIO 2: Extracción de datos y submuestreo
# Contexto: Utilizando la matriz 'comunidad' del ejercicio anterior:
# 1. Extrae en un vector todas las abundancias de la "Parcela_2".
# 2. Extrae el valor de abundancia de la "Especie_C" en la "Parcela_1" 
#    usando los nombres de filas y columnas.
# 3. Calcula la suma total de individuos de la "Especie_B" (toda la columna 2).
# 4. Calcula la desviación estándar de toda la matriz


# SOLUCIÓN
abund_p2 <- comunidad["Parcela_2", ]
abund_p1_spC <- comunidad["Parcela_1", "Especie_C"]
total_spB <- sum(comunidad[, "Especie_B"])
media_matriz <- mean(comunidad)

#-------------------------------------------------------------------------#

# EJERCICIO 3: Umbrales de detección y reasignación
# Contexto: En un estudio de presencia/ausencia, decidimos que cualquier 
# valor de abundancia inferior a 4 es poco fiable y debe considerarse 0.
# 1. Crea una copia de la matriz llamada 'comunidad_limpia'.
# 2. Sustituye todos los valores menores a 4 por el valor 0 usando 
#    indexación por condición.
# 3. Multiplica la matriz resultante por 10 para simular una estima 
#    de densidad por hectárea.


# SOLUCIÓN
comunidad_limpia <- comunidad
comunidad_limpia[comunidad_limpia < 4] <- 0
comunidad_hectarea <- comunidad_limpia * 10

comunidad_hectarea

#-------------------------------------------------------------------------#


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

# EJERCICIO 1: Construcción de una base de datos de campo
# Contexto: Crea una tabla con los datos de 3 ejemplares de tortuga capturados.
# 1. Crea tres vectores: 'id' (T1, T2, T3), 'especie' (un factor con los niveles 
#    "Mora" y "Leprosa") y 'peso_gr' (valores: 450, 520, 480).
# 2. Une los vectores en un data frame llamado 'registro_tortugas'.
# 3. Usa la función 'dim()' para confirmar que tienes 3 filas y 3 columnas.


# SOLUCIÓN
id <- c("T1", "T2", "T3")
especie <- factor(c("Mora", "Leprosa", "Mora"), levels = c("Mora", "Leprosa"))
peso_gr <- c(450, 520, 480)

registro_tortugas <- data.frame(id = id, especie = especie, peso_gr = peso_gr)
dim(registro_tortugas)

#-------------------------------------------------------------------------#

# EJERCICIO 2: Acceso, filtrado y limpieza de registros
# Contexto: Trabajando con el data frame 'registro_tortugas' del ejercicio anterior:
# 1. Accede a la columna 'peso_gr' usando el operador '$' y calcula su media.
# 2. Selecciona únicamente las filas cuya especie sea igual a "Mora".
# 3. Supón que el registro T2 tiene un peso erróneo. Cambia el peso de la 
#    fila 2, columna 3, por el valor 500.


# SOLUCIÓN
media_peso <- mean(registro_tortugas$peso_gr)
solo_mora <- registro_tortugas[registro_tortugas$especie == "Mora", ]
registro_tortugas[2, 3] <- 500

#-------------------------------------------------------------------------#

# EJERCICIO 3: Simulación de un inventario forestal masivo
# Contexto: Necesitas generar una tabla de datos simulada para una clase práctica 
# con 100 árboles de un bosque mediterráneo.
# 1. Fija la semilla en '2026'.
# 2. Crea la columna 'altura' con 100 valores aleatorios normales (media=12, sd=3).
# 3. Crea la columna 'tipo_suelo' repitiendo 50 veces "Calizo" y 50 veces "Silíceo".
# 4. Crea la columna 'estado' seleccionando aleatoriamente entre "Sano" y "Enfermo" 
#    100 veces con reemplazo.
# 5. Une todo en un data frame llamado 'bosque_simulado'.


# SOLUCIÓN
set.seed(2026)
altura <- rnorm(100, mean = 12, sd = 3)
tipo_suelo <- rep(c("Calizo", "Siliceo"), each = 50)
estado <- sample(c("Sano", "Enfermo"), size = 100, replace = TRUE)

bosque_simulado <- data.frame(altura = altura, tipo_suelo = tipo_suelo, estado = estado)
head(bosque_simulado) # Visualizar las primeras filas

#-------------------------------------------------------------------------#

# EJERCICIO 4: Análisis condicional y gestión de errores
# Contexto: Utilizando el data frame 'bosque_simulado' del ejercicio anterior:
# 1. Filtra y muestra solo los árboles que midan más de 15 metros Y estén "Sanos".
# 2. Crea una nueva columna llamada 'id_arbol' que contenga una secuencia del 1 al 100.
# 3. Por un error de sensor, todas las alturas mayores de 20 metros son erróneas. 
#    Identifica esas celdas y cámbialas por el valor NA.
# 4. Crea un nuevo data frame llamado 'bosque_final' que elimine todas las 
#    filas que ahora contienen NA.


# SOLUCIÓN
arboles_top <- bosque_simulado[bosque_simulado$altura > 15 & bosque_simulado$estado == "Sano", ]
bosque_simulado$id_arbol <- 1:100
bosque_simulado[bosque_simulado$altura > 20, "altura"] <- NA
bosque_final <- na.omit(bosque_simulado)

nrow(bosque_final) # Comprobar cuántos árboles quedan tras la limpieza

#-------------------------------------------------------------------------#

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


# EJERCICIO 1: Gestión de metadatos de un inventario
# Contexto: En ecología, a menudo guardamos los datos junto con sus metadatos.
# 1. Crea una lista llamada 'inventario' que contenga:
#    - 'fecha': "2026-02-06"
#    - 'especies': Un vector con "Lince", "Águila", "Corzo"
#    - 'conteo': Un vector con 2, 5, 12
# 2. Accede al nombre de la segunda especie ("Águila") usando el símbolo '$' 
#    para entrar en la lista y corchetes [] para la posición del vector.
# 3. Añade un cuarto elemento a la lista llamado 'responsable' con tu nombre.


# SOLUCIÓN:
inventario <- list(fecha = "2026-02-06", 
                   especies = c("Lince", "Águila", "Corzo"), 
                   conteo = c(2, 5, 12))

especie_dos <- inventario$especies[2]
inventario$responsable <- "Tu Nombre"

#-------------------------------------------------------------------------#

# EJERCICIO 2: Descomposición de códigos de anillamiento
# Contexto: Las anillas de unas aves recuperadas tienen el formato "ES.99" 
# (País.Código). Necesitas separar ambos datos.
# 1. Usa 'strsplit()' para dividir el texto "ES.99" usando el punto "." como split.
# 2. El resultado es una lista. Úsala para extraer solo el código numérico (99). 
#    Recuerda usar doble corchete [[]] para acceder al contenido y luego 
#    el índice del vector, o usar 'unlist()'.


# SOLUCIÓN
anilla_split <- strsplit("ES.99", split = ".", fixed = TRUE)

# Opción A: Accediendo directamente a la jerarquía
codigo_num <- anilla_split[[1]][2]

# Opción B: Simplificando la estructura primero
vector_anilla <- unlist(anilla_split)
codigo_num_v2 <- vector_anilla[2]


#==============================================================================#
# EJERCICIOS DE REPASO
#==============================================================================#

# EJERCICIO 1: Simulación de Gradiente Altitudinal y Respuesta Vegetal
# Contexto: Queremos estudiar cómo varía la biomasa de una planta según la altitud.
# 1. Genera un vector 'altitud' con una secuencia de 100 a 1000 metros, en intervalos de 100.
# 2. Para cada altitud, se han tomado 3 muestras. Crea un vector 'muestras_alt' que 
#    repita cada valor de altitud 3 veces (Total: 30 elementos).
# 3. Simula la 'biomasa' mediante una distribución normal con media 25 y sd 5.
# 4. Debido a un fallo del sensor, los valores de biomasa por debajo de 20 en 
#    altitudes superiores a 800 metros son erróneos. Localiza esos casos, 
#    sustitúyelos por NA y crea un dataframe final llamado 'estudio_altitud' 
#    sin esos valores perdidos.


# SOLUCIÓN
altitud <- seq(100, 1000, by = 100)
muestras_alt <- rep(altitud, each = 3)
set.seed(42) # Para reproducibilidad
biomasa <- rnorm(length(muestras_alt), mean = 25, sd = 5)
indices_error <- muestras_alt > 800 & biomasa < 20
biomasa[indices_error] <- NA
estudio_altitud <- na.omit(data.frame(altitud = muestras_alt, biomasa = biomasa))


#-------------------------------------------------------------------------#

# EJERCICIO 2: Análisis de Comunidades mediante Matrices y Coerción
# Contexto: Dispones de una matriz de abundancia de 4 especies en 3 islas.
# 1. Crea una matriz 3x4 llamada 'islas_mat' con valores aleatorios de una 
#    distribución uniforme entre 0 y 50 (usa runif y redondea con round()).
# 2. Asigna nombres a las filas ("Ibiza", "Mallorca", "Menorca") y a las 
#    columnas ("Sp_1", "Sp_2", "Sp_3", "Sp_4").
# 3. Calcula la abundancia total de la isla "Mallorca".
# 4. Transforma la matriz en un dataframe y añade una columna de tipo factor 
#    llamada 'proteccion' que asigne "Alta" a Ibiza, "Media" a Mallorca y "Baja" a Menorca.


# SOLUCIÓN
set.seed(123)
islas_mat <- matrix(round(runif(12, 0, 50)), nrow = 3, ncol = 4)
rownames(islas_mat) <- c("Ibiza", "Mallorca", "Menorca")
colnames(islas_mat) <- paste0("Sp_", 1:4)
total_mallorca <- sum(islas_mat["Mallorca", ])
islas_df <- as.data.frame(islas_mat)
islas_df$proteccion <- factor(c("Alta", "Media", "Baja"), levels = c("Baja", "Media", "Alta"))


#-------------------------------------------------------------------------#

# EJERCICIO 3: Gestión de Capturas y Re-avistamientos (Lógica y Texto)
# Contexto: Tienes un historial de códigos de captura: "Z-22", "Z-45", "X-10", "Z-22", "Y-01".
# 1. Almacena estos códigos en un vector 'capturas'.
# 2. Usa una función para identificar qué capturas son duplicadas (re-avistamientos).
# 3. Crea un nuevo vector 'unicas' que contenga solo los códigos sin repetir.
# 4. Usa 'paste()' para generar un mensaje que diga: "El inventario final incluye: ..." 
#    colapsando los códigos únicos separados por un guion " - ".


# SOLUCIÓN
capturas <- c("Z-22", "Z-45", "X-10", "Z-22", "Y-01")
reavistamientos <- duplicated(capturas)
unicas <- unique(capturas)
mensaje <- paste("El inventario final incluye:", paste(unicas, collapse = " - "))


#-------------------------------------------------------------------------#

# EJERCICIO 4: Estructura Compleja de un Proyecto de Monitorización
# Contexto: Debes organizar toda la información de una campaña de anillamiento en una lista.
# 1. Crea una lista llamada 'proyecto_aves' que contenga:
#    - Un vector 'tecnicos' con 2 nombres.
#    - Un dataframe con 5 filas y 2 columnas (ID_ave, Peso).
#    - Una matriz 2x2 con el éxito de eclosión por zona.
# 2. Accede al peso de la tercera ave registrada en el dataframe dentro de la lista.
# 3. Supón que el segundo técnico se ha jubilado; cambia su nombre por "Vacante" 
#    accediendo directamente a la posición dentro de la lista.
# 4. Usa 'strsplit()' para extraer el código de zona de un ID de muestra "ZONA_A-44" 
#    y guárdalo como un nuevo elemento de la lista llamado 'metadato_zona'.


# SOLUCIÓN
proyecto_aves <- list(
  tecnicos = c("Marta", "Jorge"),
  datos = data.frame(ID_ave = 1:5, Peso = c(12, 15, 14, 13, 16)),
  exito = matrix(c(0.8, 0.9, 0.7, 0.85), ncol = 2)
)
peso_ave3 <- proyecto_aves$datos$Peso[3]
proyecto_aves$tecnicos[2] <- "Vacante"
zona_split <- strsplit("ZONA_A-44", split = "-")
proyecto_aves$metadato_zona <- zona_split[[1]][1]


### Vectores

## ¿Qué es un vector?
# Es la estructura de datos más básica en R. Es una colección de elementos que pueden ser:
# número, texto o booleano.
# Se crean con la función c() (de "combine").
c(1, 2, 3) # Ejemplo básico sin asignar

## Asignación de vectores
edades <- c(25, 30, 18, 42) # vector con los elementos 25, 30, 18 y 42
nombres <- c("Ana", "Luis", "Pedro") # vector con los elementos "Ana", "Luis", "Pedro"
bool <- c(TRUE, FALSE, FALSE) # vector con los elementos TRUE, FALSE, FALSE

## Acceder a los elementos de un vector
# En R, las posiciones (índices) empiezan en 1.

# Por Posición:
edades[1]    # Acceder al primer elemento del vector
c(1, 3) # Vector de dos elementos: 1 y 3
edades[c(1, 3)]  # Acceder a las posiciones indicadas en el vector c(1,3): posición 1 y posición 3

# Por Booleano (Filtrado):
# Selecciona los elementos donde la condición es TRUE
edades >= 30 # Vector booleano que indica que elementos del vector cumplen la condición
edades[edades >= 30] # Filtro los elementos (por posición) que son TRUE en el vector booleano
c(10, 20, 30)[c(TRUE, FALSE, TRUE)] # Ejemplo básico

## Operaciones con vectores
# R aplica las operaciones "elemento a elemento" (vectorización).
edades + 5
edades * 2

# Funciones aplicadas a vectores numéricos
sum(edades)    # Suma total
mean(edades)   # Promedio (media)
max(edades)    # Valor máximo

# Funciones aplicadas a vectores de texto
toupper(nombres) # Convertir a mayúsculas
nchar(nombres)   # Contar letras de cada nombre

## Secuencias Rápidas
1:10            # Números del 1 al 10
seq(0, 100, 10) # De 0 a 100 de diez en diez
rep("A", 5)     # Repetir "A" cinco veces


### Dataframes

## ¿Qué es un dataframe?
# Es una tabla (como una hoja de Excel). A diferencia de los vectores,
# cada columna puede tener un tipo de dato distinto (texto, número, etc.),
# pero todas las columnas deben tener la misma longitud.

## Asignación de dataframes
df <- data.frame(
  id = 1:3,
  nombre = c("Ana", "Luis", "Pedro"),
  puntuacion = c(8.5, 9.0, 7.5)
)

## Acceder a los elementos de un dataframe
df$nombre          # Acceder a una columna por nombre (devuelve vector)
df[1, ]            # Acceder a la primera fila completa [fila, columna]
df[, 2]            # Acceder a la segunda columna completa
df[2, 3]           # Valor de la fila 2, columna 3

## Crear una nueva columna
df$pasa_examen <- c(TRUE, TRUE, FALSE)
df$doble_puntos <- df$puntuacion * 2

## Modificar un valor
df[3, 2] <- "Juan" # Cambia "Pedro" por "Juan"
df$puntuacion[1] <- 10.0

## Operaciones con dataframes
dim(df)      # Dimensiones (filas y columnas)
nrow(df)     # Número de filas
summary(df)  # Resumen estadístico de las columnas


### Matrices

## ¿Qué es una matriz?
# Es una estructura bidimensional (filas y columnas) donde TODOS los
# elementos deben ser del mismo tipo (normalmente numéricos).

## Asignación de una matriz
# Se usa la función matrix(datos, nrow, ncol)
mi_matriz <- matrix(1:9, nrow = 3, ncol = 3)
matrix(0, nrow = 2, ncol = 2) # Matriz de ceros 2x2

## Acceder a los elementos de una matriz
# Igual que en dataframes, usando [fila, columna]
mi_matriz[1, 2] # Elemento en fila 1, columna 2
mi_matriz[2, ]  # Fila 2 completa

## Modificar un valor
mi_matriz[1, 1] <- 99

## Operaciones con matrices
colSums(mi_matriz) # Suma de cada columna
rowMeans(mi_matriz) # Media de cada fila
mi_matriz * 10      # Multiplicación escalar





### Vectores
## Conjunto de datos
# Una colección de elementos que tienen que ser del mismo tipo (todos números o todos texto). Ej. Una columna de excel
## Asignación de vectores
a <- c(10,20,30,40,50) # Crear un vector a con elementos numéricos
b <- c("Juan","Pedro","Elena") # Crear un vector b con elementos de tipo texto
d <- c("Juan", 20, 45, "Elena") # Crear un vector d con elementos de tipo texto
e <- c(TRUE, FALSE, FALSE, FALSE, TRUE) # Crear un vector e con elementos de tipo booleano
# RECOMENDACIÓN. No uséis c como nombre de variable, ya que es posibles que se altere el funcionamiento de R
# c <- c(1,2,3,4) # NO RECOMENDADO!

## Acceder a elementos de un vector
a[1] # Acceder al primer elemento del vector a
a[3] # Acceder al tercer elemento del vector a
a[c(2,4)] # Acceder al segundo y cuarto elemento del vector a
b <- c(2,4) # Crear un vector b con los valores 2 y 4
a[b] # Acceder a las posiciones que establece el vector b en el vector a
a[e] # Acceder a las posiciones en las que el vector booleano e es TRUE del vector a
a == 40 # Crea un vector que evalua en que posiciones a es igual a 40
a[a == 40] # Filtra dicho vector
b[b == "Pedro"] # Hacer mismo filtro con vector de texto

## Operaciones y funciones
length(a) # la función length devuelve el número de elementos del vector
names(a) # la función names devuelve los nombres del vector
names(a) <- c("a","b","c","d","f") # Asigno nombres a los elementos del vector
names(a) # Ahora si tiene nombres
a # Ahora el vector tiene etiquetas (names)
a["a"] # Como acceder a los elementos según sus etiquetas - manteniendo el nombre
a[["a"]] # Como acceder a los elementos según sus etiquetas - eliminando el nombre


# Operaciones con vectores numéricos
a <- c(10, 20, 30, 40, 50)
a*2 # Multiplicar cada elemento del vector a por 2
b <- c(11,22,33,44,55) # Crear un vector b
a + b # Sumar los vectores a y b elemento por elemento
mean(a) # aplicar la función mean() al vector. calcula estadísticas al conjunto
log(a) # aplicar la función log() al vector. calcula un valor por cada elemento

# Operaciones con vectores de texto
a <- c("Juan", "María", "Luis") # Crear un vector de nombres
b <- c("Pérez", "Gómez", "Rodríguez") # Crear un vector de apellidos
nombres_completos <- paste(a, b) # Concatenar los vectores de
nombres_completos


## Secuencias rápidas
# El operador : crea una secuencia de números del inicio al fin
numeros <- c(1,2,3,4,5,6,7,8,9,10) # Crea un vector del 1 al 10 IMPORTANTE: No usar tildes, ñ, espacios ni caracteres especiales en los nombres de variables
numeros
numeros <- 1:10 # Usando los dos puntos (:), creamos un vector numérico desde el primer número hasta el último
numeros
cuenta_atras <- 10:1 # También funciona en sentido inverso
cuenta_atras

a <- c("A", "B", "C", "D", "E") # Muy util para acceder a rangos de un vector
a[1:3] # Acceder de la posición 1 a la 3

### Data Frames
## Tablas de Información
# Paciente Peso Altura
# A1 85 175
# A2 70 165

## Como se crean
# Crear un data frame con nombres, edades y ciudades data.frame(Nombre_columna = vector_de_valores, Nombre_columna = vector_de_valores)
df <- data.frame(
  Nombre = c("Ana", "Luis", "Marta", "Jorge", "Sofía"), # columna Nombre
  Edad = c(28, 34, 23, 45, 30), # Columna Edad
  Ciudad = c("Madrid", "Barcelona", "Valencia", "Sevilla", "Bilbao") # Columna Ciudad
)
df

## Acceder a los elementos de un data.frame
# [,] a la izquierda de la coma se hace referencia a las filas, a la derecha a las columnas
df[1, 2] # Acceder a la celda de la fila 1 y la columna 2
df[, 2] # Acceder a todas las filas de la columna 2 -> devuelve un vector
df[1, ] # Acceder a todas las columnas de la fila 1 -> devuelve un data.frame
df[c(1,2),] # Acceder a todas las columnas de las filas 1 y 2
df[,c(2,3)] # Acceder a todas las filas de las columnas 2 y 3
df[c(1,2), c(2,3)] # Acceder a las filas 1 y 2 de las columnas 2 y 3

df$Nombre
df[,"Nombre"] # Acceder a todas las filas de la columna "Nombre"
df[,c("Nombre","Edad")] # Acceder a todas las filas de la columna "Nombre" y "Edad"

df$Edad > 30 # Evaluar que elementos de la columna Edad son mayores de 30
df[df$Edad > 30, ] # Acceder a las filas cuyo valor "Edad" sea mayor de 30, mostrando todas las columnas
df[df$Edad > 30, -2] # Acceder a las filas cuyo valor "Edad" sea mayor de 30, mostrando todas las columnas menos la 2 (Edad)

## Crear Nuevas Columnas
df$Telefono <- c("123456789", "987654321", "456123789", "789456123", "321654987") # Agregar una nueva columna Teléfono al data frame
df

## Modificar un valor
df[df$Nombre == "Jorge", "Telefono"] <- "99999999" # Las celdas cuyo Nombre sea Jorge, modifcan su valor de teléfono a 9999999
df

## Funciones útiles en un data.frame
dim(df) # filas y columnas
colnames(df) # Nombre de las columnas
rownames(df) # nombre de las filas
head(df) # Muestra las primeras filas (previsualizar)
tail(df) # Muestra las últimas filas

### Matrices
# Como un vector, pero organizado en dos dimensiones (filas y columnas). Al igual que los vectores, todos sus elementos deben ser del mismo tipo.
## Como crearlas. 2 Métodos
# Método 1
data <- data.frame(col1 = c(1,2,3), col2 = c(4,5,6)) # Crear un data frame de ejemplo para crear una matriz
data 
m <- as.matrix(data) # Crear una matriz a partir de un data frame usando la función as.matrix
m

# Método 2
m <- matrix(1:6, nrow = 3, ncol = 2)
m

## Acceder a los elementos
# Similar a los data.frames
m[,2] # columna 2
m[3,] # fila 3
m[3, 2] # fila 3, columna 2
m[c(1,2), 2] # filas 1 y 2, columna 2

## Operaciones con matrices
m * 2 # multplica todos los valores por 2
m + m + m # suma 3 veces los valores
log(m) # calcula el log a todos los elementos
mean(m) # calcula la media global
t(m) # Calcular la transpuesta de la matriz m. Convertir columnas en filas y filas en columnas


### Factores y Listas
# Son variables de texto que representan categorías fijas (niveles). Útiles para clasificar datos, como "Pequeño/Mediano/Grande".
grupos <- c("Control", "Tratamiento", "Control", "Tratamiento")
grupos_factor <- factor(grupos) # Función factor
grupos_factor # Fíjate en los "Levels" (Niveles)

grupos_factor <- factor(grupos, levels = c("Tramiento","Control")) # establecer el orden de los factores
grupos_factor

levels(grupos_factor) # Muestra las categorías únicas

## Listas (El contenedor universal)
# El "cajón de sastre". Puede contener objetos de cualquier tipo y tamaño: un número, un vector y un dataframe, todo dentro de la misma lista.
mi_lista <- list(
  id_muestra = "S001",
  mediciones = c(1.2, 3.4, 5.6),
  es_valido = TRUE,
  datos_tabla = df[1:2, ] # Podemos meter hasta un trozo de Data Frame
)
mi_lista
mi_lista$id_muestra  # Acceder por nombre (igual que en Data Frames)
mi_lista[[2]]        # Acceder por posición (doble corchete para sacar el contenido)



################################################################################
#              EJERCICIOS DE R: VECTORES, DATA FRAMES Y MATRICES               #
################################################################################

# Aprox. 10 min

### --- BLOQUE 1: VECTORES Y ASIGNACIÓN --- ###

# 1. Crea un vector llamado 'v_num' con los valores: 5, 10, 15, 20, 25.
# 2. Crea un vector llamado 'v_log' con 5 valores booleanos (TRUE o FALSE).
# 3. Accede a las posiciones del vector 'v_num' donde 'v_log' sea TRUE.
# 4. Asigna nombres a los elementos de 'v_num' usando las letras: "V1", "V2", "V3", "V4", "V5".
# 5. Accede al valor de "V3" usando el doble corchete [[ ]].


### --- BLOQUE 2: OPERACIONES Y FILTRADO DE VECTORES --- ###

# 6. Crea un vector 'x' del 1 al 5 y un vector 'y' del 6 al 10. Súmalos.
# 7. Calcula la media (mean) y el logaritmo (log) del vector 'v_num'.
# 8. Crea un vector 'nombres' con "Ana", "Beto" y un vector 'apellidos' con "Sanz", "Gari".
#    Usa paste() para unirlos en 'completos'.
# 9. Del vector 'v_num', filtra y muestra solo los valores que sean exactamente iguales a 15.


### --- BLOQUE 3: DATA FRAMES (TABLAS DE INFORMACIÓN) --- ###

# 10. Crea un Data Frame llamado 'pacientes' con:
#     - ID: una secuencia del 1 al 4.
#     - Sexo: "H", "M", "M", "H".
#     - Presion: 120, 110, 130, 125.
# 11. Accede a la celda de la fila 2, columna 3.
# 12. Muestra todas las columnas de la fila 4.
# 13. Muestra las columnas "ID" y "Presion" para todas las filas.
# 14. Filtra el Data Frame para mostrar solo los pacientes con Presion > 120.
# 15. Crea una nueva columna llamada 'Observaciones' con el texto "Estable" para todos.
# 16. Modifica la presión del paciente cuyo Sexo es "H" y su ID es 1 a un valor de 115.


### --- BLOQUE 4: MATRICES --- ###

# 17. Crea una matriz llamada 'matriz_uno' usando matrix() con los números del 1 al 6, 
#     organizados en 2 filas y 3 columnas.
# 18. Accede a todas las filas de la columna 2.
# 19. Calcula la transpuesta (t) de 'matriz_uno'.
# 20. Multiplica toda la matriz por 10 y calcula la media (mean) de todos sus elementos.


### --- BLOQUE 5: FACTORES Y LISTAS --- ###

# 21. Crea un vector 'clima' con: "Frio", "Calor", "Frio", "Templado".
# 22. Conviértelo en un factor y muestra sus niveles (levels).
# 23. Crea una lista llamada 'mi_analisis' que contenga:
#     - El vector 'v_num'.
#     - El Data Frame 'pacientes'.
#     - Un valor lógico: TRUE.
# 24. Accede al Data Frame dentro de la lista usando el nombre de la posición con $.
# 25. Accede al primer elemento de la lista usando la posición con [[ ]].


### --- EJERCICIO DE REPASO FINAL --- ###

# 26. Crea una secuencia del 100 al 110 usando el operador :.
# 27. Usa dim() y colnames() para inspeccionar el Data Frame 'pacientes'.
# 28. Extrae las 2 últimas filas de 'pacientes' usando la función tail().

################################################################################


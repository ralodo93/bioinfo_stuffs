#### Datos Estructurales ####
# Son formas de organizar los datos atómicos en estructuras más complejas

### Vectores ###
# Conjunto de datos (mismo tipo) de una dimensión.
# Se asignan con c(), separando los elementos con coma
c(10, 20) # Vector de dos elementos numéricos: 10 y 20
# Se pueden asignar a variables
vector_numeros <- c(10, 20)

# Pueden ser de cualquiera de los tipos de datos atómicos (siempre de un mismo tipo) y de la longitud que queramos
c(20, 4, 8.3, -5, -8.54) # Vector numérico de 5 elementos
c("Hola", "Hello", "Bonjour") # Vector de texto de 3 elementos
c(TRUE, FALSE, TRUE, TRUE) # Vector booleano de 4 elementos
c(TRUE, "HOLA", 125) # Si el vector tiene más de un dato de tipo dferente, se convierten a texto

# Podemos crear un vector concatenando otros vectores
c(vector_numeros, -10, -20)

# en ocasiones querremos crear un vector vacío
vector_vacio <- c()

# podemos rellenarlo
vector_vacio <- c(vector_vacio, 10, 30)

# MINIRETO: Crea un vector con los elementos: 4, 8, 20 y -9 y guárdalo en la variable: vector_numeros

## Operaciones ##
# Al igual que vimos con los datos atómicos, podemos aplicar operaciones directamente a los elementos de un vector
# Tanto operaciones matemáticas
c(4, -5, 8) * 10 # Multiplica cada elemento por 10
# Como operaciones lógicas
c("Hola", "Hello", "Bonjour") == "Hola" # Evalúa si cada elemento es igual a "Hola"
# Usamos el operador %in% para determinar si un valor está en un vector
"uva" %in% c("manzana", "fresa", "platano")

# MINIRETO: Usa el vector que hemos creado antes (vector_numeros) y evaúa que elementos son mayores de 0

## Crear vectores automáticos ##

# Por secuencia #
1:10 # se usa el operador : para crear un vector de 1 a 10 (de 1 en 1)
-10:1 # crea un vector de -10 a 1 (de 1 en 1)
seq(1, 10, 2) # crea un vector numérico de 1 a 10 (de 2 en 2)

# Por repetición #
rep("Hola", times = 5) # Crea un vector de texto con 5 elementos "Hola"
rep(c("Hola", "Hello"), times = 5) # Crea un vector de 5 repeticiones de los elementos "Hola" y "Hello" (10 elementos)
rep(c("Hola", "Hello"), each = 3) # Crea un vector repitiendo cada elemento 3 veces

# Vectores aleatorios #
set.seed(12345) # se usa para fijar semilla de aleatoriedad
runif(1) # Genera un número aleatorio de 0 a 1
runif(5) # Genera un vector de 5 números entre 0 y 1
runif(5, min = -1, max = 1) # Genera un vector de 5 números entre -1 y 1

rnorm(10) # Genera un vector de 10 números aleatorios que siguen una distribución normal con media = 0 y desviación estándar = 1
rnorm(10, mean = 10, sd = 2) # Genera un vector de 10 números aleatorios que siguen una distribución normal con media = 10 y desviación estándar = 2

sample(1:10, size = 1) # Genera un elemento aleatorio a partir del vector de entrada
sample(c("Hola", "Hello", "Bonjour"), size = 2) # Genera un vecto de 2 elementos aleatorios a partir del vector de entrada
sample(c("Hola", "Hello", "Bonjour"), size = 4, replace = TRUE) # Genera un vecto de 4 elementos aleatorios (con reemplazo) a partir del vector de entrada

# Todos estos nuevos vectores se pueden guardar en una variable
vector_rnorm <- rnorm(10)

# MINIRETO: Crea un vector de 3 elementos aleatorios (con reemplazo) del vector 'vector_numeros'

## Funciones asociadas a vectores ##
length(vector_numeros) # indica el número de elementos de un vector
names(vector_numeros) # muestra los nombres de los vectores, por defecto es NULL porque no existen
names(vector_numeros) <- c("num1", "num2", "num3", "num4", "num5") # Esto da error... sabrías decir por qué?
names(vector_numeros) <- c("num1", "num2", "num3") # Esto no da error... pero no es del todo correcto
vector_numeros # ¿por qué?
names(vector_numeros) <- c("num1", "num2", "num3", "num4") # Esto si es correcto
vector_numeros # mostrar vector completo
names(vector_numeros) # mostrar solo nombres de los elementos
paste("Mi número favorito es el", vector_numeros) # la función paste se ejecuta elemento a elemento
paste(vector_numeros, collapse =", ") # para colapsar todos lo elementos de un vector en un texto usamos collapse y el separador que queramos
paste("Mis números favoritos son", paste(vector_numeros, collapse = ", ")) # de este modo podemos jugar con diferentes paste para generar un texto complejo
# eliminar NAs de un vector
vector_con_NA <- c(10, NA, 15, 25, 8)
na.omit(vector_con_NA) # elimina los NA de un vector
# determinar elementos repetidos en un vector
mi_vector_repetido <- c(rep("Hola", 4), "Hello")
duplicated(mi_vector_repetido) # la primera vez que se encuentra un elemento repetido es FALSE, a partir de la segunda es TRUE
unique(mi_vector_repetido) # devuelve los elementos únicos de un vector

# MINIRETO: Hemos visto que insertar los nombres de los vectores de forma manual puede llevarnos a errores simples.
# ¿Sabrías como hacerlo de forma que no importase el número de elementos?. Pista: Usa paste, : y length


# SOLUCIÓN:
names(vector_numeros) <- paste("num",1:length(vector_numeros), sep = "")
vector_numeros

## Operaciones con vectores ##
# Operaciones con vectores numéricos #
# Se utilizan para obtener información acerca de los valores de un vector: media, mediana, producto etc
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


## Acceso a Elementos ##
# Podemos acceder a las posiciones de un vector de dos formas: posiciones y booleanos

# Posiciones #
# Definimos que posiciones queremos obtener entre corchetes [posición o posiciones]
vector_numeros[2] # Posición 2 del vector
vector_numeros[c(1, 3)] # Posiciones 1 y 3 del vector
vector_numeros[c(1, 6)] # Posiciones 1 y 6 del vector, como el la longitud del vector es 4, la posición 6 es un NA

# Booleanos #
# Definimos que elementos del vector queremos obtener en base a unas condiciones, también usando corchetes
vector_numeros[vector_numeros > 0] # aplicamos la operación dentro del vector, llamando al propio vector | los numeros que sean mayores de 0

# MINIRETO: Usando el vector c(10, 50, 20, 30, 80), crea una variable vector_minireto y determina: 
# 1) los elementos de las posiciones 1, 3 y 4. 
# 2) los elementos que sean menores o iguales a 30

## Reasignar valores de un vector ##
# De igual modo que accedemos a los elementos de un vector, podemos reasignar sus valores siguiendo esta estructura
vector_numeros[3] <- 8 # ahora la posición 3 del vector pasa a ser 8
vector_numeros[vector_numeros == 8] <- 10 # ahora modificamos los elementos que sean igual a 8 por 10


## Factores ##
# Aunque técnicamente un factor es un tipo de dato atómico, se explica mucho mejor tras haber estudiado los vectores
# hacen referencia a las diferentes categorías que tiene un vector. Se definen con la función factor()
factor(c("Hombre", "Mujer", "Mujer", "Hombre"))

# MINIRETO: Crea un factor con las preferencias de clima: "Calor", "Frío", "Calor", "Templado"
vector_climas <- sample(c("Calor", "Frío", "Calor", "Templado"), 15, replace = TRUE)

## Niveles ##
# Los niveles (levels) definen las categorías únicas y su orden.
factor(c("Hombre", "Mujer", "Mujer", "Hombre")) # Por defecto los niveles se establecen por orden alfanumérico
factor(c("Hombre", "Mujer", "Mujer", "Hombre"), levels = c("Mujer", "Hombre")) # Pero podemos modificar el orden usando el parámetro levels

# MINIRETO: Usa el factor de climas anterior estableciendo el orden que prefieras

### Matrices ###
# Estructuras bidimensionales (filas y columnas) donde todos los datos son del mismo tipo.
# Se crean con matrix(), indicando los datos y el número de filas (nrow) o columnas (ncol).
matrix(1:9, ncol = 3) # crea un vector de 1 a 9; se le indican 3 columnas, asi que rellena la matriz por columna
matrix(c("Hola", "Bonjour", "Hello", "Ciao"), ncol = 2)

# generalmente las almacenamos en variables
mi_matriz <- matrix(1:9, ncol = 3)

# ver la matriz
View(mi_matriz)

# MINIRETO: Crea una matriz de 2 filas y 3 columnas que contenga los números del 1 al 6. Guárdala en una variable llamada 'minireto_matriz'

## Operaciones ##
# Se pueden realizar operaciones elemento a elemento (como en los vectores).
matrix(1:4, nrow = 2) * 10
matrix(1:4, nrow = 2) + 5

# También se aplican todas las funciones de operaciones que los vectores, pero se hacen para la matriz completa
mean(mi_matriz) # media de todos los valores

# MINIRETO: Crea una matriz de 2x2 con los números 10, 20, 30, 40 y divídela toda entre 2

## Acceso a Elementos ##

# Posiciones #
# Se accede usando corchetes y la sintaxis [fila, columna]
mi_matriz[1, 2] # Elemento en fila 1, columna 2
mi_matriz[1, ]  # Toda la fila 1
mi_matriz[, 3]  # Toda la columna 3
mi_matriz[, 4] # ERROR: No hay cuarta columna: subscript out of bounds

# Booleanos #
# Filtrar elementos que cumplen una condición
mi_matriz[mi_matriz > 5]

# También podemos reasignar valores
mi_matriz[1,2] <- 8 # la celda 1, 2
mi_matriz[,2] <- 7 # todos los valores de la columna 2
mi_matriz[mi_matriz > 5] <- 10 # todos los valores mayores de 5

# MINIRETO: De una matriz de 3x3 con números del 1 al 9, extrae solo la segunda columna.


## Funciones con matrices ##
ncol(mi_matriz) # número de columnas
nrow(mi_matriz) # número de filas
dim(mi_matriz) # número de filas y columnas
colnames(mi_matriz) # nombre de las columnas (igual que los names() de los vectores)
colnames(mi_matriz) <- paste("Col",seq(1:ncol(mi_matriz)), sep = ".")
mi_matriz
rownames(mi_matriz) # lo mismo

# MINIRETO:
# Cambia los rownames de 'mi_matriz'


### DataFrames ###
# Estructura principal de R para datos tabulares. 
# A diferencia de las matrices, cada columna puede tener un tipo de dato distinto.
data.frame(nombre = c("Luis", "Sara"), edad = c(30, 20))
nombres <- c("Luis", "Sara")
edades <- c(30, 20)
data.frame(nombre = nombres, edad = edades)
df <- data.frame(nombre = c("Luis", "Sara"), edad = c(30, 20)) # en general, aunque df no es un nombre muy bueno, se usa para dataframe
# igualmente, podéis poner los nombres que consideréis oportuno

# ver el dataframe
View(df)

# MINIRETO: Crea un DataFrame llamado "tienda" con una columna "producto" (manzana, pera) y otra "precio" (1.5, 2.0)

## Acceso a Elementos ##

# Posiciones #
# Igual que en las matrices: [fila, columna]
df[1, 2] # Fila 1, columna 2

# Columnas a Vector #
# Usamos el operador $ para extraer una columna completa como vector
df$nombre
df$edad

# Nombres de elementos #
# Podemos usar los nombres de las columnas entre corchetes
df[, "nombre"]
df[,c("nombre","edad")]

# Booleanos #
# Filtrar filas basadas en condiciones de una columna
df[df$edad > 25, ] # Filas donde la edad es mayor a 25

# Podemos modificar elementos de un dataframe
df[1, 2] <- 31

# MINIRETO: Del DataFrame "tienda" creado antes, extrae solo la columna de precios usando el símbolo $

## Funciones con dataframes ##
ncol(df) # número de columnas
nrow(df) # número de filas
dim(df) # número de filas y columnas
colnames(df) # nombre de las columnas (igual que los names() de los vectores), en este caso si suelen tener nombres
colnames(df) <- paste("Col",seq(1:ncol(df)), sep = ".")
mi_matriz
rownames(df) # lo mismo, en este caso es un vector de character de 1 a nrow

# MINIRETO:
# Cambia los rownames de 'tienda'


### Listas ###
# El objeto más flexible: puede contener vectores, matrices, DataFrames o incluso otras listas.
# Cada elemento puede tener un tamaño y tipo diferente.
list(num = 546, vector = c(1,2,5), df = data.frame(nombre = c("Luis", "Sara"), edad = c(30, 20)))
lista <- list(num = 546, vector = c(1,2,5), df = data.frame(nombre = c("Luis", "Sara"), edad = c(30, 20)))

# MINIRETO: Crea una lista que contenga tu nombre (texto) y un vector con tus 3 números de la suerte.

## Acceso a Elementos ##
# Posiciones #
# Usamos dobles corchetes [[]] para extraer el contenido de una posición
lista[[2]] # Extrae el vector de la segunda posición

# Nombres de elementos #
# Si tienen nombre, usamos el operador $
lista$vector
lista$df$nombre # Acceder a una columna de un dataframe dentro de una lista

# También podemos acceder usando el nombre de los elementos entre dobles corchetes [[]]
list(num = 546, vector = c(1,2,5), df = data.frame(nombre = c("Luis", "Sara"), edad = c(30, 20)))[["vector"]]

# MINIRETO: De la lista creada en el minireto anterior, accede a tu nombre usando el operador $

## Funciones que devuelven una lista ##
# Cuando vimos las operaciones que se aplicaban a texto, no vimos una de las más importantes porque el resultado es una lista
# se trata de la función strsplit()
strsplit("Hola Mundo", split = " ") # separa el texto usando " "; devuelve una lista de un elemento, con un vector de tantos elementos como trozos haya
strsplit(vector_climas, split = "al")
strsplit(vector_climas, split = "al")[[4]] # acceder a un elemento concreto


#### EJERCICIOS COMPLEMENTARIOS: DATOS ESTRUCTURALES ####

# Ejercicio 1: Gestión de inventario con vectores
# Crea un vector llamado 'stock' con las cantidades de 5 productos: 15, 42, 8, 100 y 24.
# Asigna nombres a cada elemento del vector (p. ej., "p1", "p2", etc.) de forma 
# automática utilizando las funciones paste() y length(). 
# Finalmente, calcula cuántos productos tienen un stock superior a 20 unidades.

# Ejercicio 2: Simulación de temperaturas (Vectores automáticos)
# Genera un vector llamado 'temperaturas' que contenga 30 valores aleatorios 
# siguiendo una distribución normal con una media de 22 grados y una desviación 
# estándar de 3. Fija la semilla en 123 antes de generarlo.
# Sustituye todos los valores que sean mayores de 25 por el valor exacto 25.
# ¿Cuál es la temperatura media final del vector?

# Ejercicio 3: Control de calidad (Matrices)
# Crea una matriz de 4 filas y 3 columnas llamada 'controles' con números aleatorios 
# entre 0 y 1 usando runif(). Cada fila representa un lote y cada columna un test.
# Asigna el nombre "Test.1", "Test.2" y "Test.3" a las columnas.
# Extrae en un nuevo vector todos los valores del "Test.2" que sean menores a 0.5.

# Ejercicio 4: Registro de pacientes (DataFrames)
# Crea un DataFrame llamado 'clinica' con tres columnas: 
# 1) 'paciente': 4 nombres a tu elección.
# 2) 'edad': usa una secuencia de 20 a 50 de 10 en 10.
# 3) 'alta': un vector booleano con 2 TRUE y 2 FALSE (alternados).
# Muestra por pantalla solo las filas de los pacientes que tengan más de 35 años.

# Ejercicio 5: Categorización de servicios (Factores)
# Imagina que tienes un vector con el tipo de suscripción de 10 clientes: 
# "Básico", "Premium", "Básico", "Gold", "Gold", "Básico", "Premium", "Gold", "Básico", "Premium".
# Conviértelo en un factor y asegúrate de que los niveles (levels) sigan 
# estrictamente este orden de importancia: "Básico", "Premium", "Gold".

# Ejercicio 6: Informe consolidado (Listas)
# Crea una lista llamada 'informe_mensual' que contenga tres elementos:
# 1) El vector 'temperaturas' del ejercicio 2.
# 2) El DataFrame 'clinica' del ejercicio 4.
# 3) Un resumen (summary) del vector 'stock' del ejercicio 1.
# Accede, utilizando el operador $, a la columna 'paciente' del DataFrame que 
# se encuentra dentro de la lista.

#### SOLUCIONES: DATOS ESTRUCTURALES ####

# Solución Ejercicio 1
stock <- c(15, 42, 8, 100, 24)
names(stock) <- paste("p", 1:length(stock), sep = "")
sum(stock > 20)


# Solución Ejercicio 2
set.seed(123)
temperaturas <- rnorm(30, mean = 22, sd = 3)
temperaturas[temperaturas > 25] <- 25
mean(temperaturas)


# Solución Ejercicio 3
controles <- matrix(runif(12), nrow = 4)
colnames(controles) <- paste("Test", 1:3, sep = ".")
test2 <- controles[, "Test.2"]
test2[test2 < 0.5]


# Solución Ejercicio 4
clinica <- data.frame(
  paciente = c("Ana", "Pedro", "Lucía", "Tomás"),
  edad = seq(20, 50, 10),
  alta = rep(c(TRUE, FALSE), times = 2)
)
clinica[clinica$edad > 35, ]


# Solución Ejercicio 5
suscripciones <- c("Básico", "Premium", "Básico", "Gold", "Gold", "Básico", "Premium", "Gold", "Básico", "Premium")
factor_suscripciones <- factor(suscripciones, levels = c("Básico", "Premium", "Gold"))


# Solución Ejercicio 6
informe_mensual <- list(
  temps = temperaturas,
  datos_clinica = clinica,
  resumen_stock = summary(stock)
)
informe_mensual$datos_clinica$paciente
### ¿Qué es una función?

# Una función es un bloque de código que se utiliza de forma repetitiva a partir de una serie de argumentos o inputs. 
# De forma muy general hay dos tipos de funciones: funciones prediseñadas y funciones creadas por nosotros.

# Cada función tiene un objetivo diferente. Habrá una función para calcular una media y habrá funciones que ejecuten 
# bloques de códigos de miles de líneas.

# Antes de crear nuestras propias funciones, vamos a aprender a usar algunas de las funciones prediseñadas en R para 
# aplicar a nuestros datos

## Ayuda

# De entre las funciones prediseñadas, habrá algunas que se utilicen valores numéricos, o en strings.
# Las habrá que se puedan usar en vectores y datos atómicos, o solo en alguno de ellos. 
# También hay funciones específicas de dataframes.
# Sin embargo, lo más importante que tenemos que tener en cuenta antes de usar una función es la ayuda
# Para acceder a la ayuda de una función usamos la siguiente estructura: nombre_funcion?

?mean # se abre la ayuda de la función mean. 
?matrix # se abre la ayuda de la función matrix

#### Funciones base

# Encontramos dos tipos de funciones según su uso. Por un lado tenemos las funciones vectorizadas, que se aplican a cada elementos de un vector o matriz, 
# y las funciones de agregación, que colapsan los elementos del vector en un valor único.

# La función sqrt(), que se utiliza para calcular la raíz cuadrada de un número o un vector de números 
# es una función vectorizada. Calcula la raíz cuadrada de cada elemento

sqrt(10) # calcula la raíz cuadrada de 10
sqrt(c(10, 20)) # calcula la raíz cuadrada de 10 y 20

# La función mean(), que se utiliza para calcular la media de un vector de números es una función de agregación. 
# Devuelve solo un valor.
mean(c(10, 20)) # Devuelve la media de 10 y 20

# Para usar una función, utilizamos el nombre la función (mismas reglas que con los nombres de variables)
# junto a sus argumentos entre paréntesis
?mean
mean(x = c(10, 20)) # asignamos el argumento x
mean(c(10, 20)) # si no se indica, se cogen por orden

?log # función para calcular logaritmos
log(10) # el argumento base por defecto es exp(1) - número natural
log(10, base = 5) # si queremos cambiar la base, modificamos el argumento
log(10, 5) # si conocemos muy bien la función podemos aplicar los argumentos en su orden

# El aspecto fundamental de utilizar funciones es poder asignar los valores resultantes a variables
log_10 <- log10(86)

# Funciones anidadas. Podemos utilizar una función dentro de otra:
# Calcula el log10 de la raíz cuadrada de 144
log10(sqrt(144)) # primero ejecuta sqrt(144) y el resultado lo utiliza para aplicar log10

#### Funciones base

# Divididas en: aplicadas a vectores, aplicadas a matrices / dataframes, aplicadas a números, aplicadas a texto y conversión de datos

### Aplicadas a vectores

vector_numeros <- c(50, 10, 20, 30, 30)
vector_texto <- c("Hola","Mundo",NA)

## length() -> length(vector) -> devuelve la longitud del vector
length(vector_numeros)

## is.na() -> is.na(vector) -> devuelve un vector lógico indicando las posiciones que tienen un NA
is.na(vector_texto)

## na.omit() -> na.omit(vector) -> devuelve el vector original eliminando los NA
na.omit(vector_texto)

## unique() -> unique(vector) -> devuelve un vector con los elementos únicos de un vector
unique(vector_numeros)

## sort() -> sort(vector, decreasing = FALSE) -> ordena un vector de menor a mayor (POR DEFECTO)
sort(vector_numeros) # menor a mayor
sort(vector_numeros, decreasing = TRUE) # mayor a menor

## rank() -> rank(vector, ties.method = "average") -> genera un vector con la posición de los valores de otro vector de menor a mayor
# En caso de empate aplica el ties.method = average (media)
rank(vector_numeros)
rank(vector_numeros, ties.method = "first") # en caso de empate coge el primero

## rev() -> rev(vector) -> invierte el orden de un vector
rev(vector_texto)

## rep() -> rep(atómico o vector, times) -> crea elementos repetidos tantas veces como se indique (times)
rep(5, times = 10)
rep(vector_numeros, 2)

## sample() -> sample(vector, size, replace = FALSE) -> crea un vector de tamaño "size" eligiendo al azar valores del vector de entrada
# Si replace = FALSE los valores que se van obteniendo se van eliminando
# Si replace = TRUE los valores que se van obteniendo pueden volver a obtenerse
sample(1:10, size = 1) # un valor al azar
sample(1:10, size = 8) # un vector de 8 valores al azar, sin reemplazo
sample(1:10, size = 8, replace = TRUE) # un vector de 8 valores al azar, con reemplazo

sample(c("manzana","pera","platano"), size = 1) # también se puede usar para vectores de texto o booleanos

## runif() -> runif(n, min = 0, max = 1) -> genera un vector de tamaño 'n' con valores entre 'min' y 'max'
runif(1) # un valor entre 0 y 1
runif(5) # 5 valores entre 0 y 1
runif(5, min = 0, max = 2) # 5 valores entre 0 y 2

## paste() -> paste(vector o conjunto de elementos, collapse = NULL, sep = " ")
paste("Mi número es", mi_numero) # funcionalidad general, sep = " "
paste("Mi número es", mi_numero, "que dividido entre 4 es", mi_numero/4) # funcionalidad general, sep = " "

paste("Mi número es", mi_numero, sep = "-") # ahora en vez de usar espacios usa "-"
paste("Mi número es", mi_numero, sep = "") # ahora en vez de usar espacios usa ""

# alternativa paste0() -> es un paste() que usa sep = ""
paste0("Mi número es", mi_numero)

# Uso en vectores
paste("Mi número es", vector_numeros) # se aplica a cada elemento del vector

# Collapsar un vector
paste(vector_numeros, collapse = ", ") # usando el argumento collapse indicamos como queremos colapsar los elementos del vector
paste("Mis números son", paste(vector_numeros, collapse = ", ")) # como se usaría de forma inteligente

## names() -> names(vector o lista) -> se utiliza para obtener los nombres de los elementos de un vector
vector_numeros <- c(1,2,3,4)
names(vector_numeros) # es nulo, no se han asignado
names(vector_numeros) <- c("uno", "dos", "tres", "cuatro")
vector_numeros # ahora si tienen nombres asociados
names(vector_numeros)
vector_numeros[["dos"]] # podemos acceder a los elementos del vector o la lista usando su nombre

# MiniReto: crea una variable precio_frutas con un vector numérico de 5 elementos. Truco: usa secuencias rápidas
# Asigna nombres de 5 frutas a los elementos
# Selecciona un valor aleatorio de dicho vector, guárdalo en una variable llamada precio_aleatorio
# Muestra el siguiente mensaje: "El precio de la fruta [nombre fruta] es [precio fruta]

### Aplicadas a matrices / dataframes

## is.na() -> is.na(matriz) -> devuelve un vector lógico indicando las posiciones que tienen un NA
matriz_numeros_na <- matriz_numeros
matriz_numeros_na[1,2] <- NA
matriz_numeros_na
is.na(matriz_numeros_na)

## na.omit() -> na.omit(matriz) -> devuelve  original eliminando las filas que contienen algún NA
na.omit(matriz_numeros_na)

# ncol(), nrow() -> ncol(matriz o dataframe) -> devuelve el número de columnas (ncol) o filas (nrow) de una matriz o dataframe
ncol(matriz_numeros)
nrow(matriz_numeros)

# dim() -> dim(matriz o dataframe) -> devuelve un vector de dos elementos c(número de filas, número de columnas)
dim(matriz_numeros)

## head(), tail() -> head(matriz o dataframe, n = 6) -> muestra las primeras (head) o últimas (tail) "n" filas de una matriz o dataframe
head(matriz_numeros) # las primeras 6 filas (por defecto)
tail(matriz_numeros, n = 2) # las últimas 2 filas

# colnames(), rownames() -> colnames(matriz o dataframe) -> devuelve el nombre de las filas (rownames) o columnas (colnames) de una matriz o dataframe
personas <- data.frame(nombre = c("Juan", "Elena"), edad = c(30, 35))
colnames(personas)

# los rownames no se suelen usar en los casos más básicos, sin embargo en bioinformática se usan a menudo

## rnorm() -> rnorm(n, mean = 0, sd = 1) -> genera un vector de n elementos aleatorios que siguen una distribución normal de mean y sd asignados
rnorm(10) # 10 elementos aleatorios que siguen distribución media = 0 y desviacion estandar = 1

matriz_expresion <- matrix(rnorm(1000), ncol = 10) # matriz de 100 filas y 10 columnas

# colnames de la matriz
paste("Paciente",1:ncol(matriz_expresion),sep="_")
colnames(matriz_expresion) <- paste("Paciente", 1:ncol(matriz_expresion), sep="_")
colnames(matriz_expresion)

# rownames de la matriz
paste("Gen", 1:nrow(matriz_expresion),sep="_")
rownames(matriz_expresion) <- paste("Gen", 1:nrow(matriz_expresion),sep="_")
rownames(matriz_expresion)
head(matriz_expresion)

#### Funciones aplicadas a números

### Funciones vectorizadas
mi_numero <- 12
vector_numeros <- c(-8, 10, 8.2, 8.9, 7.456, NA)
matriz_numeros <- matrix(1:9, nrow = 3, ncol = 3)

## sqrt() -> sqrt(numero o vector de numeros) -> calcula la raíz cuadrada
sqrt(mi_numero)
sqrt(vector_numeros)
sqrt(matriz_numeros)

## exp() -> exp(numero o vector de números) -> calcula el exponencial
exp(mi_numero)
exp(vector_numeros)
exp(matriz_numeros)

## log() -> log(numero o vector de numeros, base = exp(1)) -> calcula el logaritmo natural (por defecto)
log(mi_numero)
log(vector_numeros)
log(matriz_numeros)

log(mi_numero, base = 10) # base 10
log(vector_numeros, base = 10) # base 10
log(matriz_numeros, base = 10) # base 10

## alternativas: log10 (calcula el log en base 10) o log2 (calcula el logaritmo en base 2)
log2(mi_numero)
log10(vector_numeros)

## abs() -> abs(numero o vector de numeros) -> devuelve el valor absoluto
abs(mi_numero)
abs(vector_numeros)

## round() -> round(numero o vector de numeros, digits = 0) -> redondea a dígitos indicados
round(mi_numero)
round(vector_numeros) # a cero dígitos decimales (por defecto)

round(vector_numeros, digits = 1) # a un dígito decimal

## ceiling() -> ceiling(numero o vector numérico) -> trunca un número hasta el entero superior (techo)
ceiling(vector_numeros) # el 8.2 lo transforma en 9

## floor() -> floor(numero o vector numérico) -> trunca el número hasta el entero inferior (suelo)
floor(vector_numeros) # el 8.9 lo transforma en 8

## sign() -> sign(numero o vector numérico) -> devuelve 1 o -1 dependiendo de si el número es positivo o negativo
sign(vector_numeros)

## MiniReto: Calcula el valor redondeado (3 cifras) del valor absoluto del siguiente vector. Después ordénalo de mayor a menor
vector_numeros <- c(-8.654653, 10.46434, 9.46465464, -4.46546768)

### Funciones Agregadas

## seq() -> seq(from, to, by = 1) -> genera un vector numérico desde "from" hasta "to" de "by" en "by
seq(1, 10) # vector de 1 a 10 de 1 en 1
seq(-10, 20, 5) # vector de -10 a 20 de 5 en 5

## mean() -> mean(numero o vector de números, na.rm = FALSE) -> calcula la media sin eliminar NA
mean(vector_numeros) # por defecto no elimina el NA, para que lo haga usamos su argumento na.rm
mean(vector_numeros, na.rm = TRUE) # ahora si lo elimina y calcula la media
mean(matriz_numeros) # devuelve la media de todos los valores de la matriz

## median() -> median(numero o vector de números, na.rm = FALSE) -> calcula la mediana sin eliminar NA
median(vector_numeros, na.rm = TRUE)
median(matriz_numeros)

## sum() -> sum(numero o vector de números, na.rm = FALSE) -> suma todos los elementos sin eliminar NA
sum(vector_numeros, na.rm = TRUE)
sum(matriz_numeros)

## max() y min() -> max(numero o vector de números, na.rm = FALSE) -> devuelve el valor máximo; min devuelve el mínimo
max(vector_numeros, na.rm = TRUE)
min(vector_numeros, na.rm = TRUE)
max(matriz_numeros)

## sd() -> sd(numero o vector de números, na.rm = FALSE) -> calcula la desviación estandar sin eliminar NA
sd(vector_numeros, na.rm = TRUE)
sd(matriz_numeros)

## range() -> range(numero o vector de números, na.rm = FALSE) -> devuelve el valor mínimo y máximo sin eliminar NA
range(vector_numeros, na.rm = TRUE) # en este caso devuelve un vector (valor_minimo, valor_maximo)
range(matriz_numeros)

## colMeans(), rowMeans(), colSums(), rowSums() -> colMeans(matriz de números) -> devuelve 
# la media de cada fila (rowMeans)
# la media de cada columna (colMeans)
# la suma de cada fila (rowSums)
# la suma de cada columna (colSums)
# de una matriz de números
rowMeans(matriz_numeros) # media de cada fila
colSums(matriz_numeros) # suma de cada columna
# !ATENCIÓN -> También tienen parámetro na.rm = FALSE

# MiniReto: Crea un dataframe con las siguientes columnas (media, mediana y sd), que calcule dichos valores para este vector
set.seed(12354) # fijamos una semilla de aleatoriedad para obtener todos el mismo resultado
valores <- rnorm(125)

#### Funciones aplicadas a texto
texto <- "Hola Mundo"
vector_texto <- c("Hola Mundo", "Hello World", "Bonjour Monde")
texto_mal <- c(" Juan ", "      María", "Luís")

### Funciones vectorizadas

## nchar() -> nchar(texto o vector de texto) -> devuelve el número de caracteres (incluye espacios)
nchar(texto)
nchar(vector_texto)

## toupper() / tolower() -> toupper(texto o vector de texto) -> devuelve el texto en mayúsculas (minúsculas si es tolower)
toupper(texto)
tolower(vector_texto)

## trimws() -> trimws(texto o vector de texto) -> devuelve el texto eliminando espacios antes y después
trimws(texto_mal)

## substring() -> substring(texto o vector de texto, start, last = 1000000L) -> extrae partes de una cadena de texto en base a la posición
substring(texto, 1, 3) # coge los primeros 3 caracteres (start = 1, last = 3) del texto
substring(vector_texto, 2, 5) # coge los caracteres de la posicion 2 hasta la 5
substring(texto, 3) # coge los caracteres de la posicion 2 hasta el final

## gsub() -> gsub(patron, reemplazo, texto o vector de texto) -> reemplaza el patrón (si existe) por el reemplazo en el texto
gsub("Hola", "Hello", texto) # Sustituye "Hola" por "Hello"
gsub("Hola", "Hello", vector_texto)

## grepl() -> grepl(patrón, reemplazo, texto o vector de texto) -> busca si existe un patrón en un texto, devolviendo TRUE o FALSE
grepl("Hola", texto)
grepl("Hello", vector_texto)

## strsplit() -> strsplit(texto o vector de texto, split) -> divide el texto según un patrón (por ejemplo un espacio). IMPORTANTE! Devuelve una lista
strsplit(texto, split = " ") # devuelve una lista con 1 elemento: un vector de elementos
strsplit(vector_texto, split = " ") # devuelve una lista de 3 elementos

# Para acceder a los elementos, simplemente usamos lo que ya sabemos de acceso a elementos de una lista
lista_vectores <- strsplit(vector_texto, split = " ") 
lista_vectores[[1]]

# MiniReto: limpia el siguiente vector, transformalo todo a minúsculas y sustituye "enero" por "Enero"
dias <- c("    10 de Enero", "11 de enero", "12 de ENERO     ")


### Funciones de conversión

## as.numeric() -> as.numeric(texto o vector de textos) -> convierte texto en número
as.numeric(c("100", "200"))
as.numeric(c(TRUE, FALSE, TRUE)) # 1 es TRUE, 0 es FALSE

factor(c("plátanos", "limones")) # crea un factor de dos categorías 
as.numeric(factor(c("plátanos", "limones"))) # asigna a cada factor un número 

## as.character() -> as.character(atomic o vector) -> convierte cualquier cosa a texto
as.character(vector_numeros)

## as.factor(), factor() -> as.factor(vector) -> convierte a factor
genero <- c("M","F","F","F","M")
as.factor(genero) # no permite determinar niveles, los convierte por orden alfabético
factor(genero, levels = c("M", "F")) # podemos determinar el orden de los factores


#################################################################
# EJERCICIOS DE REFUERZO: FUNCIONES BASE
#################################################################

# --- 1. FUNCIONES NUMÉRICAS Y ESTADÍSTICAS ---

# Reto A: Crea un vector llamado "puntuaciones" con los valores: 15, 20, NA, 35, 40, 12.
# 1. Calcula la media de las puntuaciones ignorando el valor NA.
# 2. Calcula la desviación estándar (sd), ignorando NA
# 3. Redondea el resultado de la desviación estándar a 2 decimales usando la función round().


# Reto B: Genera un vector de 50 números aleatorios que sigan una distribución normal 
# (media 100 y desviación estándar 15). 
# 1. Guárdalo en la variable "coeficientes".
# 2. Encuentra el valor máximo y el valor mínimo de ese vector.
# 3. ¿En qué posición (índice) se encuentra el valor máximo? (Pista: usa ?which.max)


# --- 2. FUNCIONES DE TEXTO Y LIMPIEZA ---

# Reto A: Tienes el siguiente vector de códigos de inventario:
codigos <- c("  prod_01  ", "PROD_02", "  prod_03")

# 1. Elimina los espacios en blanco sobrantes con trimws().
# 2. Convierte todos los códigos a MAYÚSCULAS.
# 3. Sustituye el guion bajo "_" por un guion medio "-" usando gsub().
# 4. Cuenta cuántos caracteres tiene cada código final con nchar().


# Reto B: Usa la función paste0() para crear una lista de correos electrónicos.
# Tienes el vector: nombres <- c("juan", "elena", "pablo")
# 1. Crea el vector "correos" que sea: "juan@empresa.com", "elena@empresa.com", etc.
# 2. Al final, colapsa todos los correos en una sola cadena de texto separada por "; ".


# --- 3. MATRICES Y OPERACIONES POR MARGEN ---

# Reto A: Crea una matriz de 4x4 con los números del 1 al 16 llamada "mi_matriz".
# 1. Calcula la suma de cada columna usando colSums().
# 2. Calcula la media de cada fila usando rowMeans().
# 3. Extrae la diagonal de la matriz (Pista: busca la función ?diag).


# --- 4. CONVERSIÓN DE DATOS (COERCIÓN) ---

# Reto A: Imagina que has importado datos y los números han llegado como texto:
precios_sucios <- c("10.5", "20.3", "15.0")

# 1. Convierte el vector a numérico usando as.numeric().
# 2. Calcula el precio total (suma).
# 3. Convierte el resultado de la suma a texto y pégale el símbolo "€" al final usando paste().


# Reto B: Tienes un vector de respuestas: respuestas <- c("S", "N", "S", "S", "N")
# 1. Conviértelo en un Factor usando as.factor().
# 2. Muestra los niveles (levels) de ese factor.


# --- 5. FUNCIONES ANIDADAS Y MUESTRAS ---

# Reto A: ¡Simulacro de sorteo!
# 1. Crea un vector "participantes" con los nombres de 5 amigos.
# 2. Usa sample() para elegir a uno solo al azar.
# 3. Convierte el nombre del ganador a MAYÚSCULAS y muéstralo junto al mensaje: 
# "EL GANADOR ES: [NOMBRE]" (Pista: anida toupper dentro de paste).


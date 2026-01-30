#### Funciones ####




### Concepto ###
# Una función es un bloque de código que se utiliza para procesar una serie de datos de forma definida
# Aunque podemos crear nuestras propias funciones (y las crearemos), en primer lugar vamos a ver como se usan
# Y algunas de las funciones más útiles que podemos utilizar en R.

## Usar funciones ##
# Estructura básica #
# Para usar una función simplemente debemos poner su nombre y entre paréntesis los argumentos de dicha función
# nombre_funcion(argumentos)
exp(20) # La función exp calcula el exponencial del número que se le indique

# Acceso a la ayuda de una función #
# Si queremos acceder a la ayuda de una función, ponemos un símbolo ? antes del nombre de la función
# ?nombre_funcion
?exp

# MINIRETO: Acceder a la ayuda de la función sum, adivina para que sirve y usa uno de los ejemplos




# SOLUCIÓN:
?sum
sum(1:5)

## Argumentos ##
# Los argumentos de una función hacen referencia a los datos de entrada que tiene dicha función.
# En el ejemplo de la función exp() vimos que el único argumento de entrada era un argumento x
# que además es un número o vector numérico
?exp

# Sin embargo, las funciones suelen ser más complejas con respecto a los argumentos.
?log # log() tiene como argumentos: x (vector o número) y base (vector o número, positivos)
# De ambos argumentos, el argumento base tiene por defecto el valor exp(1)
# Esto quiere decir que, siempre que no se diga lo contrario, por defecto va a usar este valor
# El otro argumento, x, como no tiene valor por defecto, siempre se requiere
log(10) # logaritmo en base exp(1) de 10
log(10, base = 2) # logaritmo en base 2 de 10

# Argumentos por nombre de argumento #
# Los argumentos de las funciones pueden utilizarse asignando al nombre de dicho argumento un valor
# Siempre, sobretodo al principio, con funciones complejas etc es recomendable usar los nombres de los argumentos
# para tener un control más seguro de como funciona la función
log(x = 10, base = 2)
exp(x = 5)

# Argumentos por orden #
# Cuando controlamos mucho una función podemos ahorrarnos algo de código añadiendo los argumentos en el orden en el que están dispuestos
# En el caso de la función log(), el primer argumento es x y el segundo es base, por lo que podemos escribir directamente
log(10, 2)

# Os recomiendo solo hacer esto en los casos en los que controleis la función perfectamente y siempre que la función sea simple como ésta

# MINIRETO: Pide ayuda sobre la función round(), analiza para que sirve, 
# sus argumentos y úsala con el número 5.6467864468746 (tanto por defecto como con 3 dígitos)
# ¿Podrías usar esta función sin definir los argumentos?




# SOLUCIÓN
?round
# Sirve para redondear valores al número de decimales especificado.
numero_largo <- 5.6467864468746
round(numero_largo)            # Por defecto (0 dígitos) -> 6
round(numero_largo, digits = 3) # Con 3 dígitos -> 5.647

# ¿Podrías usar esta función sin definir los argumentos?
round(numero_largo, 3) # Sí, por orden: el primero es 'x' y el segundo es 'digits'


## Funciones Anidadas ##
# Podemos utilizar una función dentro de otra. Siempre se ejecutan de dentro a fuera
# Calcula el log(10, 2); redondea el resultado
round(x = log(10, 2), digits = 3) # primero se aplica el logaritmo (función de dentro) y al resultado se le aplica la función round()




### Funciones Útiles ###
# A continuación vamos a analizar de forma muy superficial algunas de las funciones más útiles que podemos encontrar en R
# Están divididas en cuatro bloques, 
# 1. funciones vectorizadas, son aquellas cuya entrada es un elemento único o una estructura y devuelve un resultado del mismo tamaño. 
# 2. funciones de agregación, son aquellas que a partir de un elemento único o una estructura genera un resultado de distinto tamaño (ya sea mayor o menor). 
# 3. funciones de conversión de datos, se utilizan para forzar a un objeto a cambiar de tipo de dato
# 4. funciones de creación, permiten generar secuencias de datos o datos aleatorios desde cero

# Ejemplo de función vectorizada
log(10)
log(c(10, 20, 30))

# Ejemplo de función agregación
mean(c(4, 8, 9, 10)) # calcula la media de un vector
length(c(4, 8, 9, 10)) # devuelve el tamaño de un vector

# Ejemplo de función de conversión
matrix(1:9, nrow = 3, ncol = 3) # Tranforma un vector numérico en una matriz
factor(c("Hombre", "Mujer")) # Transforma un vector de texto en un factor

# Ejemplo de función de creación
seq(1, 10, 3) # ya sabemos lo que hace!
runif(10) # genera un vector de 10 números aleatorios entre 0 y 1

## Funciones Vectorizadas ##

# Aplicadas a números #
mi_numero <- 10.58
mi_vector <- c(10.214, -20.258)
mi_matriz <- matrix(c(10.541, -20.354, -30.5, 40.2147), ncol = 2, nrow = 2)

# raíz cuadrada -> sqrt(x)
sqrt(mi_numero) 
sqrt(mi_vector)
sqrt(mi_matriz)

# valor absoluto -> abs(x)
abs(mi_numero)
abs(mi_vector)
abs(mi_matriz)

# exponencial -> exp(x)
exp(mi_numero)
exp(mi_vector)
exp(mi_matriz)

# logaritmo -> log(x, base = exp(1))
log(mi_numero)
log(mi_vector)
log(mi_matriz)

# logaritmos especiales: las funciones log10() y log2() aplican directamente el logaritmo en base 10 y 2 respectivamente
log2(mi_numero)
log10(mi_matriz)

# redondear al número decimal (o entero) que se indique -> round(x, digits = 0)
round(mi_numero, digits = 0)
round(mi_matriz, digits = 2)

# Redondean al entero superior/inferior -> ceiling(x) / floor(x)
ceiling(mi_numero) # ejemplo de uso: no se pueden reservar 4.75 mesas en un restaurante, para que quepan todos deben reservarse 5
floor(mi_matriz) # ejemplo de uso: no se pueden dividir 19 juguetes entre 4 niños, se les da 4 a cada uno y sobra uno

# Determinar si un valor es positivo o negativo -> sign(x); devuelve 1 si es positivo y -1 si es negativo
sign(mi_vector)

# MINIRETO: Redondea a 3 dígítos el resultado de la raíz cuadrada del valor absoluto del siguiente vector
set.seed(123456789) # Veremos esta función más adelante
mi_vector <- runif(10, min = -5, max = 5) # Veremos esta función más adelante, solo la uso para crear un vector
# Escribe la solución aquí:




# SOLUCIÓN
# Pasos: 1. calcular el absoluto, 2. calcular la raíz cuadrada, 3. redondear
paso1 <- abs(mi_vector)
paso2 <- sqrt(paso1)
round(paso2, 3)

# Todo junto - Recuerda lo que hablamos de las funciones anidadas
round(sqrt(abs(mi_vector)), 3)



# Aplicadas a texto #
mi_texto <- "Hola Mundo"
mi_vector <- c("Hola Mundo", "Hello World", "Bonjour Monde")
mi_matriz <- matrix(c("Hola Mundo", "Hello World", "Bonjour Monde", "Ciao Mondo"), ncol = 2, nrow = 2)

# Número de caracteres (incluyendo espacios) -> nchar(x)
nchar(mi_texto)
nchar(mi_vector)
nchar(mi_matriz)

# Transformar en mayúsculas / minúsculas -> toupper(x) / tolower(x)
toupper(mi_vector)
tolower(mi_matriz)

# Corregir textos con espacios incorrectos -> trimws(x)
text_mal <- "   Juan      "
trimws(text_mal)

# Extraer partes de un texto -> substring(x, first, last = Inf)
substring(mi_texto, first = 1, last = 5) # extrae texto desde la posición 1 hasta la posición 5
substring(mi_vector, first = 3, last = 6) # extrae texto desde la posición 3 hasta la posición 5
substring(mi_matriz, first = 4) # extrae texto desde la posición 4 hasta el final

# Sustituir un patrón por otro en un texto -> gsub(pattern, replacement, x)
gsub("Hola", "Hello", mi_texto) # Sustituye Hola por Hello
gsub("Hola", "Hello", mi_vector) # Si Hola no está, no hace nada

# Comprobar si existe un patrón en un texto -> grepl(patter, x) -> devuelve TRUE o FALSE
grepl("Hola", mi_texto) # Comprueba si Hola está en el texto
grepl("Hola", mi_matriz) # Si no existe, devuelve FALSE


# Divide un texto según un patrón -> strsplit(x, split) -> OJO! Devuelve una lista
strsplit(mi_texto, " ") # devuelve una lista de 1 elemento (un vector)
strsplit(mi_vector, " ") # devuelve una lista de 3 elementos (tres vectores)
strsplit(mi_matriz, " ") # devuelve una lista de 4 elementos (cuatro vectores)
strsplit(mi_texto, "o") # el split puede ser cualquier caracter

# para acceder a cualquiera de los elementos, usamos la técnica de acceder a los elemento de una lista
strsplit(mi_vector, " ")[[2]] # acceder al segundo vector

# MINIRETO: limpia el siguiente vector, transformalo todo a minúsculas y sustituye "enero" por "Enero"
dias <- c("    10 de Enero", "11 de enero", "12 de ENERO     ")
# Escribe la solución aquí:



# SOLUCIÓN
# Pasos: 1. Limpiar espacios, 2. Todo a minúsculas, 3. Sustituir enero por Enero
dias_limpios <- trimws(dias)
dias_minuscula <- tolower(dias_limpios)
gsub("enero", "Enero", dias_minuscula)

# Todo junto - Recuerda lo que hablamos de las funciones anidadas
gsub("enero", "Enero", tolower(trimws(dias)))



# Aplicadas a cualquier vector #
# pegar elementos* -> paste(x, sep = " ") / paste0(x) -> se utiliza para añadir texto (o números) a otros elementos
paste("Mi saludo preferido es", mi_texto) # por defecto sep es " "
paste("Mi saludo preferido es", mi_vector)
paste("Mi saludo preferido es", mi_matriz) # OJO -> rompe la estructura de matriz y lo convierte a vector

paste("Mi saludo preferido es", mi_texto, sep = ":") # podemos usar otro separador
paste("Mi saludo preferido es", mi_vector, sep = "") # o no usar ningún separador
paste0("Mi saludo preferido es", mi_texto) # paste0() es igual a usar paste(sep = "")

mi_vector <- c(10, 20, 30)
paste("Mi número preferido es", mi_vector) # También se puede aplicar a números

# MINIRETO: Usa paste para escribir el siguiente texto usando estas variables
# Texto Final: Mi documento [nombre_documento] está en la carpeta /home/usuario/[carpeta], por tanto su ruta es /home/usuario/[carpeta]/[nombre_documento]
home <- "home"
usuario <- "usuario"
nombre_documento <- c("log.txt", "calidad.xlsx")
carpeta <- c("errores", "controles")
# Truco: crea una variable llamada localización y otra ruta_final que una las variables para crear la ruta completa, después únelo todo



## SOLUCIÓN ##
localizacion <- paste(home, usuario, carpeta, sep = "/")
ruta_final <- paste(localizacion, nombre_documento, sep = "/")
paste("Mi documento", nombre_documento, "está en la carpeta", localizacion, ", por tanto su ruta es", ruta_final)

# Más fino aún
parte2 <- paste0(localizacion, ", por tanto su ruta es ", ruta_final)
paste("Mi documento", nombre_documento, "está en la carpeta", parte2)


# determinar si un valor es NA -> is.na(x) -> devuelve TRUE o FALSE
mi_vector_na <- c(5, NA, 8, 10)
mi_matriz_na <- matrix(mi_vector_na, ncol = 2, nrow = 2)
is.na(mi_vector_na) # devuelve vector de TRUE y FALSE
is.na(mi_matriz_na) # devuelve matriz NA

# eliminar NA de un objeto -> na.omit(x) -> elimina los elementos con NA
na.omit(mi_vector_na) # devuelve el vector sin NA
na.omit(mi_matriz_na) # Elimina las FILAS donde haya un NA

# determinar si un elemento está repetido -> devuelve TRUE o FALSE
mi_vector_repetido <- c(rep("Hola", 4), "Hello")
duplicated(mi_vector_repetido) # la primera vez que se encuentra un elemento repetido es FALSE, a partir de la segunda es TRUE

# MINIRETO: Usando el vector 'datos_sucios', determina cuales de ellos son NA, después crea un nuevo vector eliminando los NA
datos_sucios <- c(1, 2, NA, 4, 2, 1, NA, 10)

# SOLUCIÓN
is.na(datos_sucios)
na.omit(datos_sucios)


## Funciones de Agregación ##
# Son funciones que se usan para conocer la naturaleza de un objeto

# General #

# estrutura interna de una variable -> str(x)
str(8)
str("Hola Mundo")
str(c("Hola","Mundo"))
str(matrix(1:9, ncol = 3, nrow = 3))
str(c(TRUE, FALSE))

# tipo de dato de una variable -> class(x)
class(8)
class("Hola Mundo")
class(c("Hola","Mundo"))
class(matrix(1:9, ncol = 3, nrow = 3))
class(c(TRUE, FALSE))

# Aplicadas a vectores, factores y listas #
mi_vector <- c(1:10, 10, 10, 20)
mi_factor <- factor(mi_vector)
mi_lista <- list(mi_vector, mi_factor)

# tamaño de un vector / lista -> length(x)
length(mi_vector)
length(mi_lista)

# niveles de un factor -> levels(x)
levels(mi_factor)

# valores únicos de un vector -> unique(x)
unique(mi_vector)

# nombres de un vector / lista -> names(x)
# por defecto un vector o una lista no tiene nombres asociados -> NULL
names(mi_vector)

# pero podemos asignarlos usando names(x) <- vector de nombres
vector_de_nombres <- paste("Name", 1:length(mi_vector))
vector_de_nombres
names(mi_vector) <- vector_de_nombres # asignamos el vector de nombres a los nombres de un vector (atributo interno)
mi_vector # ahora tenemos los valores y los nombres
names(mi_vector) # podemos acceder solo a los nombres

# también funciona para listas
vector_de_nombres <- paste("Name", 1:length(mi_lista))
vector_de_nombres
names(mi_lista) <- vector_de_nombres # asignamos el vector de nombres a los nombres de una lista (atributo interno)
mi_lista # ahora tenemos los valores y los nombres
names(mi_lista) # podemos acceder solo a los nombres

# MINIRETO: Identificación de duplicados ##
# Objetivo: Del siguiente vector, obtén un vector que contenga solo los valores ÚNICOS
# pero que estén en MAYÚSCULAS.
frutas <- c("manzana", "pera", "Manzana", "NARANJA", "pera", "manzana")



# SOLUCIÓN
unique(toupper(frutas))



# Aplicadas a matrices y dataframes #

# dimensiones de una matriz/dataframe | número de filas | número de columnas -> dim(x), ncol(x), nrow(x)
dim(mi_matriz) # filas columnas
ncol(mi_matriz)
nrow(mi_matriz)

# previsualizar un matriz / dataframe -> head(x, n = 6) / tail(x, n = 6)
mi_matriz_gigante <- matrix(1:20, ncol = 2, nrow = 10)
head(mi_matriz_gigante) # por defecto las 6 primeras
tail(mi_matriz_gigante) # por defecto las 6 últimas

# nombres de filas y columnas -> colnames(x) / rownames(x)
# funciona de forma similar a los names de los vectores y las listas
colnames(mi_matriz_gigante) # es NULL
rownames(mi_matriz_gigante) # es NULL
colnames(mi_matriz_gigante) <- c("Columna 1", "Columna 2")
head(mi_matriz_gigante)
colnames(mi_matriz_gigante)

# Igual con los rownames, también exactamente igual con los data.frames

# MINIRETO: Utilizando la matriz siguiente: modificar los nombres de las columnas a los puntos cardinales y ver las últimas 8 filas de la matriz
mi_matriz <- matrix(1:40, ncol = 4, nrow = 10)




# SOLUCIÓN
colnames(mi_matriz) <- c("Norte", "Sur", "Este", "Oeste")
tail(mi_matriz, 8)


# Aplicadas a números #
# En esta sección se mostrarán funciones que nos informarán acerca de la naturaleza de un vector o una matriz de números
set.seed(123456789) # Veremos esta función más adelante
mi_vector <- runif(10, min = -5, max = 5) # Veremos esta función más adelante, solo la uso para crear un vector
mi_matriz <- matrix(mi_vector, ncol = 2, nrow = 5)

# media, mediana, mínimo, máximo, desviación estándar, suma total, rango, varianza, cuartiles, producto
# -> mean(x), median(x), min(x), max(x), sd(x), sum(x), range(x), var(x), quantile(x), prod(x)
# todas devuelven un valor salvo range, que devuelve 2 (mínimo y máximo)
mean(mi_vector) # media de un vector de números
mean(mi_matriz) # media de una matriz de números
range(mi_matriz) # valores mínimo y máximo (rango) de una matriz de números

# CUIDADO! Estas funciones tienen un peligro, uno de sus parámetros es na.rm, que por defecto es FALSE
?mean
# Esto implica que cuando en un vector hay un NA (valor faltante), la función no lo elimina, por lo que al hacer la operación
# el resultado es un NA
mean(c(45, NA, 8)) # Devuelve NA
max(c(45, NA, 8)) # Devuelve NA

# Si queremos que no tenga en cuenta los NA, debemos asegurarnos que na.rm sea TRUE
mean(c(45, NA, 8), na.rm = TRUE) # ahora si elimina el NA
max(c(45, NA, 8), na.rm = TRUE) # ahora si elimina el NA
# Mi consejo es que siempre uséis na.rm = TRUE

# MINIRETO: Calcula la mediana, el valor mínimo, el máximo, la desviación estándar, la suma total, la varianza, el producto y los cuartiles de "mi_vector"



# SOLUCIÓN
# Mediana, Mínimo, Máximo, SD, Suma, Varianza, Producto y Cuartiles
median(mi_vector)
min(mi_vector)
max(mi_vector)
sd(mi_vector)
sum(mi_vector)
var(mi_vector)
prod(mi_vector)
quantile(mi_vector)


# MINIRETO: La función quantile() devuelve solo los cuartiles (0, 25, 50, 75 y 100). 
# Podrías buscar en la ayuda y ver como podría obtener el percentil 90?



# SOLUCIÓN
# Usando el argumento 'probs'
quantile(mi_vector, probs = 0.90)

# EXTRA: La función sum() también puede usarse para contar los casos que son TRUE de un vector
sum(c(TRUE, FALSE, TRUE, TRUE, TRUE)) # Devuelve el número de TRUE que hay


# media y suma por filas o columnas (solo para matrices) -> colMeans(x), colSums(x), rowMeans(x), rowSums(x)
colMeans(mi_matriz) # devuelve el valor medio de cada columna
rowSums(mi_matriz) # devuelve el valor total de cada fila

# CUIDADO! A estas funciones también afecta el problema con los NAs, la solución es la misma
mi_matriz_na <- mi_matriz
mi_matriz_na[1, 2] <- NA
rowSums(mi_matriz_na) # devuelve NA
rowSums(mi_matriz_na, na.rm = TRUE) # Ahora si

# MINIRETO: Aplica las funciones rowMeans y colSums a 'mi_matriz'


# SOLUCIÓN
rowMeans(mi_matriz)
colSums(mi_matriz)

# Aplicadas a texto #

# *Colapsar vectores -> paste(x, collapse)
# Por defecto paste() actúa como una función vectorizada, aplicando la función a cada elemento de un vector
# Sin embargo, esto se debe a que por defecto el argumento collapse es NULL. Si nosotros modificamos este argumento
# podemos cambiar el funcionamiento de paste() para que actúa como agregador
mi_vector <- c("Hola Mundo", "Hello World", "Bonjour Monde")
paste("Mi saludo favorito es", mi_vector)

paste(mi_vector, collapse = ", ") # une todos los elementos de un vector mediante ", "
paste("Mis saludos favoritos son:", paste(mi_vector, collapse = ", "))

# MINIRETO: Modifica el comando anterior para que el resultado sea:
# Mis saludos favoritos son: Hola Mundo, Hello World y Bonjour Monde



# SOLUCIÓN
parte_inicial <- paste(mi_vector[1:2], collapse = ", ")
paste("Mis saludos favoritos son:", parte_inicial, "y", mi_vector[3])


## Funciones de Conversión ##
# Estas funciones se utilizan para forzar a un objeto a cambiar su tipo de dato (coerción)
# Suelen empezar por "as.". Suelen funcionar de forma vectorizada, pero las estudiaremos aparte

mi_numero_texto <- "100.5"
mi_vector_numerico <- c(1, 0, 1, 1, 0)
mi_factor_niveles <- factor(c("Bajo", "Medio", "Alto"))

# Convertir a numérico -> as.numeric(x)
as.numeric(mi_numero_texto)
as.numeric(mi_factor_niveles) # OJO: devuelve los códigos internos (1, 2, 3), no el texto

# Convertir a texto -> as.character(x)
as.character(1234)
as.character(mi_factor_niveles) # elimina factor

# Convertir a factor -> as.factor(x) / factor(x) -> la diferencia es que factor nos permite establecer los niveles (levels)
as.factor(c("A", "B", "A")) # por defecto el orden es alfanumérico
factor(c("A", "B", "A"), levels = c("B", "A")) # definimos el orden de los niveles

# Convertir a valor lógico -> as.logical(x)
# En R, 0 es FALSE y cualquier otro número es TRUE
as.logical(mi_vector_numerico)

# Convertir estructuras -> as.matrix(x), as.data.frame(x), as.list(x)
mi_df <- data.frame(id = 1:2, valor = c("A", "B"))
as.matrix(mi_df) # Convierte el dataframe en matriz (cuidado con los tipos mezclados)

# MINIRETO: Convierte el vector 'precios' a numérico, calcula su media y luego 
# transforma el resultado en un texto que diga "La media es: [valor]"
precios <- c("10.5", "20.3", "15.2")

# SOLUCIÓN
precios_num <- as.numeric(precios)
media_precios <- mean(precios_num)
paste("La media es:", as.character(media_precios))


## Funciones de Creación ##
# Estas funciones permiten generar secuencias de datos o datos aleatorios desde cero

# Secuencias regulares -> seq(from, to, by, length.out)
seq(from = 1, to = 10, by = 2)     # De 1 a 10 de dos en dos
seq(from = 0, to = 1, length.out = 5) # Crea 5 números equiespaciados entre 0 y 1

# Repetición de elementos -> rep(x, times, each)
rep(1:3, times = 3) # Repite el bloque completo 3 veces
rep(1:3, each = 3)  # Repite cada elemento 3 veces

# Generación de datos aleatorios (Distribuciones) #
# Para que los resultados sean reproducibles, usamos set.seed()
set.seed(123)

# Números aleatorios uniformes (entre un min y un max) -> runif(n, min, max) -> por defecto min = 0 y max = 1
runif(n = 5, min = 0, max = 100)

# Números aleatorios normales (campana de Gauss) -> rnorm(n, mean, sd) -> por defecto mean = 0 y sd = 1
rnorm(n = 10, mean = 0, sd = 1)

# Muestreo aleatorio de elementos -> sample(x, size, replace = FALSE) -> crea un vector de tamaño "size" eligiendo al azar valores del vector de entrada
# Si replace = FALSE los valores que se van obteniendo se van eliminando
# Si replace = TRUE los valores que se van obteniendo pueden volver a obtenerse
sample(1:10, size = 1) # un valor al azar
sample(1:10, size = 8) # un vector de 8 valores al azar, sin reemplazo
sample(1:10, size = 8, replace = TRUE) # un vector de 8 valores al azar, con reemplazo

# MINIRETO: Crea una "baraja" de cartas del 1 al 10 para 4 palos (Oros, Copas, Espadas, Bastos)
# combinando rep() y seq(). Luego, simula un "robo" de 3 cartas al azar sin que se puedan repetir.

# SOLUCIÓN
numeros <- rep(1:10, times = 4)
palos <- rep(c("Oros", "Copas", "Espadas", "Bastos"), each = 10)
baraja <- paste(numeros, "de", palos)
sample(baraja, size = 3)


#### EJERCICIOS COMPLEMENTARIOS: FUNCIONES EN R ####

# Ejercicio 1: Cálculos Geométricos Básicos
# Contexto: Estamos calculando dimensiones de parcelas circulares para un estudio forestal.
# 1. Crea una variable llamada 'radio' con el valor 7.5.
# 2. Calcula el área del círculo (Pi * radio^2). Nota: Puedes usar 3.141593 o una variable intera: pi.
# 3. Redondea el resultado a solo 1 decimal usando la función correspondiente.
# 4. Accede a la ayuda de la función 'abs' para confirmar cómo trataría un radio negativo si lo hubiera.



# Ejercicio 2: Procesamiento de Identificadores de Usuario
# Contexto: Has recibido una lista de códigos de empleados que vienen con espacios innecesarios y formatos mezclados.
# vector_empleados <- c("  emp-01  ", "EMP-02", "  emp-03", "EMP-04  ")
# 1. Limpia los espacios en blanco a los lados de los nombres.
# 2. Convierte todos los códigos a mayúsculas para que sean homogéneos.
# 3. Extrae solo los números de los códigos (pista: los números empiezan en la posición 5).



# Ejercicio 3: Análisis de un Inventario de Almacén
# Contexto: Tienes un vector con el stock de 5 productos, pero faltan algunos datos (NA).
# stock <- c(15, 8, NA, 24, 12)
# 1. Comprueba mediante una función lógica cuáles de estos elementos son NA.
# 2. Calcula la suma total del stock disponible (ignorando los NA).
# 3. Calcula la media del stock y redondea el resultado al número entero superior (hacia arriba).
# 4. Crea un nuevo vector llamado 'stock_limpio' que elimine los registros con NA.



# Ejercicio 4: Generación de Etiquetas de Productos
# Contexto: Necesitas crear etiquetas automáticas para una base de datos.
# 1. Crea un vector llamado 'categorias' que repita "Categoría A" y "Categoría B" 3 veces cada una (total 6 elementos).
# 2. Crea una secuencia del 101 al 106 para que sirvan como IDs de producto.
# 3. Une ambos vectores para que el resultado sea: "ID-101: Categoría A", "ID-102: Categoría A", etc. 
#    Usa el separador adecuado dentro de la función paste.



# Ejercicio 5: Control de Calidad en Producción
# Contexto: Se han medido los pesos de 20 piezas en una línea de montaje.
# 1. Genera 20 números aleatorios siguiendo una distribución normal con media 50 y desviación estándar 2 (usa set.seed(123) antes).
# 2. Organiza estos datos en una matriz de 10 filas y 2 columnas llamada 'control_pesos'.
# 3. Asigna nombres a las columnas: "Mañana" y "Tarde".
# 4. Calcula la media de peso para la jornada de "Mañana" y para la de "Tarde" por separado usando una función de agregación específica para matrices.
# 5. Muestra por pantalla solo las primeras 3 filas de la matriz para verificar el formato.



# Ejercicio 6: Simulador de Sorteo Profesional
# Contexto: Vas a realizar un sorteo entre los asistentes a un evento.
# participantes <- c("Lucía", "Carlos", "Elena", "Marcos", "Sara", "Adrián")
# 1. Transforma el vector de participantes en un factor.
# 2. ¿Cuántos niveles (participantes únicos) tiene el factor? Compruébalo con una función.
# 3. Simula la extracción de 2 ganadores distintos de la lista original de participantes.
# 4. Crea un mensaje final que diga: "Los ganadores del sorteo son: [Ganador 1] y [Ganador 2]" usando una función que colapse los nombres.



#### SOLUCIONES: EJERCICIOS COMPLEMENTARIOS ####

# Solución Ejercicio 1
radio <- 7.5
area <- pi * radio^2
round(area, digits = 1)
?abs


# Solución Ejercicio 2
vector_empleados <- c("  emp-01  ", "EMP-02", "  emp-03", "EMP-04  ")
# Paso a paso:
empleados_limpios <- trimws(vector_empleados)
empleados_mayus <- toupper(empleados_limpios)
numeros_id <- substring(empleados_mayus, first = 5)

# Todo anidado:
substring(toupper(trimws(vector_empleados)), first = 5)


# Solución Ejercicio 3
stock <- c(15, 8, NA, 24, 12)
is.na(stock)
sum(stock, na.rm = TRUE)
ceiling(mean(stock, na.rm = TRUE))
stock_limpio <- na.omit(stock)


# Solución Ejercicio 4
categorias <- rep(c("Categoría A", "Categoría B"), each = 3)
ids <- seq(from = 101, to = 106)
etiquetas <- paste0("ID-", ids, ": ", categorias)
etiquetas


# Solución Ejercicio 5
set.seed(123)
pesos <- rnorm(n = 20, mean = 50, sd = 2)
control_pesos <- matrix(pesos, nrow = 10, ncol = 2)
colnames(control_pesos) <- c("Mañana", "Tarde")
colMeans(control_pesos)
head(control_pesos, n = 3)


# Solución Ejercicio 6
participantes <- c("Lucía", "Carlos", "Elena", "Marcos", "Sara", "Adrián")
participantes_fact <- as.factor(participantes)
levels(participantes_fact)
ganadores <- sample(participantes, size = 2, replace = FALSE)
paste("Los ganadores del sorteo son:", paste(ganadores, collapse = " y "))



### Librerías ###

# Hasta ahora solo hemos usado un set de funciones que vienen precargadas en R. 
# Sin embargo, en la mayoría de los casos querremos usar funciones desarrolladas por otras personas 
# que acometen una función específica. Estas funciones se almacenan en lo que se conoce como librerías, 
# que debemos instalar (solo una vez) y cargar (una vez en cada sesión).

# Las librerías son muy diversas, las hay para manipular tablas (dplyr), generar gráficos (ggplot2), 
# analizar datos de RNA-Seq (DESeq2) etc.

# Las librerías suelen estar en CRAN (repositorio de R), aunque algunas muy especializadas estarán en Bioconductor.


## Instalar y Cargar ##

# install.packages("nombre_librería") | Solo CRAN

install.packages("BiocManager") # Bioconductor
install.packages("tidyverse") # tidyverse, lo usaremos mañana

# instalar librería de Bioconductor
BiocManager::install("DESeq2")

# Cargar una librería

# library(nombre_librería)
library(tidyverse)

# Ejemplo Completo

# la librería fortunes tiene una función llamada fortune() que muestra una cita aleatoria de la comunidad de R

fortune() # si la usamos sin cargar, nos dará error

# para usarla debemos: instalarla, cargarla y usarla
install.packages("fortunes")
library(fortunes)
fortune()

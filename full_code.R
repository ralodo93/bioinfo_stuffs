# Tipos de Datos Atómicos ----
# Son los componentes básicos e indivisibles. Pueden ser de cinco tipos (aunque hay más).
# Numéricos: números
class(10) # devuelve "numeric"
class(10L) # devuelve "integer"

# Character: cadenas de texto - Siempre entre comillas simples o dobles
class("Hola Mundo") # devuelve "character"

# Booleanos: Verdadero o Falso - Solo dos valores: TRUE y FALSE
class(TRUE) # devuelve "logical"

# Perdidos o Faltantes: Cuando falta un valor en nuestros datos - Solo un valor NA
class(NA) # devuelve "logical"

# Nulos: No existe ese dato - Solo un valor NULL
class(NULL)

#-------------------------------------------------------------------------#

# Datos Numéricos ----
## Constantes Numéricas ----
10       # Numeric (doble precisión por defecto)
4.78     # Los decimales siempre usan punto (.), nunca coma (,)
-50      # Números negativos
1e2      # Notación científica (100)
10L      # La 'L' sufija obliga a que sea Integer (entero)

# Asignación a variables
numero <- 10

### Operaciones Matemáticas ----
# Operaciones Básicas
numero + 3 # SUMA
numero - 3 # RESTA
numero * 3 # MULTIPLICACIÓN
numero / 3 # DIVISIÓN
numero ^ 3 # POTENCIA

# Las operaciones tienen un orden de aplicación
numero + 3 * 8 # Multiplica 3 y 8 y suma el valor de número
(numero + 3) * 8 # suma el valor de número y 3 y lo multiplica por 8

# Algunas funciones para hacer cálculos
sqrt(numero + 6) # RAÍZ CUADRADA de un número
abs(numero - 20) # VALOR ABSOLUTO de un número
log(numero) # LOGARITMO NATURAL de un número
log10(numero) # LOGARITMO EN BASE 10 de un número
log2(numero) # LOGARITMO EN BASE 2 de un número
exp(numero - 8) # EXPONENCIAL de un número
factorial(numero - 6) # FACTORIAL de un número

# Formatear números
round(10.58) # REDONDEAR un número a entero (por defecto)
round(10.58, 1) # REDONDEAR un número a 1 decimal
floor(10.58) # OBTENER EL NÚMERO ENTERO INFERIOR
ceiling(10.58) # OBTENER EL NÚMERO ENTERO SUPERIOR

# El anidamiento de funciones se lee de adentro hacia afuera.
log10_res <- log10(10000)
sqrt(log10_res)

# Si anidamos funciones podemos reducir el número de líneas de código y el número de variables creadas
sqrt(log10(10000)) # Ejecuta el log10(10000); el resultado lo envía a la función sqrt()


############################################################
# EJERCICIO 1
# Contexto:
# En un estudio de farmacocinética, se administra una dosis de un fármaco 
# y se observa que su concentración plasmática decae siguiendo una 
# escala logarítmica. Se necesita calcular la dosis efectiva final tras 
# aplicar un factor de corrección por metabolismo basal.
#
# Enunciado:
# 1. Crea una variable llamada 'dosis_mg' con el valor 250.
# 2. Calcula el logaritmo natural de la dosis y asígnalo a 'log_dosis'.
# 3. Eleva 'log_dosis' al cuadrado y suma 15 al resultado.
# 4. Redondea el valor final a 1 decimal usando la función correspondiente.
############################################################

# El estudiante debe completar a partir de aquí:



# SOLUCIÓN

dosis_mg <- 250

log_dosis <- log(dosis_mg)

resultado <- log_dosis^2 + 15

round(resultado, 1)


############################################################
# EJERCICIO 2
# Contexto:
# Un técnico de laboratorio mide el área de una placa de cultivo circular 
# donde crecen bacterias. El radio de la placa es de 5.2 cm. El técnico 
# debe reportar el área aproximada hacia el número entero superior para 
# asegurar que tiene suficiente medio de cultivo.
#
# Enunciado:
# 1. Calcula el área siguiendo la fórmula: Área = pi * radio^2. 
#    Nota: Usa el valor 3.1415 para pi y crea una variable 'radio' con el valor 5.
# 2. Una vez calculado el área, aplica la función que devuelve el 
#    entero superior (techo) para obtener la medida final.
# 3. Realiza todo el proceso anterior (punto 1 y 2) en una sola línea de 
#    código utilizando el anidamiento de funciones.
############################################################

# El estudiante debe completar a partir de aquí:



# SOLUCIÓN:

radio <- 5
area <- 3.1415 * radio^2

ceiling(area)

ceiling(3.1415 * radio^2)

############################################################


# Datos Character (Texto) ----
## Definir un character ----
# Siempre entre comillas dobles o simples
"Hola Mundo"
'Hola Mundo'

# Si incluimos un número entre comillas, pasa a ser character
class("100") # Devuelve character
is.character("100") # devuelve TRUE
as.numeric("100") # Lo transforma a numérico

# Asignación a variables
texto <- "Hola Mundo"

## Manipulación de character ----
# Extraer información
nchar(texto)             # devuelve el número de caracteres de un texto
toupper("Hola Mundo")           # devuelve el texto en mayúsculas
tolower("Hola Mundo")           # devuelve el texto en minúsculas
trimws("    Hola Mundo    ")    # limpia los espacios sobrantes de un texto
substring("Hola Mundo", 1, 3)   # coge los caracteres de las posiciones 1 hasta 3
substring("Hola Mundo", 2)      # coge los caracteres de la posicion 2 hasta el final

# Búsqueda y reemplazo
gsub("Hola", "Hello", "Hola Mundo")   # devuelve el texto sustituyendo "Hola" por "Hello"
grepl("Hola", "Hola Mundo")           # devuelve TRUE ya que "Hola" está en "Hola Mundo"
grepl("Hello", "Hola Mundo")          # devuelve FALSE ya que "Hello" no está en "Hola Mundo"

# Unir Texto
paste("Mi saludo preferido es", texto) # por defecto se unen mediante " "
paste("Mi número favorito es", numero, "¿Cuál es el tuyo?") # podemos incorporar números, que se transforman en character
paste("Mi saludo preferido es", texto, sep = ": ") # para usar un separador diferente, usamos el argumento sep

############################################################
# EJERCICIO 1
# Contexto:
# Un secuenciador de ADN genera identificadores de muestras que a veces 
# incluyen espacios accidentales al inicio o al final. Además, los 
# investigadores prefieren trabajar siempre con los códigos en mayúsculas 
# para evitar errores de duplicidad en la base de datos.
#
# Enunciado:
# 1. Crea una variable 'id_sucio' con el valor "   patient_089_v1   ".
# 2. Limpia los espacios en blanco sobrantes de 'id_sucio' y guarda el 
#    resultado en una nueva variable llamada 'id_limpio'.
# 3. Transforma 'id_limpio' totalmente a mayúsculas.
# 4. Calcula cuántos caracteres tiene el identificador final después 
#    de haber sido limpiado.
############################################################

# El estudiante debe completar a partir de aquí:



# SOLUCIÓN

id_sucio <- "   patient_089_v1   "

id_limpio <- trimws(id_sucio)

toupper(id_limpio)

nchar(id_limpio)

############################################################
# EJERCICIO 2
# Contexto:
# En un informe de laboratorio, las variantes genéticas se registran 
# con un prefijo. Se ha detectado que una serie de muestras fueron 
# etiquetadas erróneamente con el prefijo "MUT" (mutación) y debe 
# cambiarse a "VAR" (variante) para cumplir con la nueva normativa. 
# Además, se requiere extraer solo el código numérico de la variante.
#
# Enunciado:
# 1. Dada la variable 'registro' con el valor "MUT-9482", utiliza la 
#    función de reemplazo para cambiar "MUT" por "VAR".
# 2. Comprueba si la palabra "VAR" existe dentro del nuevo texto 
#    utilizando una función de búsqueda lógica.
# 3. Extrae únicamente los dígitos "9482" de la variable original 
#    'registro' usando su posición (caracteres del 5 al 8).
# 4. Realiza los pasos 1 y 3 anidando funciones
# 5. Crea una frase final que diga: "Código procesado: [tu_codigo_extraido]" 
#    utilizando una función para unir texto.
############################################################

# El estudiante debe completar a partir de aquí:



# SOLUCIÓN

registro <- "MUT-9482"
registro <- gsub("MUT", "VAR", registro)
grepl("VAR", registro)
digitos <- substring(registro, 5, 8)

registro <- "MUT-9482"
digitos <- substring(gsub("MUT", "VAR", registro), 5, 8)

paste("Código procesado:", digitos)


############################################################

# Datos Booleanos ----

## TRUE y FALSE ----
# Los datos de tipo booleano solo pueden tomar dos valores: TRUE y FALSE
TRUE # No sirve ni true ni True. Si que funciona T pero no es recomendable
FALSE # No sirve ni false ni False. Si que funciona F pero no es recomendable

# Podemos asignarlos a variables
resultado <- TRUE

## Operadores Relacionales ----
# En la mayoría de los casos obtendremos un valor booleano al realizar una comparación de dos o más elementos
# Los operadores relacionales son:

10 < 20      # menor que
10 <= 20     # menor o igual que
10 > 20      # mayor que
10 >= 20     # mayor o igual que
10 == 20     # igual que (OJO: usar siempre doble igual == para comparar)
10 != 20     # diferente que

# Comparación de texto (Case Sensitive)
"Hola Mundo" == "hola mundo"  # FALSE: R diferencia mayúsculas de minúsculas
"Hola Mundo" != "hola mundo"  # TRUE

# Podemos almacenar el resultado de una comparación en una variable
resultado_comp <- numero < 20

# Operador inverso (!)
# Invierte el resultado booleano (lo que es TRUE pasa a ser FALSE y viceversa)
!10 < 20     # Pasa de TRUE a FALSE

## Operadores Lógicos ----
# Son operadores que se usan para combinar varias condiciones: AND y OR

### Operador AND (&) ----
# Devuelve TRUE solo si AMBAS condiciones son verdaderas
(numero < 20) & (20 > 5)                     # TRUE & TRUE -> TRUE
(numero < 20) & ("Hola Mundo" == "hola")     # TRUE & FALSE -> FALSE

### Operador OR (|) ----
# Devuelve TRUE si AL MENOS UNA de las condiciones es verdadera
(numero < 20) | (20 > 5)                     # TRUE | TRUE -> TRUE
(numero < 20) | ("Hola Mundo" == "hola")     # TRUE | FALSE -> TRUE
(20 < numero) | ("Hola Mundo" == "hola")     # FALSE | FALSE -> FALSE

# Anidar Operadores 
# Los paréntesis definen el orden de evaluación de los operadores
(numero < 20) | (20 > 5 & numero < 5)

############################################################
# EJERCICIO 1
# Contexto:
# En un ensayo clínico, un paciente se considera apto para un tratamiento 
# experimental si su edad es mayor o igual a 18 años y su nivel de 
# glucosa en ayunas es estrictamente menor a 110 mg/dL.
#
# Enunciado:
# 1. Crea las variables 'edad' con valor 25 y 'glucosa' con valor 105.
# 2. Crea una variable lógica llamada 'es_apto' que combine ambas 
#    condiciones usando el operador AND (&).
# 3. Invierte el resultado de 'es_apto' usando el operador inverso (!) 
#    y guárdalo en una variable llamada 'excluido'.
# 4. Compara si el valor de 'edad' es diferente de 30.
############################################################

# El estudiante debe completar a partir de aquí:


#SOLUCIÓN

edad <- 25
glucosa <- 105

es_apto <- edad >= 18 & glucosa < 110

excluido <- !es_apto

edad != 30


############################################################
# EJERCICIO 2
# Contexto:
# Un sistema de alertas médicas se dispara si un paciente presenta una 
# condición crítica. La alerta de "Riesgo Cardiovascular" se activa si:
# El colesterol es mayor a 200 O la presión sistólica es mayor o igual a 140.
# Además, para confirmar la alerta, el paciente NO debe estar en el grupo "Control".
#
# Enunciado:
# 1. Define las variables: 'colesterol' (215), 'presion' (130) y 'grupo' ("Tratamiento").
# 2. Evalúa si el colesterol es superior a 200 o (|) la presión es mayor o igual a 140. 
#    Rodea esta operación con paréntesis. Guarda el resultado en una variable llamada alerta
# 3. Utilizando el operador AND (&), combina el resultado anterior con una 
#    comparación que verifique si 'grupo' es diferente de "Control". Guarda el resultado
#    en una variable llamada alerta_activa
############################################################

# El estudiante debe completar a partir de aquí:



# SOLUCIÓN

colesterol <- 215
presion <- 130
grupo <- "Tratamiento"

alerta <- (colesterol > 200) | (presion >= 140)

alerta_activa <- alerta == TRUE & grupo != "Control"

############################################################

# Faltantes ----

## Valores NA
NA     # Not Available: Valor Faltante o Perdido. El valor existe pero se desconoce.
is.na(NA)      # devuelve TRUE
# Se pueden asignar a variables
faltante <- NA
# Los NA suelen "propagar" la incertidumbre en los cálculos
10 + NA       # devuelve NA (si no sabemos un sumando, no sabemos el resultado)


# Nulos ----

## Valores NULL
NULL   # Null: Valor Nulo. Indica que el objeto o valor no existe (vacío absoluto).
is.null(NULL)  # devuelve TRUE
# Se pueden asignar a variables
vacio <- NULL


############################################################
# EJERCICIO 1
# Contexto:
# Durante la digitalización de fichas médicas, se ha detectado que algunos 
# registros de "Nivel de Hemoglobina" están vacíos porque la muestra se 
# coaguló y no pudo ser analizada. En R, debemos marcar estos casos 
# correctamente para que no interfieran con los cálculos promedio.
#
# Enunciado:
# 1. Crea una variable 'hemoglobina' y asígnale un valor que indique 
#    que el dato es "Faltante" o "No Disponible" (NA).
# 2. Comprueba mediante una función lógica si la variable 'hemoglobina' 
#    es efectivamente un valor NA.
# 3. Intenta sumar 1.5 a la variable 'hemoglobina' y observa qué sucede. 
#    Explica el resultado en un comentario breve.
############################################################

# El estudiante debe completar a partir de aquí:




# SOLUCIÓN

hemoglobina <- NA

is.na(hemoglobina)

hemoglobina + 1.5 # intenta sumar un NA a un número, lo cual es imposible, devuelve NA

############################################################
# EJERCICIO 2
# Contexto:
# Un software de gestión hospitalaria genera etiquetas para muestras de 
# orina. La etiqueta debe incluir el ID del paciente, su estado de 
# hidratación (basado en la densidad de la orina) y si requiere revisión.
#
# Enunciado:
# 1. Crea las variables: 'id_paciente' (valor 505), 'densidad' (valor 1.035) 
#    y 'nombre_medico' (valor "  dr. garcía  ").
# 2. El paciente está "Deshidratado" si la 'densidad' es mayor a 1.030. 
#    Crea una variable lógica 'deshidratado' con esta comparación.
# 3. Limpia los espacios del 'nombre_medico' y conviértelo a mayúsculas 
#    en una sola línea de código (anidamiento).
# 4. Crea una frase final usando paste() que diga: 
#    "Paciente: 505 | Estado Deshidratado: TRUE | Médico: DR. GARCÍA"
############################################################

# El estudiante debe completar a partir de aquí:




# SOLUCIÓN

id_paciente <- 505
densidad <- 1.035
nombre_medico <- "  dr. garcía  "

deshidratado <- densidad > 1.030

nombre_medico <- toupper(trimws(nombre_medico))

paste("Paciente:", id_paciente,"| Estado Deshidratado:", deshidratado,"| Médico:", nombre_medico)


############################################################
# EJERCICIO 3
# Contexto:
# Un bioinformático analiza secuencias de ARN. Se considera una secuencia 
# "Interesante" si cumple dos condiciones: tiene una longitud superior a 
# 10 bases y contiene la palabra "AUG" (codón de inicio). Si no hay 
# secuencia (está vacía), el valor debe ser nulo.
#
# Enunciado:
# 1. Crea una variable 'secuencia' con el valor "  augccuagggcu  ".
# 2. Limpia los espacios de 'secuencia' y asegúrate de que sea "secuencia_fija".
# 3. Evalúa si la longitud de 'secuencia_fija' es mayor a 10 Y (&) 
#    contiene el texto "aug" (usa grepl). Guarda esto en 'es_interesante'.
############################################################

# El estudiante debe completar a partir de aquí:




# SOLUCIÓN

secuencia <- "  augccuagggcu  "

secuencia_fija <- trimws(secuencia)

es_interesante <- nchar(secuencia_fija) > 10 & grepl("aug", secuencia_fija)

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

# Condicionales ----
## IF / ELSE / ELSE IF ----
# Estructura formada por 3 Elementos. IF (SIEMPRE SE USA), ELSE y ELSE IF

### IF ----
# La estructura de control IF consiste en que, siempre que se cumpla una condición
# se ejecuta el código que hay entre las llaves
# Es la estructura que SIEMPRE se usa
# if (condición entre paréntesis) {bloque de código entre llaves}

edad <- 30
if (edad >= 18) { # si la edad es mayor o igual que 18 --> se ejecuta el código entre llaves; sino se cumple no hace nada
  print(paste("Tienes",edad,"años; puedes conducir.")) # cuando usamos una estructura de control y queremos obtener un mensaje debemos usar print
}


### ELSE ----
# La estructura else se utiliza para cuando queremos hacer algo cuando las condiciones que se plantean no se cumplen
# No siempre se debe usar, pero SIEMPRE debe ir acompañando a un if, un else solo da error
# if (condición entre paréntesis) {bloque de código entre llaves} else {bloque de código entre llaves}

edad <- 15
if (edad >= 18) { # solo se ejecuta cuando edad es mayor de 18
  print(paste("Tienes",edad,"años; puedes conducir."))
} else{ # sino se ejecuta esto
  print(paste("Tienes",edad,"años; no puedes conducir."))
}

### ELSE IF ----
# La estructura else if se utiliza para cuando queremos plantear condiciones alternativas al if, sin necesidad de caer en un else
# No siempre se debe usar, pero SIEMPRE debe ir acompañando a un if
# if (condición entre paréntesis) {bloque de código entre llaves} else if (condicion entre paréntesis) {bloque de código entre llaves}

edad <- 20
carnet <- FALSE
if (edad >= 18 & carnet == TRUE) { # solo se ejecuta cuando edad es mayor de 18 y carnet es TRUE
  print(paste("Tienes",edad,"años y carnet de conducir; puedes conducir."))
} else if (edad >= 18 & carnet == FALSE) { # si el IF es FALSE, evaúa este else if
  print(paste("Tienes",edad,"años pero no tienes carnet; no puedes conducir."))
} else { # sino se ejecuta esto
  print(paste("Tienes",edad,"años; no puedes conducir."))
}


### Anidación de Condicionales ----
# Podemos incluir estructuras IF / ELSE / ELSE IF dentro de una estructura IF / ELSE / ELSE IF. Es como un árbol de decisiones
# Si pasa el primer IF, y dentro de su bloque hay otro IF, también lo evaluará. De este modo podemos llegar a plantear condiciones
# muy específicas.

# EXTRA: con un IF/ELSE/ELSE IF podemos crear variables para darles un valor diferente dependiendo de las condiciones

tipo_envio <- "Nacional"
prioridad <- "Urgente"

if (tipo_envio == "Nacional") {
  # Primer nivel de anidación: Si es Nacional, ahora evalúa si es Urgente
  if (prioridad == "Urgente") {
    # creamos variable coste y entrega y le damos valores diferentes dependiendo de las condiciones
    coste <- 10 
    entrega <- 1
  } else {
    coste <- 5
    entrega <- 3
  }
} else {
  # Segundo nivel de anidación: Si es Internacional, ahora evalúa si es Urgente
  if (prioridad == "Urgente") {
    coste <- 30
    entrega <- 2
  } else {
    coste <- 20
    entrega <- 7
  }
}
paste("Coste:", coste,"euros (Entrega en", entrega, "días)")

############################################################
# EJERCICIO 1
# Contexto:
# Un laboratorio clínico automatiza el triaje de pacientes según su nivel 
# de glucosa en sangre (mg/dL). Se establecen tres categorías: Hipoglucemia 
# (menor a 70), Normal (70 a 100 inclusive) e Hiperglucemia (mayor a 100).
#
# Enunciado:
# 1. Crea una variable 'glucosa_paciente' con el valor 105.
# 2. Escribe una estructura if / else if / else que:
#    - Si la glucosa es menor a 70, imprima: "Alerta: Hipoglucemia".
#    - Si la glucosa está entre 70 y 100 (usa &), imprima: "Nivel Normal".
#    - Para cualquier otro caso (mayor a 100), imprima: "Alerta: Hiperglucemia".
############################################################

# El estudiante debe completar a partir de aquí:



# SOLUCIÓN

glucosa_paciente <- 105

if (glucosa_paciente < 70){
  print("ALERTA: Hipoglucemia")
} else if (glucosa_paciente > 70 & glucosa_paciente < 100){
  print("Normal")
} else{
  print("ALERTA: Hiperglucemia")
}


############################################################
# EJERCICIO 2
# Contexto:
# Un sistema de monitorización fetal evalúa la frecuencia cardíaca (latidos 
# por minuto) y el movimiento. Si la frecuencia es baja (menor a 110), 
# se considera bradicardia. Si además no hay movimiento, es una emergencia.
#
# Enunciado:
# 1. Define 'frecuencia' <- 105 y 'movimiento' <- FALSE.
# 2. Crea una estructura anidada:
#    - El primer nivel (if) debe comprobar si 'frecuencia' < 110.
#    - Dentro de ese bloque, usa otro if/else para evaluar 'movimiento'.
#    - Si movimiento es FALSE, imprime "EMERGENCIA: Bradicardia sin movimiento".
#    - Si movimiento es TRUE, imprime "Vigilancia: Bradicardia moderada".
#    - Si la frecuencia NO es menor a 110, el 'else' principal debe 
#      imprimir "Signos estables".
############################################################

# El estudiante debe completar a partir de aquí:



# SOLUCIÓN

frecuencia <- 105
movimiento <- FALSE

if (frecuencia < 110){
  if (movimiento == FALSE){
    print("EMERGENCIA: Bradicardia sin movimiento")
  } else{
    print("Vigilancia: Bradicardia moderada")
  }
} else{
  print("Signos Estables")
}


############################################################
# EJERCICIO 3
# Contexto:
# Estás procesando un lote de muestras de tejido. La variable 'muestra' 
# puede contener un código de texto, un valor NA (si se perdió) o ser NULL. 
# Debes crear una variable 'estado_procesamiento' que dependa de esto.
#
# Enunciado:
# 1. Crea la variable 'muestra' con el valor "BIO-99".
# 2. Escribe un condicional que use las funciones is.null() e is.na():
#    - Si la muestra es NULL, 'estado_procesamiento' será "Error: No existe".
#    - Si la muestra es NA, 'estado_procesamiento' será "Pendiente de recibir".
#    - Si la muestra es de tipo character (is.character), 'estado_procesamiento' 
#      será "Muestra lista para análisis".
# 3. Al final, imprime el valor de 'estado_procesamiento' usando print().
############################################################

# El estudiante debe completar a partir de aquí:



# SOLUCIÓN

muestra <- "BIO-99"
estado_procesamiendo <- ""

if (is.null(muestra)){
  estado_procesamiendo <- "Error: No existe"
} else if (is.na(muestra)){
  estado_procesamiendo <- "Pendiente de recibir"
} else if (is.character(muestra)){
  estado_procesamiendo <- "Muestra lista para el análisis"
}

print(estado_procesamiendo)

############################################################

## ifelse() ----
# La función ifelse se usa para evaluar de forma ágil y en una sola línea de código (por lo general) una estructura IF/ELSE

### Estructura ----

# ifelse(condición, resultado si se cumple (resultado1), resultado si no se cumple (resultado2))

# Simulemos el uso de la función abs()
num <- -5
ifelse(num < 0, -num, num) # si num es menor de 0, devuelve el resultado1, sino devuelve el resultado2

# La única limitación de ifelse con respecto a if/else/else if es que solo se puede devolver una variable


### Anidar ifelse() ----
# Podemos incoporar varios ifelse anidados, de forma que se comporte como un if/else/else if
edad <- 20
carnet <- FALSE
ifelse(edad >= 18 & carnet == TRUE, "Es mayor de edad y tiene carnet, puede conducir", # resultado1
       # en el resultado2 incorporamos un ifelse()
       ifelse(edad >= 18 & carnet == FALSE, "Es mayor de edad pero no tiene carnet, no puede conducir", #resultado2 -> resultado1 
              "No es mayor de edad, no puede conducir")) #resultado2 -> resultado2


############################################################
# EJERCICIO 1
# Contexto:
# Un software de bioestadística debe asignar etiquetas rápidas a una serie 
# de mediciones de pH obtenidas de muestras de suelo. El pH neutro es 7. 
# Valores por debajo de 7 son "Ácido", valores por encima son "Básico" 
# y exactamente 7 es "Neutro".
#
# Enunciado:
# 1. Crea una variable 'ph_medido' con el valor 7.
# 2. Utiliza una única estructura de funciones ifelse() anidadas para:
#    - Si 'ph_medido' es menor a 7, asignar el texto "Ácido".
#    - Si 'ph_medido' es mayor a 7, asignar el texto "Básico".
#    - Si no es ninguna de las anteriores (es decir, es 7), asignar "Neutro".
# 3. Guarda el resultado en una variable llamada 'clasificación' y 
#    muéstrala por consola.
############################################################

# El estudiante debe completar a partir de aquí:



# SOLUCIÓN

ph_medido <- 7

clasificacion <- ifelse(ph_medido < 7, "Ácido", 
                        ifelse(ph_medido > 7, "Básico", "Neutro"))

clasificacion

# Bucles ----
# Los bucles son estructuras de control que nos permiten ejecutar un mismo proceso varias veces de forma automática. 

## Bucle FOR ----
# Nos permite evitar tener que hacer esto:
vector_numeros <- c(10, 20, 30, 40)
sqrt(vector_numeros[1])
sqrt(vector_numeros[2])
sqrt(vector_numeros[3])
sqrt(vector_numeros[4])

### Estructura ----
# for (iteración entre paréntesis) {ejecuta bloque entre llaves en cada iteración}
for (num in vector_numeros){ # para cada elemento de vector_numeros
  print(sqrt(num)) # calcula la raíz cuadrada de num (que coge los valores de forma iterada) e imprime el resultado
}


# El bucle for se puede usar como contador
for (i in 1:10){ # para cada elemento del vector 1:10
  print(paste("Ronda",i)) # imprime este mensaje
}

# Podemos rellenar un vector vacío
sqrts <- c()
for (num in vector_numeros){ # para cada elemento de vector_numeros
  sqrts <- c(sqrts, sqrt(num)) # en cada iteración añadimos un elemento al vector vacío
}
sqrts

# Podemos modificar una variable externa
ahorros <- 100
for (i in 1:5){
  ahorros <- ahorros * 1.02 # incremento del 2%
}
ahorros

### Añdir bucles FOR a otras estructuras
for (num in vector_numeros){
  if (num > 20){
    print(paste(num,"es mayor que 20"))
  } else if (num < 20){
    print(paste(num,"es menor de 20"))
  } else{
    print("Número 20")
  }
}


### Bucles anidados ----
# Al igual que los condicionales, podemos usar bucles dentro de bucles. Hasta que no se complete el bucle interno, no se pasa a la siguiente iteración del bucle externo
for (i in 1:4){
  # una vez i es 1, no pasará el siguiente valor hasta que concluya el bucle interior
  for (j in 5:6){
    print(paste("Coordenadas",i,j))
  }
}

#############################################################
# EJERCICIO 1
# Contexto:
# Un biólogo está monitorizando el crecimiento de una colonia bacteriana 
# en el laboratorio. Inicialmente hay 500 bacterias. Cada hora, la 
# población crece un 15% respecto a la hora anterior. Se quiere conocer 
# la evolución durante las primeras 8 horas.
#
# Enunciado:
# 1. Crea una variable 'poblacion' con el valor inicial de 500.
# 2. Utiliza un bucle for que recorra un contador del 1 al 8 (representando 
#    las horas).
# 3. En cada iteración, actualiza la variable 'poblacion' multiplicándola 
#    por 1.15 (incremento del 15%).
# 4. Dentro del bucle, imprime un mensaje que diga: "Hora [i]: [poblacion] bacterias". 
#    Usa round() para que el número de bacterias no tenga decimales.
#############################################################

# El estudiante debe completar a partir de aquí



# SOLUCIÓN
poblacion <- 500
for (i in 1:8){
  poblacion <- poblacion * 1.15
  print(paste0("Hora ",i,": ",round(poblacion)," bacterias"))
}


#############################################################
# EJERCICIO 2
# Contexto:
# Se han analizado los niveles de una proteína específica en 5 pacientes. 
# Los resultados se almacenan en un vector. El protocolo clínico indica 
# que si el nivel es superior a 30, la muestra debe marcarse como "Positivo", 
# de lo contrario, como "Negativo".
#
# Enunciado:
# 1. Dado el vector: niveles_proteina <- c(25, 40, 15, 32, 28).
# 2. Crea un vector vacío llamado 'diagnostico'.
# 3. Crea un bucle for que recorra cada elemento de 'niveles_proteina'.
# 4. Dentro del bucle, usa una estructura if/else:
#    - Si el nivel es > 30, añade el texto "Positivo" al vector 'diagnostico'.
#    - Si no, añade el texto "Negativo" al vector 'diagnostico'.
# 5. Al finalizar el bucle, muestra el vector 'diagnostico' resultante.
#############################################################

# El estudiante debe completar a partir de aquí

niveles_proteina <- c(25, 40, 15, 32, 28)


# SOLUCIÓN

niveles_proteina <- c(25, 40, 15, 32, 28)

diagnostico <- c()

for (nivel in niveles_proteina){
  if (nivel > 30){
    diagnostico <- c(diagnostico, "Positivo")
  } else{
    diagnostico <- c(diagnostico, "Negativo")
  }
}

diagnostico



#############################################################

## Bucles while ----
# Dar vueltas infinitas hasta que se cumpla una condición. 
# Con este bucle debemos tener cuidado ya que en caso de que lo configuremos mal, podría quedarse en bucle infinito.

### Estructura ----
# variable_control while(condición entre paréntesis){ bloque de código entre llaves; se debe actualizar la variable de control}

contador <- 0 # variable de control
while (contador < 10){ # mientras no se cumpla esta condición
  print("Otra vuelta, aún no se ha cumplido la condición") # se ejecuta esto
  contador <- contador + 1 # actualizamos la variable de control
}

# Evitar usarlo siempre que no sea necesario. Por lo general usaremos bucle for. 
# Este tipo de bucle está pensado para escenarios en los que no sabemos cuantas vueltas hay que dar: 
# por ejemplo - número de lanzamientos de un dado hasta que salga un número.

lanzamientos <- 0
numero_dado <- 0 # variable de control

while (numero_dado != 5){ # hasta que no salga un cinco vamos a estar lanzando el dado
  lanzamientos <- lanzamientos + 1
  numero_dado <- sample(1:6, 1)
  print(paste("En el lanzamiento número", lanzamientos, "se ha obtenido un", numero_dado))
}

#############################################################
# EJERCICIO 25
# Contexto:
# Un investigador está realizando un experimento de titulación en el que 
# añade gotas de una solución alcalina a una muestra ácida. El objetivo 
# es alcanzar un pH de 7.0 (o ligeramente superior) para neutralizar 
# la muestra. Se desconoce cuántas gotas serán necesarias exactamente.
#
# Enunciado:
# 1. Crea una variable 'ph_actual' con el valor inicial de 3.2.
# 2. Crea una variable 'gotas_anadidas' que actúe como contador, 
#    empezando en 0.
# 3. Utiliza un bucle while que se ejecute mientras 'ph_actual' sea 
#    estrictamente menor que 7.0.
# 4. Dentro del bucle:
#    - Suma 1 a 'gotas_anadidas'.
#    - Incrementa el 'ph_actual' sumándole un valor aleatorio entre 0.1 
#      y 0.8 (Usa la función runif(1, min = 0.1, max = 0.8)).
#    - Imprime un mensaje que diga: "Gota [gotas_anadidas]: pH actual = [ph_actual]". 
#      Usa round() para mostrar solo 2 decimales del pH.
# 5. Fuera del bucle, imprime el mensaje final: "Neutralización completada 
#    tras añadir [gotas_anadidas] gotas".
#############################################################

# El estudiante debe completar a partir de aquí:



# SOLUCIÓN
ph_actual <- 3.2
gotas_anadidas <- 0

while(ph_actual < 7){
  gotas_anadidas <- gotas_anadidas + 1
  ph_actual <- ph_actual + runif(1, min = 0.1, max = 0.8)
  print(paste0("Gota ", gotas_anadidas, ": pH actual ", round(ph_actual, 2)))
}

paste("Neutralización completada tras añadir", gotas_anadidas, "gotas")

#############################################################

## Bucles familia apply (apply(), lapply(), sapply()) ----

# Las funciones de la familia apply son una de las características más potentes de R. 
# Se utilizan para aplicar una función a los elementos de un objeto (como una lista, un vector o una matriz) 
# de forma eficiente, evitando escribir bucles for largos y complejos.

# La familia apply es un conjunto de funciones que actúan como sustitutos de los bucles. La idea es: "Tengo este conjunto de datos, aplícale esta función a cada parte". 
# Las más usadas son apply(), sapply() y lapply().

### apply() ----
# apply(matriz o dataframe, MARGIN, FUN) -> Aplica la función (FUN) al las filas o columnas (MARGIN) de la matriz
# MARGIN = 1 -> Se aplica a filas
# MARGIN = 2 -> Se aplica a columnas

mi_matriz <- matrix(1:9, nrow = 3)

# Calcular la suma de cada FILA (MARGIN = 1)
apply(mi_matriz, 1, sum)

# Calcular la suma de cada COLUMNA (MARGIN = 2)
apply(mi_matriz, 2, sum)

# Se puede aplicar cualquier función, incluyendo generadas por nosotros mismos

# Existen 4 funciones especiales para matrices que nos permiten calcular media y suma por fila y columna
# colSums(), rowSums(), colMeans(), rowMeans()
colSums(mi_matriz) # suma total de cada columna
rowMeans(mi_matriz) # media de cada fila

### sapply() ----
# sapply(vector o lista, FUN) -> Aplica una función (FUN) a un vector
sapply(1:4, sqrt)


## lapply() ----
# lapply(vector o lista, FUN) -> Aplica una función (FUN) a un vector

# Es exactamente igual a un sapply solo que devuelve el resultado en formato lista
lapply(1:4, sqrt)

#############################################################
# EJERCICIO 26
# Contexto:
# Un centro de investigación genómica ha analizado la expresión de 4 genes 
# en 3 tipos de tejidos diferentes. Los resultados se han organizado en 
# una matriz. Se requiere obtener estadísticas rápidas por gen y por tejido, 
# además de transformar los datos de una lista de identificadores.
#
# Enunciado:
# 1. Crea una matriz llamada 'expresion_genes' con los valores del 1 al 12, 
#    organizada en 4 filas (genes) y 3 columnas (tejidos).
# 2. Utiliza la función apply() para calcular el valor máximo (max) de 
#    expresión para cada GEN (filas).
# 3. Utiliza la función apply() para calcular la media (mean) de expresión 
#    para cada TEJIDO (columnas).
# 4. Dado el vector: ids <- c("gen_a", "gen_b", "gen_c").
#    - Usa sapply() para convertir todos los nombres a mayúsculas (toupper).
#    - Usa lapply() para hacer lo mismo y observa que el resultado es una lista.
#############################################################

# El estudiante debe completar a partir de aquí




# SOLUCIÓN

expresion_genes <- matrix(1:12, ncol = 3)

apply(expresion_genes, MARGIN = 1, max)

apply(expresion_genes, MARGIN = 2, mean)

ids <- c("gen_a", "gen_b", "gen_c")
sapply(ids, toupper)
lapply(ids, toupper)

#############################################################

## Funciones Vectorizadas ----
# Hay algunas funciones, muchas de ellas ya las hemos estudiado. Una función vectorizada es aquella que se aplica tanto a un vector como a un solo elemento
# En este aspecto, indicaros que un elemento (un número, un texto, etc) realmente es un vector de 1 elemento
num <- c(4) # es igual que usar num <- 4

# La mayor parte de las funciones que hemos estudiado son vectorizadas; todas aquellas que no describan el vector
sqrt(vector_numeros)
log10(vector_numeros)
abs(vector_numeros)

# También las funciones de texto están vectorizadas
nchar(c("Hola", "Bonjour"))
strsplit(c("Hola Mundo", "Hello World"), split = " ")

# También ifelse() está vectorizado
ifelse(vector_numeros > 20, sqrt(vector_numeros), vector_numeros ^2)

# Caso especial de paste.
# Por defecto paste funciona como vectorizado
paste("Mi número favorito es", vector_numeros)

# Sin embargo, cuando se usa el argumento collapse pasa a no ser vectorizada
paste(vector_numeros, collapse = ", ")


# Las funciones vectorizadas están optimizadas para trabajar de forma más eficiente que un bucle.
vector_norm <- rnorm(10000)
resultado <- round(vector_norm, 2)

resultado <- c()
for (num in vector_norm){
  resultado <- c(resultado, round(vector_norm, 2))
}


# Usando estas funciones podremos evitar la mayoría de los bucles (sobretodo los for), sin embargo
# habrá ocasiones en las que necesitemos usar un bucle for: simulaciones (cuando quieres simular algo x veces),
# cuando uno de los valores se modifica dentro del for (el ejemplo del ahorro), cuando dentro del for hay un if/else/else if etc

#############################################################
# EJERCICIO 1
# Contexto:
# Un analista de datos hospitalarios recibe una lista de concentraciones
# de un reactivo en diferentes lotes. Los datos vienen con decimales
# excesivos y necesitan ser normalizados mediante el logaritmo 
# en base 10 antes de ser reportados.
#
# Enunciado:
# 1. Crea un vector 'concentraciones' con los valores: 10, 100, 1000, 50, 200.
# 2. Utiliza la propiedad de vectorización para calcular el logaritmo 
#    en base 10 (log10) de todo el vector en una sola línea.
# 3. Sobre el resultado anterior, aplica la función round() para 
#    redondear todos los valores a 2 decimales de forma vectorizada.
# 4. Compara mentalmente: ¿sería más eficiente hacer esto con un 
#    bucle for o directamente sobre el vector?
#############################################################

# El estudiante debe completar a partir de aquí




# SOLUCIÓN

concentraciones <- c(10, 100, 1000, 50, 200)

log10(concentraciones)

round(log10(concentraciones), 2)

# directamente sobre el vector (menos código y más optimizado)

#############################################################
# EJERCICIO 2
# Contexto:
# Estás preparando las etiquetas para un set de muestras de ADN. 
# Tienes los nombres de los genes y sus códigos de identificación 
# en vectores separados y necesitas unirlos de forma masiva.
#
# Enunciado:
# 1. Crea el vector 'genes' <- c("BRCA1", "TP53", "MYC").
# 2. Crea el vector 'ids' <- c(101, 102, 103).
# 3. Usa la función paste() de forma vectorizada para crear un nuevo 
#    vector llamado 'etiquetas' que combine ambos (ej: "BRCA1-101"). 
#    Usa el argumento 'sep = "-"'.
# 4. Ahora, utiliza paste() con el argumento 'collapse = " | "' para 
#    convertir todo el vector 'etiquetas' en una sola cadena de texto.
# 5. Observa cómo cambia el comportamiento de la función al usar 'collapse'.
#############################################################

# El estudiante debe completar a partir de aquí




# SOLUCIÓN

genes <- c("BRCA1", "TP53", "MYC")
ids <- c(101, 102, 103)

etiquetas <- paste(genes, ids, sep = "-")

paste(etiquetas, collapse = " | ")




############################################################
# EJERCICIO 1
# Contexto: 
# Un hospital tiene una base de datos de pacientes con su temperatura. 
# Debes categorizarlos automáticamente para identificar casos de fiebre.
#
# Enunciado:
# 1. Crea un DataFrame llamado 'hospital' con dos columnas: 
#    'ID' (del 1 al 10) y 'Temperatura' (10 valores aleatorios entre 
#    36.0 y 39.0 usando runif).
# 2. Utiliza la función vectorizada ifelse() para crear una nueva 
#    columna llamada 'Estado'.
#    - Si la temperatura es >= 37.5, el estado será "Fiebre".
#    - De lo contrario, será "Normal".
# 3. Usa un bucle FOR para recorrer el dataframe e imprimir (print) 
#    el ID de cada paciente que tenga "Fiebre".
#############################################################

# El estudiante debe completar a partir de aquí




# SOLUCIÓN
set.seed(123) # Para que los valores aleatorios sean reproducibles
hospital <- data.frame(
  ID = 1:10,
  Temperatura = runif(10, min = 36.0, max = 39.0)
)


hospital$Estado <- ifelse(hospital$Temperatura >= 37.5, "Fiebre", "Normal")

print("Pacientes con Fiebre:")
for (i in 1:nrow(hospital)) {
  if (hospital$Estado[i] == "Fiebre") {
    print(paste("El paciente con ID", hospital$ID[i], "tiene fiebre."))
  }
}



############################################################
# EJERCICIO 2
# Contexto: 
# Un laboratorio de genética mide la pureza de 5 muestras en 4 rondas. 
# Las muestras con una media de pureza baja deben ser gestionadas.
#
# Enunciado:
# 1. Crea una matriz de 5 filas y 4 columnas con valores aleatorios 
#    entre 0.8 y 1.0 (usa runif). Conviértela a DataFrame con as.data.frame().
# 2. Asigna nombres a las columnas: "Ronda1", "Ronda2", "Ronda3", "Ronda4".
# 3. Crea una nueva columna llamada 'Media_Pureza' usando la función 
#    apply() sobre las filas (margin 1) calculando el promedio (mean).
# 4. Utiliza ifelse() anidados para crear la columna 'Resultado':
#    - Si Media_Pureza > 0.95, "Apto".
#    - Si está entre 0.90 y 0.95, "Revisar".
#    - Si es menor a 0.90, "Descartar".
#############################################################

# El estudiante debe completar a partir de aquí




# SOLUCIÓN
set.seed(456)
matriz_pureza <- matrix(runif(20, min = 0.8, max = 1.0), nrow = 5)
laboratorio <- as.data.frame(matriz_pureza)

colnames(laboratorio) <- c("Ronda1", "Ronda2", "Ronda3", "Ronda4")

laboratorio$Media_Pureza <- apply(laboratorio, 1, mean)

laboratorio$Resultado <- ifelse(laboratorio$Media_Pureza > 0.95, "Apto",
                                ifelse(laboratorio$Media_Pureza >= 0.90, "Revisar", "Descartar"))

# Ver resultado
print(laboratorio)



############################################################
# EJERCICIO 3
# Contexto: 
# Tienes un DataFrame con el conteo inicial de células de 5 cultivos. 
# Debes limpiar los nombres y simular el crecimiento final.
#
# Enunciado:
# 1. Crea el DataFrame con:
#    - Muestra: c("  cultivo_A ", " cultivo_B", "CULTIVO_C  ", "Cultivo_D", " cultivo_e ")
#    - Conteo_Inicial: c(100, 150, 200, 50, 300)
# 2. Vectorización: Limpia la columna 'Muestra' eliminando espacios en blanco 
#    (trimws) y convirtiendo a mayúsculas (toupper).
# 3. Simulación: Crea la columna 'Conteo_Final'. Para simplificar, asume que 
#    tras 3 horas de duplicación, el valor es Conteo_Inicial * (2^3). 
#    Hazlo de forma vectorizada.
# 4. Usa sapply() sobre la columna 'Conteo_Final' para calcular la raíz 
#    cuadrada de cada valor y guárdalo en una nueva columna llamada 'Indice'.
#############################################################

# El estudiante debe completar a partir de aquí




# SOLUCIÓN

cultivos <- data.frame(
  Muestra = c("  cultivo_A ", " cultivo_B", "CULTIVO_C  ", "Cultivo_D", " cultivo_e "),
  Conteo_Inicial = c(100, 150, 200, 50, 300)
)

cultivos$Muestra <- trimws(cultivos$Muestra)
cultivos$Muestra <- toupper(cultivos$Muestra)

cultivos$Conteo_Final <- cultivos$Conteo_Inicial * (2^3)

cultivos$Indice <- sapply(cultivos$Conteo_Final, sqrt)

print(cultivos)

# Funciones ----

# Concepto y Uso de una Función ----

# Una función es un bloque de código que podemos reutilizar de forma sencilla y
# orgánica para aplicar la misma operación a diferentes datos. En este curso
# ya hemos visto muchas funciones, pero hemos pasado de lado por ellas, por lo
# que en este bloque aprenderemos realmente a usarlas.

## Uso y Ayuda de una Función ----

### Usar una Función ----
# Cómo hemos ido viendo a lo largo de la clase, las funciones se usar siguiendo la estructura de:
# nombre_funcion(argumento1, argument2, etc); obteniendo un resultado.
round(5.458, 2)

### Usar la Ayuda de una Función ----
# Cuando no sabemos (o no recordamos) como usar una función, las funciones instaladas en R tienen una sección
# de ayuda que nos sirve como guía y descripción de como usar dicha función, además de para que sirve y 
# algunos ejemplos de uso. Para acceder a la ayuda d euna función usamos ?nombre_funcion
?round

## Argumentos de una Función ----

# El aspecto clave como usuarios de una función (además de para que sirve) es saber los argumentos que pide una función.
# Un argumento es un elemento que usa una función para llevar a cabo una operación. Una función puede tener tantos argumentos
# como sea necesarios.
?round # Volviendo a la ayuda de round, vemos que tiene un argumento x y otro argumento digits
round(x = 5.258, digits = 2) # Ésta sería la forma "formal" de llamar a esta función

### Cómo usar los Argumentos de una Función ----
# Aunque siempre podemos usar las funciones mediante su forma "formal", en la mayoría de los casos
# querremos ahorrarnos un poco de código para tareas que conocemos bien. En este aspecto nos centraremos
# en como se usan los argumentos de una función, que siguen una serie de reglas simples:
# Por defecto, si no se indica ningún argumento, se asignan los argumentos por orden

round(5.258, 2) # x = 5.258, digits = 2
round(2, 5.258) # x = 2, digits = 5.258

# Si uno de los argumentos se asignan, el resto sigue el orden, pero el argumento asignado coge el valor que se le da
round(digits = 2, 5.258) # digits = 2, el primer argumento es x, por lo que x = 5.258

# En muchas ocasiones, las funciones definen algunos de estos argumentos asignando un valor por defecto. Es decir, en caso que
# ese argumento no se asigne a ningún valor, toma el preestablecido
?round
round(5.258) # el argumento digits por defecto es cero

?paste # el argumento collapse es NULL
?sample # el argumento replace es FALSE
?log # el argumento base es exp(1)


# RECOMENDACIÓN: Si conocéis una función y es una función simple (2-3 argumentos) podéis usarla sin asignar argumentos
seq(1, 10, 5)
substring("Hola Mundo", 2, 5)
log(10, 2)

# Pero si la función es más compleja o tiene un argumento diferencial que modifica su comportamiento, es mejor definir los argumentos
sample(c(1, 8, 6), size = 2, replace = TRUE)

### Funciones estadísticas ----
# Todas las funciones que aplican operaciones estadísticas a un vector numérico (media, suma, mediana etc) tiene un 
# argumento común que es motivo de muchos fallos en nuestro código
?mean # el argumento na.rm indica si se deben eliminar NAs antes de aplicar la media

vector_na <- 1:10
vector_na[3] <- NA
mean(vector_na) # devuelve NA ya que na.rm por defecto es FALSE
mean(vector_na, na.rm = TRUE) # Ahora elimina el NA y calcula la media


# Crear Funciones ----

# Habrá momentos en los que queramos crear nuestras propias funciones

## Estructura de una Función ----
# Para crear una función usamos la función function, con los elementos de una función: nombre, argumentos, cuerpo y return
# nombre_funcion <- function(arg1, arg2, ...){
#       bloque de código que indique que hace la función (cuerpo)
#       lo que devuelve la función (return)
# }

imprimir_saludo <- function(nombre, apellido){
  texto <- paste("Hola, me llamo", nombre, apellido)
  return(texto)
}

imprimir_saludo("Juan", "Álvarez")
imprimir_saludo("Ana","Torres")

# Como en la función se usa una función vectorizada, podemos usar esta funcionalidad
imprimir_saludo(nombre = c("Juan", "Ana"), apellido = c("Álvarez", "Torres"))

### Scope o Entorno de una función ----
# En la función anterior hemos creado una variable texto dentro de la función, sin embargo esa variable no se
# ha incorporado al entorno. Tampoco los argumentos de dicha función.
# Esto se debe a que las funciones tienen su propio entorno, pueden usar elementos del entorno general pero
# no incorporar sus propios elementos al entorno

nombre <- "Juan"
imprimir_saludo <- function(apellido){
  texto <- paste("Hola, me llamo", nombre, apellido)
  return(texto)
}

imprimir_saludo("Álvarez") # Utiliza la variable nombre del entorno global
apellido # pero si intento acceder a sus elementos, no existen fuera de la función
texto


## ¿Para qué sirve una Función? ----

# Por regla general crearemos una función cuando: queramos ejecutar un mismo proceso varias veces y no exista una función que ya lo haga
# Por ejemplo: función para calcular el área de un triángulo. Lo quiero aplicar varias veces pero no quiero mirar la fórmula cada vez

area_triangulo <- function(base, altura){
  area <- (base * altura) / 2
  return(area)
}
area_triangulo(5, 10)

# También podemos crear una función para añadir funcionalidad a una función ya existente.
# Por ejemplo, quiero crear una función que calcule la media de un vector, pero de forma que na.rm siempre sea TRUE
media <- function(x){
  resultado <- mean(x, na.rm = TRUE)
  return(resultado)
}
media(c(8, 7, 4, NA, 5, 6))

## Buenas Prácticas para crear Funciones ----
# Aunque no es necesario aplicar las siguientes prácticas para trabajar con funciones, si que son muy recomendables

# 1. Documentación. Añade comentarios y documenta tu función. Una versión mínima de una función debería ser:
# Función: calcular_imc
# Descripción: Calcula el Índice de Masa Corporal.
# Argumentos: peso (kg), altura (metros).
# Retorna: Valor numérico del IMC.
calcular_imc <- function(peso, altura) {
  return(peso / (altura^2))
}

# 2. Modularidad. Cuando tengas funciones muy extensas, es posible dividirla en varias funciones más pequeñas
# de modo que controlemos mejor como funciona el proceso  global.
# Ejemplo, queremos calcular la media y la desviación estandar de un vector usando funciones como la que hemos creado anteriormente.
# en lugar de hacer una función con todo el código "crudo" creamos varias funciones y las aplicamos en una función final
media <- function(x){
  resultado <- mean(x, na.rm = TRUE)
  return(resultado)
}

desviacion_estandar <- function(x){
  resultado <- sd(x, na.rm = TRUE)
  return(resultado)
}

obtener_estadisticas <- function(x){
  resultado <- list(media = media(x), desviacion_estandar = desviacion_estandar(x))
  return(resultado)
}
obtener_estadisticas(c(8, 7, 4, NA, 5, 6))

# 3. Checking. Usando las estructuras de control condicionales, podemos controlar que la función se ejecute de forma correcta
obtener_estadisticas <- function(x){
  if (!is.numeric(x)){
    stop("x debe ser un vector numérico") # usamos stop para parar una función y devolver un mensaje
  } 
  resultado <- list(media = media(x), desviacion_estandar = desviacion_estandar(x))
  return(resultado)
}
obtener_estadisticas(c("Hola", "Mundo"))


############################################################
# EJERCICIO 1
# Contexto: 
# Un nutricionista necesita automatizar el cálculo del IMC para varios 
# pacientes y clasificarlos.
#
# Enunciado:
# 1. Crea una función llamada 'analizar_paciente' que reciba 'peso' y 'altura'.
# 2. Dentro, calcula el imc (peso / altura^2).
# 3. Usa un ifelse() o if/else para devolver una lista con dos elementos:
#    - 'valor': El número del IMC.
#    - 'estado': "Normal" si el IMC es < 25, y "Sobrepeso" si es >= 25.
# 4. Prueba la función con un peso de 85 y altura de 1.75.
#############################################################

# El estudiante debe completar a partir de aquí




# SOLUCIÓN

analizar_paciente <- function(peso, altura) {
  # Cálculo del imc
  valor_imc <- peso / (altura^2)
  
  # Clasificación
  estado_paciente <- ifelse(valor_imc < 25, "Normal", "Sobrepeso")
  
  # Retornar lista
  return(list(valor = valor_imc, estado = estado_paciente))
}

# Prueba
analizar_paciente(peso = 85, altura = 1.75)



############################################################
# EJERCICIO 2
# Contexto: 
# En control de calidad, se analizan lotes de productos. Un lote se 
# considera "Rechazado" si la media de sus medidas se desvía demasiado 
# del estándar o si tiene demasiados valores perdidos (NA).
#
# Enunciado:
# 1. Crea la función 'control_calidad' que reciba un vector 'medidas'.
# 2. Checking: Si el vector tiene más de 2 valores NA (usa sum(is.na(x))), 
#    la función debe usar stop() con el mensaje "Lote con demasiados NA".
# 3. Si pasa el check, calcula la media (eliminando NAs).
# 4. La función debe retornar "Lote Aceptado" si la media está entre 
#    18 y 22, de lo contrario debe retornar "Lote Rechazado".
# 5. Prueba con: c(20, 19, NA, 21) y con c(20, NA, NA, NA).
#############################################################

# El estudiante debe completar a partir de aquí




# SOLUCIÓN

control_calidad <- function(medidas) {
  # Checking de NAs
  if (sum(is.na(medidas)) > 2) {
    stop("Lote con demasiados NA")
  }
  
  # Cálculo de la media
  media_lote <- mean(medidas, na.rm = TRUE)
  
  # Condicional de aceptación
  if (media_lote >= 18 & media_lote <= 22) {
    return("Lote Aceptado")
  } else {
    return("Lote Rechazado")
  }
}

# Pruebas
control_calidad(c(20, 19, NA, 21)) # Aceptado
control_calidad(c(20, NA, NA, NA)) # Esto lanzará el error de stop()



############################################################
# EJERCICIO 3
# Contexto: 
# Un centro de investigación quiere procesar un DataFrame de muestras 
# genéticas aplicando una limpieza de texto automática.
#
# Enunciado:
# 1. Crea la función 'limpiar_dataframe' que reciba un dataframe 'df'.
# 2. La función debe:
#    - Identificar la columna llamada "Codigo" y convertirla a mayúsculas.
#    - Identificar la columna "Valor" y sustituir los valores negativos por 0.
#    - Retornar el dataframe modificado.
# 3. Simula un df con: Codigo = c("a1", "b2"), Valor = c(10, -5) y pruébala.
#############################################################

# El estudiante debe completar a partir de aquí




# SOLUCIÓN

limpiar_dataframe <- function(df) {
  # Convertir columna Codigo a mayúsculas
  df$Codigo <- toupper(df$Codigo)
  
  # Sustituir negativos por 0 en Valor (vectorización)
  df$Valor <- ifelse(df$Valor < 0, 0, df$Valor)
  
  return(df)
}

# Simulación y prueba
mi_df <- data.frame(Codigo = c("a1", "b2"), Valor = c(10, -5))
limpiar_dataframe(mi_df)



############################################################
# EJERCICIO 4
# Contexto: 
# Quieres crear una función "resumen_biotec" que automatice las 
# estadísticas de una matriz de ensayos.
#
# Enunciado:
# 1. La función recibe una matriz 'm'.
# 2. Dentro de la función, usa apply() para calcular la media de 
#    cada columna y la media de cada fila.
# 3. La función debe retornar una LISTA con dos elementos: 'por_ensayo' 
#    (medias de columnas) y 'por_paciente' (medias de filas).
# 4. Prueba la función con una matriz de 3x3 de números aleatorios.
#############################################################

# El estudiante debe completar a partir de aquí




# SOLUCIÓN

resumen_biotec <- function(m) {
  # Medias de columnas (ensayos)
  ensayos <- apply(m, 2, mean)
  
  # Medias de filas (pacientes)
  pacientes <- apply(m, 1, mean)
  
  # Retorno de lista estructurada
  return(list(por_ensayo = ensayos, por_paciente = pacientes))
}

# Prueba con matriz aleatoria 3x3
matriz_test <- matrix(runif(9, 1, 10), nrow = 3)
resumen_biotec(matriz_test)



############################################################
# EJERCICIO 5
# Contexto: 
# Un laboratorio recibe datos de ensayos en una lista de listas. 
# Cada lote contiene: nombre, matriz de resultados y un umbral.

# DATOS DE ENTRADA
set.seed(123)
datos_ensayo <- list(
  lote1 = list(nombre = "Alfa",  matriz = matrix(runif(9, 5, 10), nrow=3), umbral = 7),
  lote2 = list(nombre = "Beta",  matriz = matrix(runif(9, 2, 5),  nrow=3), umbral = 4),
  lote3 = list(nombre = "Gamma", matriz = matrix(runif(9, 0, 10), nrow=3), umbral = 8)
)

# ENUNCIADO:
# 1. Crea una función llamada 'procesar_laboratorio' que reciba 
#    la lista 'datos_ensayo'.
# 2. La función debe recorrer cada lote (usa un bucle for o lapply).
# 3. Para cada lote, debe calcular la media de su 'matriz'.
# 4. Usando un condicional (if o ifelse), determinar el veredicto:
#    - Si media >= umbral: "APROBADO"
#    - Si media < umbral: "RECHAZADO"
# 5. La función debe retornar un DataFrame con 3 columnas: 
#    'Lote_Nombre', 'Media_Obtenida' y 'Veredicto'.

# PISTA: Puedes crear vectores vacíos antes del bucle para ir 
# guardando los datos de cada lote y luego unirlos en el dataframe.
#############################################################

# El estudiante debe completar a partir de aquí




# SOLUCIÓN

procesar_laboratorio <- function(lista_lotes) {
  
  # Creamos vectores vacíos para ir almacenando los resultados de cada iteración
  nombres <- c()
  medias  <- c()
  verdictos <- c()
  
  # Usamos un bucle para recorrer la lista de lotes
  for (i in 1:length(lista_lotes)) {
    
    # Extraemos el lote actual
    lote_actual <- lista_lotes[[i]]
    
    # Calculamos la media global de la matriz de ese lote
    media_global <- mean(lote_actual$matriz)
    
    # Lógica condicional para el veredicto
    veredicto_final <- ifelse(media_global >= lote_actual$umbral, "APROBADO", "RECHAZADO")
    
    # Guardamos los resultados en nuestros vectores
    nombres <- c(nombres, lote_actual$nombre)
    medias  <- c(medias, round(media_global, 2))
    verdictos <- c(verdictos, veredicto_final)
  }
  
  # Construimos el DataFrame final con los vectores recolectados
  df_resumen <- data.frame(
    Lote_Nombre = nombres,
    Media_Obtenida = medias,
    Veredicto = verdictos
  )
  
  return(df_resumen)
}

procesar_laboratorio(datos_ensayo)

# TIDYR ----
library(tidyverse)

## Pasar de untidy a tidy. pivot_longer() ----
# El uso de pivot_longer es:
# untidy %>% pivot_longer(cols = columnas que quiero convertir a variable,
#  names_to = nombre de esta nueva columna, 
#  values_to = nombre de la columna que almacena valores)

ventas_fruta <- data.frame(
  Producto = c("Manzanas", "Peras", "Plátanos", "Uvas", "Naranjas"),
  Enero = c(100, 120, 150, 80, 90),
  Febrero = c(110, 130, 160, 85, 95),
  Marzo = c(105, 125, 155, 82, 92)
)

ventas_tidy <- ventas_fruta %>%
  pivot_longer(
    cols = c(Enero, Febrero, Marzo), # Las columnas que queremos "colapsar", no es necesario poner comillas
    names_to = "Mes",                # El nombre de la nueva columna de categorías
    values_to = "Cantidad"           # El nombre de la nueva columna de valores
  )

# Un caso especial es cuando tenemos en nuestro dataframe nombres de filas
matriz_expresion <- matrix(rnorm(100000), nrow = 1000) # matriz de 1000 filas y 100 columnas
colnames(matriz_expresion) <- paste0("Ind_", 1:ncol(matriz_expresion))
rownames(matriz_expresion) <- paste0("Gen_", 1:nrow(matriz_expresion))
dataframe_expression <- as.data.frame(matriz_expresion)

tidy_expression <- dataframe_expression %>%
  rownames_to_column("Gen") %>% # crea una nueva columna llamada Gen con el valor de las filas
  pivot_longer(cols = colnames(matriz_expresion), # Las columnas que queremos colapsar son todas las de la matriz
               names_to = "Individuo", # el nombre de la nueva columna de categorías
               values_to = "Expresion") # el nombre de la nueva columna de valores

## Pasar de tidy a untidy. pivot_wider() ----
# El uso de pivot_wider es:
# tidy %>% pivot_wider(names_from = nombre de la columna que queremos expandir, 
#  values_from = nombre de la columna que almacena valores que irán en las celdas)

ventas_untidy <- ventas_tidy %>%
  pivot_wider(
    names_from = Mes,      # ¿De qué columna sacamos los nuevos encabezados?
    values_from = Cantidad  # ¿De qué columna sacamos los números?
  )

# Volviendo al caso especial de los rownames, usamos de apoyo la función column_to_rownames
untidy_expression <- tidy_expression %>%
  pivot_wider(names_from = Individuo, values_from = Expresion) %>%
  column_to_rownames("Gen") %>%
  as.matrix()


############################################################
# EJERCICIO 1
# Contexto:
# Transformación de datos de un ensayo clínico de formato ancho 
# (untidy) a formato largo (tidy) y viceversa, a partir del dataframe inicial.
#
# Enunciado:
# 1. Transformación a formato TIDY (Largo).
# 2. Operación Inversa (Volver a formato ancho).
#############################################################

# El estudiante debe completar a partir de aquí

ensayo_clinico <- data.frame(
  Paciente_ID = c("P01", "P02", "P03", "P04"),
  T0 = c(0.0, 0.0, 0.0, 0.0),
  T1 = c(12.5, 15.2, 11.8, 14.0),
  T2 = c(8.4, 9.1, 7.5, 8.8)
)






# SOLUCIÓN

ensayo_tidy <- ensayo_clinico %>% 
  pivot_longer(
    cols = c(T0, T1, T2),
    names_to = "Tiempo",
    values_to = "Concentracion"
  )

ensayo_back_to_wide <- ensayo_tidy %>%
  pivot_wider(
    names_from = Tiempo,
    values_from = Concentracion
  )


# Funciones esenciales para trabajar con tablas ----

## select(). Seleccionar columnas ----

### Seleccionar Columnas ----

# Podemos usar select() tanto indicando las columnas que queremos como las que no queremos
storms %>% select(name, year) # quiero las columnas name y year
storms %>% select(-name, -year) # quiero todas las columnas salvo name y year

# Podemos usar un vector externo junto a las funciones all_of o any_of
columnas <- c("name", "year", "month")
storms %>% select(all_of(columnas)) # all_of da error si alguna columna no existe
storms %>% select(any_of(columnas)) # any_of no da error, solo filtra las que estén

# Podemos usar cualquier filtro
storms %>% select(where(is.numeric)) # filtrar columnas numéricas
storms %>% select(starts_with("nam")) # columnas que empiecen con "nam"

### Cambiar Nombre a Columnas ----
storms %>%
  select(Nombre = name, Viento = wind) # Devuelve las columnas a las que se ha cambiado el nombre 
# (nuevo nombre = nombre antiguo)

# Junto a la función everything() podemos obtener la tabla completa
storms %>%
  select(Nombre = name, Viento = wind, everything()) # Devuelve todas las columnas 

## filter(). Filtrar filas ----

### Filtros con operadores lógicos ----
# Uso estándar
storms %>% filter(wind > 40)

# Filtrar usando vector externo
nombre_tormentas <- c("Amy", "Blanche")
storms %>% filter(name %in% nombre_tormentas)
storms %>% filter(!name %in% nombre_tormentas)

# Filtrar valores faltantes
storms %>% filter(!is.na(category))

### Filtros con varias condicones (AND y OR) ----
# AND se puede indicar mediante el operador & o con ,
storms %>% filter(wind > 40, name %in% nombre_tormentas)
storms %>% filter(wind > 40 & !name %in% nombre_tormentas)
# OR se indica con el operador |
storms %>% filter(wind > 40 | name %in% nombre_tormentas)

### distinct() ----
# Es una variante de filter(), que nos permite eliminar filas duplicadas
storms %>%
  distinct(name, year, month, day)

# Usando .keep_all =TRUE, no elimina el resto de columnas, devuelve la primera combinación única
storms %>%
  distinct(name, year, month, day, .keep_all = TRUE)

### slice() ----

#### slice(). filtrar filas por posición
storms %>% slice(c(1, 5, 8)) # filas 1, 5 y 8

#### slice_head() slice_tail()
storms %>% slice_head(n = 10) # 10 primeras filas

#### slice_sample()
storms %>% slice_sample(n = 10) # 10 filas al azar

## arrange(). Ordenar la tabla ----

### Por defecto: de menor a mayor
storms %>%
  arrange(wind)

# Podemos incorporar más columnas por las que ordenar, de forma que, en caso de empate en la primera columna
# use la segunda
storms %>%
  arrange(wind, year) # si hay empate de wind, usa year para ordenar


### Orden descendente ----
storms %>%
  arrange(desc(wind)) # de mayor a menor

# Podemos combinar variables para ordenar
storms %>%
  arrange(desc(wind), year) # ordena de mayor a menor por tiempo, en caso de empate, ordena de menor a mayor los años

## mutate(). Crear nuevas variables ----
storms %>%
  mutate(NAME = toupper(name), # crear nueva columna
         kmh = wind * 1.852, # crear nueva columna
         name = factor(name)) %>% # formatear columna existente
  select(name, NAME, wind, kmh)

## pull(). Obtener un vector ----
storms %>% pull(name) 


#############################################################
# EJERCICIO 1
# Contexto:
# En el estudio de la biodiversidad de la Antártida, es crucial identificar 
# ejemplares con medidas morfológicas atípicas. Se desea analizar a los 
# pingüinos de la especie "Gentoo" que presentan un pico especialmente largo.
#
# Enunciado:
# Usando la tabla 'penguins' del paquete 'palmerpenguins', realiza los 
# siguientes pasos:
# 1. Filtra las filas para quedarte solo con la especie "Gentoo" y donde 
#    la longitud del pico ('bill_length_mm') no sea un valor faltante.
# 2. Selecciona las columnas 'species', 'island' y 'bill_length_mm'.
# 3. Ordena la tabla de mayor a menor según la longitud del pico.
# 4. Extrae los 5 registros con los picos más largos.
#############################################################

# El estudiante debe completar a partir de aquí
library(palmerpenguins)
data("penguins")



# SOLUCIÓN

penguins %>%
  filter(species == "Gentoo", !is.na(bill_length_mm)) %>%
  select(species, island, bill_length_mm) %>%
  arrange(desc(bill_length_mm)) %>%
  slice_head(n = 5)


#############################################################
# EJERCICIO 2
# Contexto:
# Un equipo de botánica está revisando la base de datos clásica 'iris'. 
# Para un nuevo análisis computacional, necesitan estandarizar los nombres 
# de las variables y filtrar las muestras de la especie "virginica" que 
# cumplen ciertos criterios de tamaño de pétalo.
#
# Enunciado:
# 1. Selecciona todas las columnas de 'iris' pero renombra 'Species' a 'especie' 
#    y 'Petal.Length' a 'longitud_petalo'.
# 2. Filtra los registros que sean de la especie "virginica" Y tengan una 
#    'longitud_petalo' mayor a 5.5.
# 3. Crea una nueva columna llamada 'proporcion_petalo' que sea el resultado 
#    de dividir 'longitud_petalo' entre 'Petal.Width'.
#############################################################

# El estudiante debe completar a partir de aquí
data("iris")



# SOLUCIÓN

iris %>%
  select(especie = Species, longitud_petalo = Petal.Length, everything()) %>%
  filter(especie == "virginica", longitud_petalo > 5.5) %>%
  mutate(proporcion_petalo = longitud_petalo / Petal.Width)


#############################################################
# EJERCICIO 3
# Contexto:
# Se están analizando los resultados de un experimento sobre el crecimiento 
# dental en cobayas (dataset 'ToothGrowth'). Los investigadores quieren 
# aislar las mediciones de dosis altas para un análisis de varianza.
#
# Enunciado:
# 1. Utiliza el dataset 'ToothGrowth'.
# 2. Filtra las filas donde la dosis ('dose') sea igual a 2.0.
# 3. Extrae los valores resultantes como un vector numérico.
#############################################################

# El estudiante debe completar a partir de aquí
data("ToothGrowth")



# SOLUCIÓN

ToothGrowth %>%
  filter(dose == 2.0) %>%
  pull(len)


#############################################################
# EJERCICIO 4
# Contexto:
# El dataset 'msleep' contiene información sobre los hábitos de sueño de 
# diferentes mamíferos. Un veterinario está interesado en comparar el sueño 
# rem y el peso corporal de ciertos animales para un estudio metabólico.
#
# Enunciado:
# 1. De la tabla 'msleep', selecciona las columnas 'name', 'genus', 
#    'sleep_rem' y 'bodywt'.
# 2. Filtra para eliminar las filas donde el sueño rem ('sleep_rem') sea NA.
# 3. Crea una nueva variable llamada 'peso_log' que sea el logaritmo natural
#    del peso corporal 'bodywt'.
# 4. Selecciona una muestra aleatoria de 5 animales de esta lista filtrada.
# 5. Ordena la tabla de forma descendente por 'sleep_rem'.
#############################################################

# El estudiante debe completar a partir de aquí
data("msleep")



# SOLUCIÓN

msleep %>%
  select(name, genus, sleep_rem, bodywt) %>%
  filter(!is.na(sleep_rem)) %>%
  mutate(peso_log = log(bodywt)) %>%
  slice_sample(n = 5) %>%
  arrange(desc(sleep_rem))


# Agrupar y Calcular ----

## summarize() o summarise() ----

# Se utiliza para resumir una columna aplicando cálculos en los valores de la misma
storms %>%
  summarise(media = mean(wind), # media global de wind
            primer_nombre_alfabetico = min(name)) # primer nombre en orden alfabético

## group_by() / ungroup() ----
# Sin embargo, summarise() se suele utilizar acompañado de group_by()
# Por si solo, group_by() no hace nada, tan solo señala los grupos
storms %>%
  group_by(name) # indica que hay 268 grupos en name

# Junto a summarise(), nos permite realizar cálculos por categorías o grupos
storms %>%
  group_by(status) %>%
  summarise(media_wind = mean(wind),
            sd_wind = sd(wind))

# podemos agrupar por más de una variable
storms %>%
  group_by(status, year) %>%
  summarise(media_wind = mean(wind),
            sd_wind = sd(wind))

# aunque no siempre es necesario, se recomienda que una vez se hagan los cálculos
# se desagrupen las columnas con ungroup()

storms %>%
  group_by(status, year) %>%
  summarise(media_wind = mean(wind),
            sd_wind = sd(wind)) %>%
  ungroup()

### group_by() y mutate() ----

# Aunque se use en raras ocasiones, podemos usar group_by y mutate para crear una nueva columna
# cuyo valor esté agregado por otra varible. Por ejemplo: calcular zscore de wind por name
storms %>%
  group_by(name) %>%
  mutate(zscore = (wind - mean(wind) / sd(wind))) %>%
  select(name, wind, zscore) %>%
  ungroup()

### count() ----
# Usamos count() para contar casos (filas)
storms %>%
  count() # número de filas, columna n() por defecto

storms %>%
  group_by(status) %>%
  count() # número de filas por status, la columna se llama n

# De forma alternativa podemos usar summarise con la función n(), de este modo podemos llamar a la columna
# como queramos
storms %>%
  group_by(status) %>%
  summarise(conteo = n())


## across() ----
# La función definita es across, nos permite realizar tantas operaciones sobre las columnas que se indiquen como queramos
# Antes de ver como funciona, vamos a calcular la media y la sd de las columnas: wind, year, day (agrupando por status)

# aunque resulkta mucho más breve que hacerlo con R base, es bastante tedioso
storms %>%
  group_by(status) %>%
  summarise(wind_media = mean(wind),
            wind_sd = sd(wind),
            year_media = mean(year),
            year_sd = sd(year),
            day_media = mean(day),
            day_sd = sd(day)) %>%
  ungroup()

# con accross se haría así:
storms %>%
  group_by(status) %>%
  summarise(
    across(c(wind, year, day), # definimos las columnas sobre las que se van a realizar los cálculos
           list(media = ~ mean(.), sd = ~ sd(.))) # se indican las operaciones que se van a hacer, usamos ~
  ) %>%
  ungroup()

# si quisiéramos aplicar una misma operación a todos los datos de un mismo tipo (por ejemplo a todas
# las variables numéricas, usamos where

storms %>%
  group_by(status) %>%
  summarise(
    across(where(is.numeric), # definimos las columnas sobre las que se van a realizar los cálculos (todas las numéricas)
           list(media = ~ mean(.), sd = ~ sd(.))) # se indican las operaciones que se van a hacer, usamos ~
  ) %>%
  ungroup()

# Para cambiar los nombres de las variables que se crean usamos el parámetro .names
storms %>%
  group_by(status) %>%
  summarise(
    across(c(wind), # definimos las columnas sobre las que se van a realizar los cálculos
           list(media = ~ mean(.), sd = ~ sd(.)),
           .names = "{.fn}_{.col}") # ahora las columnas se llamaran función_columna (media_wind)
  ) %>%
  ungroup()



#############################################################
# EJERCICIO 1
# Contexto:
# Un equipo de ornitología está estudiando el dimorfismo sexual en los 
# pingüinos de la Antártida. Necesitan conocer el peso promedio de cada 
# especie para determinar si existen diferencias significativas según el sexo.
#
# Enunciado:
# Utilizando la tabla 'penguins' del paquete 'palmerpenguins':
# 1. Elimina los NA de la columna "sex"
# 2. Agrupa los datos por las columnas 'species' y 'sex'.
# 3. Calcula la media de la masa corporal ('body_mass_g') bajo el nombre 'media_peso'.
# 4. Utiliza la función adecuada para contar cuántos pingüinos hay en cada grupo.
# 5. Asegúrate de desagrupar la tabla al final.
#############################################################

# El estudiante debe completar a partir de aquí
library(palmerpenguins)
data("penguins")



# SOLUCIÓN

penguins %>%
  filter(!is.na(sex)) %>%
  group_by(species, sex) %>%
  summarise(media_peso = mean(body_mass_g),
            n_pinguinos = n()) %>%
  ungroup()


#############################################################
# EJERCICIO 2
# Contexto:
# En botánica, la variabilidad de las medidas florales es un indicador de la 
# diversidad genética. Se requiere un resumen estadístico rápido de todas las 
# variables numéricas de la flor 'iris' para cada una de las especies.
#
# Enunciado:
# 1. Carga el dataset 'iris'.
# 2. Cambia los nombres de las variables a castellano
# 3. Agrupa la tabla por la columna 'Species'.
# 4. Utiliza 'across()' para calcular simultáneamente la media (mean) y la 
#    desviación típica (sd) de todas las columnas numéricas.
# 5. Los resultados deben aparecer con los sufijos "Media_columna" y "SD_columna".
#############################################################

# El estudiante debe completar a partir de aquí
data("iris")



# SOLUCIÓN

iris %>%
  select(Especies = Species,
         Longitud_Petalo = Petal.Length,
         Longitud_Sepalo = Sepal.Length,
         Ancho_Petalo = Petal.Width,
         Ancho_Sepañp = Sepal.Width) %>%
  group_by(Especies) %>%
  summarise(across(where(is.numeric), 
                   list(Media = ~ mean(.), SD = ~ sd(.)),
                   .names = "{.fn}_{.col}")) %>%
  ungroup()


#############################################################
# EJERCICIO 3
# Contexto:
# Un laboratorio está probando la eficacia de la vitamina C en el crecimiento 
# dental de cobayas. Para normalizar los datos, quieren comparar cada 
# medición individual con el promedio de su propio grupo de tratamiento.
#
# Enunciado:
# 1. Utiliza el dataset 'ToothGrowth'.
# 2. Agrupa los datos por el tipo de suplemento ('supp').
# 3. Crea una nueva columna llamada 'media_suplemento' que contenga la media 
#    de la longitud del diente ('len') de su respectivo grupo.
# 4. Crea otra columna llamada 'diferencia' que sea la resta entre 'len' y 
#    la media del grupo.
# 5. Desagrupa y selecciona solo las columnas 'supp', 'len' y 'diferencia'.
#############################################################

# El estudiante debe completar a partir de aquí
data("ToothGrowth")



# SOLUCIÓN

ToothGrowth %>%
  group_by(supp) %>%
  mutate(media_suplemento = mean(len),
         diferencia = len - media_suplemento) %>%
  ungroup() %>%
  select(supp, len, diferencia)


#############################################################
# EJERCICIO 4
# Contexto:
# Un estudio sobre ecología evolutiva analiza los patrones de sueño en mamíferos 
# según su dieta (vore). El investigador necesita un informe final que 
# resuma las horas de sueño total y el peso cerebral.
#
# Enunciado:
# 1. Utiliza el dataset 'msleep'.
# 2. Filtra la tabla para eliminar las filas donde 'vore' sea NA.
# 3. Agrupa por la categoría de dieta ('vore').
# 4. Calcula la media y el valor máximo de las columnas 'sleep_total' y 'brainwt'.
# 5. Usa 'across()' para realizar estos cálculos en una sola instrucción.
# 6. Cuenta cuántas especies pertenecen a cada categoría de dieta.
#############################################################

# El estudiante debe completar a partir de aquí
data("msleep")



# SOLUCIÓN

msleep %>%
  filter(!is.na(vore)) %>%
  group_by(vore) %>%
  summarise(across(c(sleep_total, brainwt), 
                   list(media = ~ mean(., na.rm = TRUE), 
                        maximo = ~ max(., na.rm = TRUE))),
            n_especies = n()) %>%
  ungroup()


# Unir Tablas ----

## Funciones _join() ----
# Funciones para unir dos tablas usando una clave (columna) común entre ellas

# inner_join() -> Une las filas con claves en ambos datasets
# left_join() -> Mantiene todas las filas del primer dataset, independientemente de que en el segundo falte alguna (Rellena con NA)
# right_join() -> Mantiene todas las filas del segundo dataset, independientemente de que en el primero falte alguna (Rellena con NA)
# full_join() -> Mantiene todas las filas en ambos datasets, aunque hay alguna que falte en alguno de ellos (rellena con NA)

## Uso _join() ----
# Además de las dos tablas que se quieren unir, se usa el parámetros by de las funciones _join.
# by indica que clave se utiliza en cada tabla by = c("Clave primer tabla" = "Clave segunda tabla")
# La primera tabla es siempre la de la izquierda, la segunda tabla es la de la derecha
tidy_expression %>% # primera tabla
  left_join(
    metadata, # segunda tabla
    by = c("Individuo" = "Individuo") # indicamos la clave en cada tabla
  )

# en caso que ambas tablas tengan la misma clave, podemos obviar usar by ya que las funciones
# buscarán columnas en común
tidy_expression %>% # primera tabla
  left_join(
    metadata, # segunda tabla
  )

## Ejemplo de cada _join ----

metadata_casos <- metadata %>%
  filter(Grupo != "Caso")

### inner_join() ----
tidy_expression %>%
  inner_join(metadata_casos) # solo une las filas de ambas tablas que estén en ambos datasets

### left_join() ----
tidy_expression %>%
  left_join(metadata_casos) # mantiene filas de la primera tabla aunque no estén en la segunda

### right_join() ----
tidy_expression_some <- tidy_expression %>%
  head(20)
tidy_expression_some %>%
  right_join(metadata_casos) # mantiene filas de la segunda tabla aunque no estén en la primera

### full_join() ----
tidy_expression_some %>%
  full_join(metadata_casos) # mantiene todas las filas de ambas columnas


#############################################################
# EJERCICIO 1
# Contexto:
# En Bioinformática, uno de los retos más comunes es analizar datos de RNA-Seq.
# Para ilustrar un ejemplo, se va a instalar la librería DESeq2 de Bioconductor
# que almacena un set de datos de prueba con counts y anotación de muestras.
#
# Enunciado:
# 1. Carga los datasets de counts (cts) y anotación (coldata)
# 2. Transforma "coldata" en tidy añadiendo el nombre de las filas a una columna, también hay que eliminar 
# el 'fb' del final
# 3. Transforma la matriz de counts a tidy (LARGO). Intenta llamar a la columna de muestras
# igual que se llama en coldata
# 4. Filtra los genes para mantener los 10 primeros
# 5. Une cts y coldata
#############################################################

# El estudiante debe completar a partir de aquí
install.packages("BiocManager") # instalar bioconductor
BiocManager::install("DESeq2") # instalar DESeq2
pasCts <- system.file("extdata", # obtener ruta a fichero de counts
                      "pasilla_gene_counts.tsv.gz",
                      package="DESeq2", mustWork=TRUE)
pasAnno <- system.file("extdata", # obtener ruta a fichero de anotación
                       "pasilla_sample_annotation.csv",
                       package="DESeq2", mustWork=TRUE)

cts <- as.matrix(read.csv(pasCts,sep="\t",row.names="gene_id")) # Leer fichero de counts
coldata <- read.csv(pasAnno, row.names=1) # Leer fichero de anotación


# SOLUCIÓN

coldata <- coldata %>%
  rownames_to_column("Muestra") %>%
  mutate(Muestra = gsub("fb", "", Muestra))

cts <- cts %>%
  as.data.frame() %>%
  rownames_to_column("Gen") %>%
  pivot_longer(cols = colnames(cts), names_to = "Muestra", values_to = "Expresion")

genes <- unique(cts$Gen)[1:10]
cts <- cts %>%
  filter(Gen %in% genes)

cts %>%
  left_join(coldata)

# Capas DATA y AESTHETIC GGPLOT2 ----

## DATA ----
# Hace referencia a los datos que se incuyen. Deben estar en tidydata.

### Métodos de Entrada ----
# Aunque el método más normal para introducir DATA es en la función ggplot(data = DATA)
ggplot(data = penguins, aes(x = bill_depth_mm, y = bill_length_mm))+
  geom_point()

# Se pueden introducir también en las funciones de geometrías usando esta estructura
ggplot()+ # siempre es necesario
  geom_point(data = penguins, aes(x = bill_depth_mm, y = bill_length_mm))

# Usaremos este segundo método en los casos en los que vayamos a añadir varios DATA en un mismo gráfico
ggplot()+ # siempre es necesario
  geom_point(data = penguins, aes(x = bill_depth_mm, y = bill_length_mm)) +
  geom_text(data = penguins %>% slice_head(n = 1), aes(x = bill_depth_mm, y = bill_length_mm, label = species))

# También podemos incorporar DATA usando dplyr
penguins %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm)) +
  geom_point()


## AESTHETIC  ----
# Hace referencia a las características estéticas que describen cómo queremos los datos que se vean en el gráfico.
# Las principales caracterísitcas estéticas que usaremos son: posición en los ejes, color exterior, color de relleno (fill),
# forma de los puntos (shape), opacidad (alpha), tipo de línea (linetype), grosor de línea (linewidth) y tamaño (size).
# No todos los objetos geométricos tienen los mismos aesthetic: por ejemplo un gráfico de barras no tendrá shape, pero si color
# de relleno.

# Podemos diferenciar las estéticas según si son valores fijos o están mapeadas con alguna variable

### AESTHETIC FIJOS ----

# Características estéticas fijas, como por ejemplo poner todos los puntos del mismo color

# No se declaran en la función aes()
ggplot(data = penguins, aes(x = bill_depth_mm, y = bill_length_mm))+
  geom_point(color = "turquoise", alpha = 0.7)

# Los colores se pueden declarar usando los nombres de algunos colores predefinidos
# https://sape.inf.usi.ch/quick-reference/ggplot2/colour
# O usando el código hexadecimal: "#54EBE4", "#54C1EB"

ggplot(data = penguins, aes(x = bill_depth_mm, y = bill_length_mm))+
  geom_point(color = "#54EBE4", alpha = 0.7)

### AESTHETIC MAPEADOS ----

# Características estéticas dinámicas que se asocian a una variable, como por ejemplo colorear cada grupo de un color
ggplot(data = penguins, aes(x = bill_depth_mm, y = bill_length_mm, color = species))+ # se especifica en aes()
  geom_point(alpha = 0.7)

# De forma recomendada, para evitar problemas futuros, definiremos la estética de cada geometría en su función
# salvo x e y
ggplot(data = penguins, aes(x = bill_depth_mm, y = bill_length_mm))+ # se especifica en aes()
  geom_point(alpha = 0.7, aes(color = species))

# Se pueden añadir varias estéticas
ggplot(data = penguins, aes(x = bill_depth_mm, y = bill_length_mm))+ # se especifica en aes()
  geom_point(alpha = 0.7, aes(color = species, shape = island))

### Variables Categóricas en los AESTHETIC ----

# Como se ha podido apreciar, los AESTHETIC transforman las variables de texto a factores.
# Por defecto, el orden de los factores se realiza por defecto (alfabético) pero como vimos
# podemos modificar este comportamiento

penguins %>%
  mutate(species = factor(species, levels = c("Gentoo", "Adelie", "Chinstrap"))) %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm, color = species)) + 
  geom_point(alpha = 0.7)

# Lo mismo ocurre cuando queremos usar cualquier variable categórica como eje
penguins %>%
  ggplot(aes(x = species, y = bill_length_mm, color = species)) + 
  geom_point(alpha = 0.7)

# Si queremos cambiar el orden, tan solo modificad el factor
penguins %>%
  mutate(species = factor(species, levels = c("Gentoo", "Adelie", "Chinstrap"))) %>%
  ggplot(aes(x = species, y = bill_length_mm, color = species)) + 
  geom_point(alpha = 0.7)


#############################################################
# EJERCICIO 1
# Contexto:
# Evaluar el tamaño del cerebro y el cuerpo de las especies del dataset msleep
#
# Enunciado:
# 1. Carga el dataset msleep
# 2. Genera gráfico simple de puntos con bodywt en eje X y brainwt en eje Y. Añade un alpha de 0.7 y
# pinta los puntos de color "orange"
# 3. Genera gráfico simple de puntos con bodywt en eje X y brainwt en eje Y. Añade un alpha de 0.7 y
# pinta los puntos según la columna "vore"
#############################################################

# El estudiante debe completar a partir de aquí
data("msleep")



# SOLUCIÓN

msleep %>%
  ggplot(aes(x = bodywt, y = brainwt))+
  geom_point(alpha = 0.7, color = "orange")

msleep %>%
  filter(!is.na(vore)) %>%
  ggplot(aes(x = bodywt, y = brainwt))+
  geom_point(alpha = 0.7, aes(color = vore))


#############################################################
# EJERCICIO 2
# Contexto:
# Evaluar el tiempo despierto y el peso del cerebro de la base de datos msleep
#
# Enunciado:
# 1. Carga el dataset msleep
# 2. Genera gráfico simple de puntos con awake en eje Y y brainwt en eje X. La forma de los puntos depende
# de el estado de conservación (conservation)
# 3. Genera el gráfico anterior, añade el nombre (name) de los dos animales con mayor valor de brainwt
#############################################################

# El estudiante debe completar a partir de aquí
data("msleep")



# SOLUCIÓN

msleep %>%
  filter(!is.na(conservation)) %>%
  ggplot(aes(y = awake, x = brainwt))+
  geom_point(aes(shape = conservation))

msleep %>%
  filter(!is.na(conservation)) %>%
  ggplot(aes(y = awake, x = brainwt))+
  geom_point(aes(shape = conservation))+
  geom_text(data = msleep %>% filter(!is.na(conservation)) %>% arrange(desc(brainwt)) %>% head(2),
            aes(y = awake, x = brainwt, label = name))
### Concepto de Variable
## ¿Qué son?
# Una variable es un "contenedor" con un nombre que almacena datos.
# Nos permite reutilizar información a lo largo del código sin escribirla de nuevo.

## ¿Cómo se asignan?
# En R se utiliza preferentemente el operador <- (ALT + Guión (-)).
# Aunque el signo = también funciona, <- es la norma de estilo en R.
# Estructura => nombre_variable <- valor_variable
mi_numero=25 # sin espacios
mi_numero = 25 # con espacios (más decorativo)
mi_numero <- 25 # ALT + Guión (-); con espacios y usando <- (más decorativo y más profesional)

## ¿Cómo se que se ha creado una variable? -> Comprobar el Environment
# Una vez ejecutas la línea de asignación, la variable aparecerá en la pestaña 
# "Environment" (Entorno) de RStudio (panel superior derecho). 
# Si modifico la variable es como si la eliminase y la crease de nuevo
mi_numero <- 24

# Para conocer su valor simplemente la ejecutamos
mi_numero

## Reglas y consejos para los nombres de variables

# Regla 1. NUNCA empezar el nombre de una variable por un número
# INCORRECTO: 8precios <- 1:8

# Regla 2. NUNCA debe contener espacios, comas, barras, guiones, tildes, ñ... Tan solo números (y no al principio),
# letras y dos símbolos ("_" y ".)

# INCORRECTO: precios-supermercado
# CORRECTO: precios_supermercado <- 1:8 ó precios.supermercado <- 1:8

# Regla 3. Al igual que para las funciones y las cadenas de texto, R es case sensitive, es decir, distingue mayúsculas de minúsculas
# Podemos crear una variable "dato" pero si luego la usamos como "Dato" dará una error, ya que la variable "Dato" no existe

# Consejo 1. Siempre intentad usar nombres de variables que sean explicativas
# En el ejemplo de precios_supermercado se explica claramente a que se refiere
# Si esa misma variable con el mismo valor e intención se llamase "a" no tendría sentido

# Consejo 2. Si no queréis usar "_" ni ".", para nombres complejos se aconseja usar la nomenclatura
# "joroba de camello", que consiste en usar mayúscula en la primera letra de todas las palabras salvo
# en la primera. Ejemplo: precioSupermercado. Esto es solo una conveción social, vosotros podéis llamar
# a vuestra variable como queráis siempre que cumpla con las Reglas 1 y 2 y teniendo cuidado con la Regla 3

## TRUCO
# Si empezáis a escribir el nombre de una variable ("MI_N") os saldrá automáticamente un set de opciones
# También salen si pulsáis TABULADOR. Podéis elegir la opción que convenga; en este caso "mi_numero".
# De este modo: 1) ahorráis escritura y 2) evitáis errores tipográficos


## Vamos a crear variables

# Las variables pueden contener cualquier tipo de dato: número, texto, booleano, factor, vectores, matrices, dataframes y listas

# Utilidad 1, nos permite procesar un mismo datos sin tener que escribirlo

# Imaginad que quiero hacer la siguiente operación: 145879 * (145879 + 10) - 145879

145879 * (145879 + 10) - 145879 # las probabilidades de equivocarse escribiendo son altas, además de que se tarda demasiado

mi_numero <- 145879 # si asigno el número a la variable mi_numero
mi_numero * (mi_numero + 10) - mi_numero  # puedo reutilizarla las veces que sean necesarias

# ¿Os acordáis de bloque de código de las matrices?

# Esto es muy tedioso de escribir
matrix(1:9, nrow = 3, ncol = 3)[1, 3] # accedo a la fila 1, columna 3
matrix(1:9, nrow = 3, ncol = 3)[1, ] # accedo a la fila 1, todas las columnas (no se indica ninguna, por lo que son todas)
matrix(1:9, nrow = 3, ncol = 3)[, 3] # accedo a todas las filas (no se indica ninguna, por lo que son todas), de la columna 3

matriz1 <- matrix(1:9, nrow = 3, ncol = 3) # crea una variable matriz1 con el valor de la matriz
matriz1[1,3] # accedo a la fila 1, columna 3
matriz1[1, ] # accedo a la fila 1, todas las columnas (no se indica ninguna, por lo que son todas)
matriz1[, 3] # accedo a todas las filas (no se indica ninguna, por lo que son todas), de la columna 3

# Utilidad 2, almacena información de una operación

matriz1[1,3] # saca por consola un valor, pero no puedo hacer nada con ese valor -> lo guardo como variable
mi_numero <- matriz1[1,3] # ahora mi_numero obtiene el dato
mi_numero * 10 # Y puedo reutilizarlo

# Utilidad 3, evita modificar todo el código cuando cambiamos algo

# imagina que trabajo con este vector
c(8, 7, 4, 5, 10)

res_multiplicacion <- c(8, 7, 4, 5, 10) * 10
res_division <- c(8, 7, 4, 5, 10) / 10
res_suma <- c(8, 7, 4, 5, 10) + 10
res_cuadrado <- c(8, 7, 4, 5, 10) ^ 2

# Si ahora quiero cambiar el valor 5 por un 50, debo ir línea a línea cambiando el valor
# Si uso una variable, solo tengo que modificarlo una vez

vector_uso <- c(8, 7, 4, 5, 10)
res_multiplicacion <- vector_uso * 10
res_division <- vector_uso / 10
res_suma <- vector_uso + 10
res_cuadrado <- vector_uso ^ 2




#################################################################
# EJERCICIOS DE REFUERZO
#################################################################

# --- 1. NÚMEROS ---

# Reto A: Calcula cuántos segundos hay en una semana completa (7 días). Crea una variable "dia" que almacene
# la información del número de segundos que hay en un día. Después crea una variable "semana" que multiplique
# la variable "dia" por 7


# Reto B: Una cuenta de 120€, más un 10% de propina, dividido entre 4 personas.
# 1. ¿Cuánto paga cada uno?. Crea una variable "propina" con valor 0.1. Después almacena el resultado en
# otra variable llamada "cuenta". 2. Modifica la propina a 12% y calcula de nuevo la cuenta


# --- 2. LOGICA ---

# Reto A: Edad 17 años, ticket FALSE. Crea la variable "edad" y la variable "ticket" 
# Regla: Ser mayor de 18 O ( | ) tener ticket igual a TRUE. Usa las variables.
# 1. ¿Puede entrar?. 2. Modifica los valores hasta que pueda entrar


# Reto B: Comprueba si (5 multiplicado por 5) es DISTINTO de (10 sumado a 15).


# --- 3. VECTORES Y SECUENCIAS ---

# Reto A: Crea una secuencia del 1 al 50 de 5 en 5. Guárdalo en una variable llamada "secuencia".
# De esa variable, extrae la posición 2 y la 4 usando c(2, 4).


# Reto B: Crea un variable "frutas" que sea un vector con 4 frutas y usa un índice negativo [-1] 
# para mostrar todas menos la primera.


# --- 4. MATRICES Y DATAFRAMES ---

# Reto A: Crea una matriz de 3x3 con los números del 10 al 18. Guardalo en una variable llamada matriz
# Extrae el número que está en el centro (Fila 2, Columna 2).


# Reto B: Crea un Dataframe con: Equipos = c("Local", "Visitante") y Goles = c(3, 1). Guárdala en una variable llamada "resultados"
# Extrae la columna "Goles" usando el símbolo $. Pista: resultados$Goles


# --- 5. LISTAS Y VALORES NULOS ---

# Reto A: Crea una variable "diccionario", que es una lista con: una secuencia 1:5, un valor NA y el texto "Pendiente".
# Accede al segundo elemento (el NA) usando [[]].


#### Datos Estructurales ####
# Son formas de organizar los datos atómicos en estructuras más complejas

### Vectores ###
# Conjunto de datos (mismo tipo) de una dimensión.
# Se asignan con c(), separando los elementos con coma
c(10, 20) # Vector de dos elementos numéricos: 10 y 20

# Pueden ser de cualquiera de los tipos de datos atómicos (siempre de un mismo tipo) y de la longitud que queramos
c(20, 4, 8.3, -5, -8.54) # Vector numérico de 5 elementos
c("Hola", "Hello", "Bonjour") # Vector de texto de 3 elementos
c(TRUE, FALSE, TRUE, TRUE) # Vector booleano de 4 elementos
c(TRUE, "HOLA", 125) # Si el vector tiene más de un dato de tipo dferente, se convierten a texto

# MINIRETO: Crea un vector con los elementos: 4, 8, 20 y -9

## Operaciones ##
# Al igual que vimos con los datos atómicos, podemos aplicar operaciones directamente a los elementos de un vector
# Tanto operaciones matemáticas
c(4, -5, 8) * 10 # Multiplica cada elemento por 10
# Como operaciones lógicas
c("Hola", "Hello", "Bonjour") == "Hola" # Evalúa si cada elemento es igual a "Hola"
# Usamos el vector %in% para determinar si un valor está en un vector
"uva" %in% c("manzana", "fresa", "platano")

# MINIRETO: Usa el vector que hemos creado antes y evaúa que elementos son mayores de 0

## Acceso a Elementos ##
# Podemos acceder a las posiciones de un vector de dos formas: posiciones y booleanos

# Posiciones #
# Definimos que posiciones queremos obtener entre corchetes [posición o posiciones]
c(10, 20, 30)[2] # Posición 2 del vector
c(10, 20, 30)[c(1, 3)] # Posiciones 1 y 3 del vector

# Booleanos #
# Definimos que elementos del vector queremos obtener en base a unas condiciones, también usando corchetes
c(4, 8, 20, -9)[c(4, 8, 20, -9) > 0] # aplicamos la operación dentro del vector, llamando al propio vector

# MINIRETO: Usando el vector c(10, 50, 20, 30, 80) determina: 
# 1) los elementos de las posiciones 1, 3 y 4. 
# 2) los elementos que sean menores o iguales a 30

## Secuencias ##
# Podemos crear vectores de forma automática usando varias técnicas sencillas

# Operador : #
# Consiste en poner dos números entre el operador :
# Creará un vector desde el número de la izquierda hasta el número de la derecha, de forma secuencias y de 1 en 1
1:10 # Crea un vector de 1 a 10 (de 1 en 1)
10:-5 # Crea un vector de 10 a -5 (de 1 en 1)

# Función seq #
# Usa la función seq para indicar que queremos un vector desde un número hasta otro, pero podemos indicar los pasos en cada salto
seq(1, 10, 2) # Crea un vector de 1 a 10 (de 2 en 2)
seq(10, -5, -5) # Crea un vector de 10 a -5 (de -5 en -5)

# Función rep #
# Usa la función rep para crear un vector de elementos repetidos
rep("Hola", 5) # Crea un vector con 5 elementos "Hola"
rep(c(1, 20), 5) # Crea un vector con 5 repeticiones del vector 1, 20

# MINIRETO: Crea un vector c(8, 10, 52, 14, -8, 4, 20) y acceder a las posiciones de 1 a 5

### Factores ###
# Estructura para manejar variables categóricas (niveles o etiquetas).
# Útiles para datos que tienen un número limitado de valores posibles.
factor(c("Hombre", "Mujer", "Mujer", "Hombre"))

# MINIRETO: Crea un factor con las preferencias de clima: "Calor", "Frío", "Calor", "Templado"

## Niveles ##
# Los niveles (levels) definen las categorías únicas y su orden.
factor(c("Hombre", "Mujer", "Mujer", "Hombre")) # Por defecto los niveles se establecen por orden alfanumérico
factor(c("Hombre", "Mujer", "Mujer", "Hombre"), levels = c("Mujer", "Hombre")) # Pero podemos modificar el orden usando el parámetro levels

# MINIRETO: Usa el factor de climas anterior estableciendo el orden que prefieras

### Matrices ###
# Estructuras bidimensionales (filas y columnas) donde todos los datos son del mismo tipo.
# Se crean con matrix(), indicando los datos y el número de filas (nrow) o columnas (ncol).
matrix(1:9, ncol = 3, nrow = 3)
matrix(c("Hola", "Bonjour", "Hello", "Ciao"), ncol = 2, nrow = 2)

# MINIRETO: Crea una matriz de 2 filas y 3 columnas que contenga los números del 1 al 6

## Operaciones ##
# Se pueden realizar operaciones elemento a elemento (como en los vectores).
matrix(1:4, nrow = 2) * 10
matrix(1:4, nrow = 2) + 5

# MINIRETO: Crea una matriz de 2x2 con los números 10, 20, 30, 40 y divídela toda entre 2

## Acceso a Elementos ##

# Posiciones #
# Se accede usando corchetes y la sintaxis [fila, columna]
matrix(1:9, ncol = 3, nrow = 3)[1, 2] # Elemento en fila 1, columna 2
matrix(1:9, ncol = 3, nrow = 3)[1, ]  # Toda la fila 1
matrix(1:9, ncol = 3, nrow = 3)[, 3]  # Toda la columna 3

# Booleanos #
# Filtrar elementos que cumplen una condición
matrix(1:9, ncol = 3, nrow = 3)[matrix(1:9, ncol = 3, nrow = 3) > 5]

# MINIRETO: De una matriz de 3x3 con números del 1 al 9, extrae solo la segunda columna.

### DataFrames ###
# Estructura principal de R para datos tabulares. 
# A diferencia de las matrices, cada columna puede tener un tipo de dato distinto.
data.frame(nombre = c("Luis", "Sara"), edad = c(30, 20))

# MINIRETO: Crea un DataFrame llamado "tienda" con una columna "producto" (manzana, pera) y otra "precio" (1.5, 2.0)

## Acceso a Elementos ##

# Posiciones #
# Igual que en las matrices: [fila, columna]
data.frame(nombre = c("Luis", "Sara"), edad = c(30, 20))[1, 2] # Fila 1, columna 2

# Columnas a Vector #
# Usamos el operador $ para extraer una columna completa como vector
data.frame(nombre = c("Luis", "Sara"), edad = c(30, 20))$nombre
data.frame(nombre = c("Luis", "Sara"), edad = c(30, 20))$edad

# Nombres de elementos #
# Podemos usar los nombres de las columnas entre corchetes
data.frame(nombre = c("Luis", "Sara"), edad = c(30, 20))[, "nombre"]
data.frame(nombre = c("Luis", "Sara"), edad = c(30, 20))[,c("nombre","edad")]

# Booleanos #
# Filtrar filas basadas en condiciones de una columna
data.frame(nombre = c("Luis", "Sara"), edad = c(30, 20))[data.frame(nombre = c("Luis", "Sara"), edad = c(30, 20))$edad > 25, ] # Filas donde la edad es mayor a 25

# MINIRETO: Del DataFrame "tienda" creado antes, extrae solo la columna de precios usando el símbolo $

### Listas ###
# El objeto más flexible: puede contener vectores, matrices, DataFrames o incluso otras listas.
# Cada elemento puede tener un tamaño y tipo diferente.
list(num = 546, vector = c(1,2,5), df = data.frame(nombre = c("Luis", "Sara"), edad = c(30, 20)))

# MINIRETO: Crea una lista que contenga tu nombre (texto) y un vector con tus 3 números de la suerte.

## Acceso a Elementos ##

# Posiciones #
# Usamos dobles corchetes [[]] para extraer el contenido de una posición
list(num = 546, vector = c(1,2,5), df = data.frame(nombre = c("Luis", "Sara"), edad = c(30, 20)))[[2]] # Extrae el vector de la segunda posición

# Nombres de elementos #
# Si tienen nombre, usamos el operador $
list(num = 546, vector = c(1,2,5), df = data.frame(nombre = c("Luis", "Sara"), edad = c(30, 20)))$vector
list(num = 546, vector = c(1,2,5), df = data.frame(nombre = c("Luis", "Sara"), edad = c(30, 20)))$df$nombre # Acceder a una columna de un dataframe dentro de una lista

# También podemos acceder usando el nombre de los elementos entre dobles corchetes [[]]
list(num = 546, vector = c(1,2,5), df = data.frame(nombre = c("Luis", "Sara"), edad = c(30, 20)))[["vector"]]

# MINIRETO: De la lista creada en el minireto anterior, accede a tu nombre usando el operador $


#### EJERCICIOS COMPLEMENTARIOS: ESTRUCTURAS DE DATOS ####

## VECTORES ##

# Ejercicio 1: Crea un vector que contenga las temperaturas medias 
# de los últimos 5 días: 22.5, 25, 19.8, 21 y 24.2.

# Ejercicio 2: Una tienda de mascotas tiene el siguiente stock de animales: 
# "Perro", "Gato", "Pájaro", "Gato", "Perro". Crea un vector con estos datos y 
# comprueba mediante una operación lógica qué elementos son iguales a "Gato".

# Ejercicio 3: Utilizando el vector del Ejercicio 1, obtén mediante 
# indexación por posición solo el primer y el último elemento.

# Ejercicio 4: Filtra el vector del Ejercicio 1 para mostrar únicamente aquellas que 
# sean superiores a 22 grados.


## SECUENCIAS ##

# Ejercicio 5: Crea una secuencia de números que vaya del 100 al 120, de 2 en 2.

# Ejercicio 6: Genera un vector que repita la palabra "Dato" 10 veces.

# Ejercicio 7: Crea un vector que contenga los números del 1 al 5 y que se repita 
# 3 veces completas (resultado esperado: 1,2,3,4,5,1,2,3,4,5,1,2,3,4,5).


## FACTORES ##

# Ejercicio 8: Crea un factor para representar el nivel de satisfacción de 5 clientes: 
# "Bajo", "Medio", "Alto", "Medio", "Bajo".

# Ejercicio 9: Define los niveles (levels) del factor anterior de forma manual 
# para que sigan el orden: "Bajo", "Medio", "Alto".


## MATRICES ##

# Ejercicio 10: Crea una matriz de 4 filas y 2 columnas que contenga los números 
# del 1 al 8. Multiplica toda la matriz por 2.

# Ejercicio 11: Dada la matriz anterior, extrae únicamente la tercera fila completa.

# Ejercicio 12: Crea una matriz de 2x2 con nombres de ciudades y accede al elemento 
# situado en la fila 2, columna 1.


## DATAFRAMES ##

# Ejercicio 13: Crea un DataFrame con tres columnas:
# - producto: "Camiseta", "Pantalón", "Zapato"
# - cantidad: 15, 8, 20
# - disponible: TRUE, TRUE, FALSE

# Ejercicio 14: Accede a la columna 'cantidad' del DataFrame anterior
# utilizando el operador $.

# Ejercicio 15: Filtra el DataFrame anterior para mostrar solo las filas 
# de los productos cuya cantidad sea mayor o igual a 15.


## LISTAS ##

# Ejercicio 16: Crea una lista que contenga:
# - Un vector con los nombres de 3 alumnos/as.
# - Una matriz de 2x2 con sus notas (del 1 al 4).
# - El DataFrame del Ejercicio 13, llamado inventario

# Ejercicio 17: Accede al segundo elemento de la lista usando dobles corchetes.

# Ejercicio 18: Si la lista tiene nombres, accede al DataFrame 'inventario' 
# usando corchetes y, acto seguido, accede solo a la columna 'producto'.



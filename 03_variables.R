#### Variables ####
### Concepto  ###
# Una variables es un contenedor donde se almacenan los datos
mi_numero = 25 # asigna el valor 25 a una variable llamada "mi_numero"

## Asignación ##
# Las variables (al igual que como las funciones) se pueden asignar de dos formas. Usad la que os parezca más simple
# La forma clásica es usando el símbolo = (OJO! diferente del símbolo ==)
mi_numero = 25

# La forma profesional es usando el símbolo <-(ALT + Guión)
mi_numero <- 25

# Las variables se usan para almacenar cualquiera de los tipos de datos que hemos visto
mi_vector <- c(5, 2, 8) # asigna el valor de un vector a la variable 'mi_vector'
mi_matriz <- matrix(1:4, ncol = 2, nrow = 2) # asigna el valor de una matriz a la variable 'mi_matriz'

# MINIRETO: Crea una variable mi_dataframe que tenga el valor de este dataframe: data.frame(precio = c(8, 5), objeto = c("camiseta", "gorro"))

## Entorno ##
# Las variables se guardan en el entorno, las podrás ver en el panel de la arriba a la derecha
# Si una variable ya existe, podemos modificar su valor. R elimina la variable y la crea de nuevo
mi_numero <- 2 # antes era 25, compruébalo en el entorno

# Si quieres conocer el valor de una variable sin mirar el entorno, tan solo ejecuta la variable sin ninguna operación
mi_numero

# MINIRETO: Modifica la variable mi_matriz para que sea una matriz de 2x2 con los números que quieras

## Modificar los elementos de una variable ##
# Podemos directamente codificar los elementos de una variable con datos estructurales
mi_vector # como modifico el primer valor?
mi_vector[1] <- 8 # asignamos un nuevo valor al primer elemento del vector

# lo mismo para las matrices, dataframes o listas
mi_matriz[1, 2] <- 8 # asignamos un nuevo valor a la celda 1, 2 de la matriz



### Reglas ###
# Con los nombres de las variables (y con las funciones) existen una serie de reglas que debemos cumplir, son muy simples:
# Un nombre de variable no puede empezar con número
5variable <- 5 # ERROR
# Si que pueden llevar un número siempre que no sea al principio
variable5 <- 5 # CORRECTO

# Un nombre de variable no puede llevar espacios, comas, asteriscos etc
variable,numero <- 5 # ERROR

# Un nombre de variable no debería llevar símbolos especiales (ñ, tilde)
año <- 2026 # No da error, pero no es recomendable (alternativas: nombres en ingles, sustituir ñ por ni)

# Un nombre de variable puede llevar puntos (.) o barras bajas (_); muy útiles para nombres complejos
mi_numero <- 25 # CORRECTO
mi.numero <- 25 # CORRECTO

# Un nombre de variable debe ser explicativo, una variable llamada "a" no dice nada
# Ambas variables funcionan igual y se pueden usar, pero a la hora de analizar el código
# una es mejor que otra
precios_supermercado <- c(2, 8, 9, 5)
a <- c(2, 8, 9, 5)

### Usos ###
# Las variables se usan principalmente para almacenar información de un dato que queremos utilizar a posteriori
mi_numero <- 25
mi_numero * 25

# También se utilizan para almacenar información de una operación
mi_numero <- mi_numero * 5

## Evitar Repeticiones ##
# Mediante las variables podemos evitar repetir demasiado estructuras complejas
(127845 + 127845) / (127845 / 100) # ¿que probabilidad hay de escribir mal el número 127845 en alguna ocasión?

mi_numero <- 127845
(mi_numero + mi_numero) / (mi_numero / 100) # mucho mejor así, ¿verdad?


## Código más Limpio ##
# También se usan para tener un código mucho más limpio
data.frame(nombre = c("Luis", "Sara"), edad = c(30, 20))[data.frame(nombre = c("Luis", "Sara"), edad = c(30, 20))$edad > 25, ] # código muy lioso

df <- data.frame(nombre = c("Luis", "Sara"), edad = c(30, 20)) # creamos una variable con la información del dataframe
df[df$edad > 25,] # código mucho más limpio, mucho mejor así, ¿no?


#### EJERCICIOS COMPLEMENTARIOS: VARIABLES ####

# Ejercicio 1: Cálculos en el supermercado
# Has ido a la compra y has cogido 3 bolsas de manzanas que cuestan 4 euros cada una 
# y 2 paquetes de pasta que cuestan 1 euro cada uno. 
# Crea las variables manzanas y pasta, asignado los valores y calcula el precio total


# Ejercicio 2: Reparto de premios
# Un premio de 1000 euros se reparte entre 4 personas. A la cantidad que recibe cada 
# persona hay que restarle 50 euros en concepto de gastos de gestión.
# Crea las variables premio y gastos, asignado los valores y calcula la cantidad que recibe cada persona


# Ejercicio 3: Verificación de textos
# Comprueba mediante un operador lógico si el texto "RStudio" es exactamente igual 
# al texto "rstudio". Ten en cuenta la importancia de las mayúsculas:
# Crea las variables Rstudio y rstudio, asignado los valores comprueba si son iguales


# Ejercicio 4: Control de temperatura
# Una máquina funciona correctamente si la temperatura es mayor de 15 grados 
# Y menor o igual a 30 grados.
# Crea las variable temperatura, asignandole el valor 32 y comprueba si la máquina funciona


# Ejercicio 5: Acceso a una atracción
# Para subir a una atracción infantil se debe cumplir al menos una de estas dos condiciones:
# Tener 10 años o más O medir más de 120 centímetros.
# Crea las variables edad y altura y comprueba si puede subir una persona que tiene 8 años y mide 125 centímetros:


# Ejercicio 6: Validación de datos
# Crea las variables numero = 50 y texto = "50" y comprueba, utilizando el operador lógico correspondiente, si son iguales:


# Ejercicio 7: Lógica inversa
# Utiliza el operador de inversión (!) para demostrar que es FALSO que 
# el número 100 sea menor que 50. Crea la variable cien y la variable cincuenta y compruebra:


# Ejercicio 8: Condición de beca
# Para obtener una beca de transporte, el alumnado debe cumplir:
# Que la distancia al centro sea mayor de 20 km 
# Y que el ingreso familiar sea menor de 15000 euros O que sea familia numerosa (TRUE).
# Crea las variables distancia (25), ingresos (18000) y familia_numerosa (TRUE)
# Evalúa el caso 

## VECTORES ##

# Ejercicio 1: Crea un vector "temperaturas" que contenga las temperaturas medias 
# de los últimos 5 días: 22.5, 25, 19.8, 21 y 24.2.

# Ejercicio 2: Una tienda de mascotas tiene el siguiente stock de animales: 
# "Perro", "Gato", "Pájaro", "Gato", "Perro". Crea un vector "animales" con estos datos y 
# comprueba mediante una operación lógica qué elementos son iguales a "Gato".

# Ejercicio 3: Utilizando el vector del Ejercicio 1, obtén mediante 
# indexación por posición solo el primer y el último elemento.

# Ejercicio 4: Modifica las posiciones 1 y 2 del vector con los números 22.75 y 25.12


## SECUENCIAS ##

# Ejercicio 5: Crea una secuencia de números que vaya del 100 al 120, de 2 en 2. Asigna a la variable "numeros"

# Ejercicio 6: Genera un vector "repetición" que repita la palabra "Dato" 10 veces.

# Ejercicio 7: Crea un vector "numeros" que contenga los números del 1 al 5 y que se repita 
# 3 veces completas (resultado esperado: 1,2,3,4,5,1,2,3,4,5,1,2,3,4,5).


## FACTORES ##

# Ejercicio 8: Crea un factor "satisfaccion" para representar el nivel de satisfacción de 5 clientes: 
# "Bajo", "Medio", "Alto", "Medio", "Bajo".

# Ejercicio 9: Define los niveles (levels) del factor anterior de forma manual 
# para que sigan el orden: "Bajo", "Medio", "Alto".


## MATRICES ##

# Ejercicio 10: Crea una matriz llamada "matriz1" de 4 filas y 2 columnas que contenga los números 
# del 1 al 8. Multiplica toda la matriz por 2.

# Ejercicio 11: Dada la matriz anterior, extrae únicamente la tercera fila completa.

# Ejercicio 12: Modifica la columna 2 por completo para que tenga los valores 10, 11, 12, 13


## DATAFRAMES ##

# Ejercicio 13: Crea un DataFrame "inventario" con tres columnas:
# - producto: "Camiseta", "Pantalón", "Zapato"
# - cantidad: 15, 8, 20
# - disponible: TRUE, TRUE, FALSE

# Ejercicio 14: Accede a la columna 'cantidad' del DataFrame anterior
# utilizando el operador $.

# Ejercicio 15: Filtra el DataFrame anterior para mostrar solo las filas 
# de los productos cuya cantidad sea mayor o igual a 15.


## LISTAS ##

# Ejercicio 16: Crea una lista "alumnos" que contenga:
# - Un vector con los nombres de 3 alumnos/as.
# - Una matriz de 2x2 con sus notas (del 1 al 4).
# - El DataFrame del Ejercicio 13, llamado inventario

# Ejercicio 17: Accede al segundo elemento de la lista usando dobles corchetes.

# Ejercicio 18: Si la lista tiene nombres, accede al DataFrame 'inventario' 
# usando corchetes y, acto seguido, accede solo a la columna 'producto'.


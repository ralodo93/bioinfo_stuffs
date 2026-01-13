## Saludo básico en R
print("Hola R") # Imprimir mensaje por consola

## Comentarios: Usamos los comentarios (líneas que empiezan con #) para explicar el código. 
## R los ignora al ejecutar.

## Calculadora - Expresiones

### Operaciones básicas
8+7 # Sumar 8 y 7
8*10 # Multiplicar 8 por 10
20/5 # Dividir 20 entre 5
8^2 # Elevar 8 al cuadrado

### Operaciones avanzadas (funciones específicas)
sqrt(64) # Raíz cuadrada de 64
log(100) # Logaritmo natural de 100
exp(3)    # Exponencial de 3 (e^3)
log(10*5) # Logaritmo natural de 10 por 5
abs(-10) # Valor absoluto de -10
round(3.14159, 2) # Redondear 3.14159 a 2 decimales
ceiling(4.3) # Redondear hacia arriba al entero más cercano
floor(4.7)   # Redondear hacia abajo al entero más cercano
# muchas más funciones disponibles como factorial(), sin(), cos() etc.


## Variables - Asignaciones
# Es un nombre (una etiqueta) donde guardas un valor para usarlo después.
a = 7 # Asignar valor 7 a la variable a -> Se ve en el panel de entorno
a
a <- 7 # Asignar valor 7 a la variable a (alternativa más profesional ALT + GUIÓN)
a
b <- 8 # Asignar valor 8 a la variable b
a + b # Sumar a y b
A <- 5 # Case sensitive. ATENCIÓN A MAYÚSCULAS Y MINÚSCULAS


### Variables numéricas
x <- 10.5 # Asignar valor 10.5 a la variable x
y <- 85*4 # Asignar el resultado de 85 por 4 a la variable y
z <- x + y # Asignar el resultado de x más y a la variable z
z

### Variables de texto
nombre <- "Juan" # Asignar el texto "Juan" a la variable nombre
apellido <- "Pérez" # Asignar el texto "Pérez" a la variable apellido
nombre_completo <- paste(nombre, apellido) # Concatenar nombre y apellido
nombre_completo

## Variables lógicas (Booleanas)
# Solo pueden tener dos valores: TRUE (Verdadero) o FALSE (Falso)
es_mayor <- TRUE
es_menor <- FALSE

# Se suelen generar al comparar valores (operadores lógicos)
10 > 5   # ¿Es 10 mayor que 5? Resultado: TRUE
10 < 5   # ¿Es 10 menor que 5? Resultado: FALSE
10 == 10 # ¿Es 10 igual a 10? Resultado: TRUE (Ojo: doble igual para comparar)
8 != 10 # ¿Es 8 diferente a 10? Resultado: TRUE

# Ejemplo práctico: ¿Tiene el paciente una edad mayor a 30?
edad <- 35
resultado_chequeo <- edad > 30 # Almacenamos en una variable el resultado de preguntar si edad es mayor de 30
resultado_chequeo

## Vectores
# Una colección de elementos que tienen que ser del mismo tipo (todos números o todos texto). Ej. Una columna de excel
a <- c(10,20,30,40,50) # Crear un vector a
a[1] # Acceder al primer elemento del vector a
a[3] # Acceder al tercer elemento del vector a
a[c(2,4)] # Acceder al segundo y cuarto elemento del vector a
length(a) # Obtener la longitud del vector a
a*2 # Multiplicar cada elemento del vector a por 2
b <- c(11,22,33,44,55) # Crear un vector b
a + b # Sumar los vectores a y b elemento por elemento
a <- c("Juan", "María", "Luis") # Crear un vector de nombres
b <- c("Pérez", "Gómez", "Rodríguez") # Crear un vector de apellidos
nombres_completos <- paste(a, b) # Concatenar los vectores de
print(nombres_completos) # Imprimir los nombres completos
vector_TF <- c(TRUE, FALSE, TRUE, TRUE) # Crear un vector lógico
vector_TF[2] # Acceder al segundo elemento del vector lógico
a == "Juan" # Comparar cada elemento del vector a con "Juan", devuelve un vector lógico
a[a == "Juan"] # Filtrar el vector a para obtener solo los elementos iguales a "Juan"
b != "Rodríguez" # Comparar cada elemento del vector b con "Rodríguez", devuelve un vector lógico
b[b != "Rodríguez"] # Filtrar el vector b para obtener solo los elementos diferentes a "Rodríguez"

### Secuencias rápidas
# El operador : crea una secuencia de números del inicio al fin
numeros <- c(1,2,3,4,5,6,7,8,9,10) # Crea un vector del 1 al 10 IMPORTANTE: No usar tildes, ñ, espacios ni caracteres especiales en los nombres de variables
numeros
numeros <- 1:10 # Usando los dos puntos (:), creamos un vector numérico desde el primer número hasta el último
numeros
# También funciona en sentido inverso
cuenta_atras <- 10:1
cuenta_atras
# Muy útil para acceder a rangos en un vector o data frame
a <- c("A", "B", "C", "D", "E")
a[1:3] # Acceder de la posición 1 a la 3


## Matrices
# Como un vector, pero organizado en dos dimensiones (filas y columnas). Al igual que los vectores, todos sus elementos deben ser del mismo tipo.
m <- matrix(1:9, nrow=3, ncol=3) # Crear una matriz de 3x3 con los números del 1 al 9
print(m) # Imprimir la matriz
#### poner coma a la izquierda y a la derecha
m[1,2] # Acceder al elemento en la fila 1, columna 2
m[3,1] # Acceder al elemento en la fila 3, columna 1
m[2,] # Acceder a la fila 2 completa
m[,3] # Acceder a la columna 3 completa
m[,1:2] # Acceder las filas 1 y 2 completas
m * 2 # Multiplicar cada elemento de la matriz por 2
n <- matrix(9:1, nrow=3, ncol=3) # Crear otra matriz de 3x3 con los números del 9 al 1
m + n # Sumar las dos matrices elemento por elemento
t(m) # Calcular la transpuesta de la matriz m. Convertir columnas en filas y filas en columnas

## Data Frames
# Es la estructura tipo "tabla de Excel". A diferencia de la matriz, cada columna puede tener un tipo de dato distinto (una columna de nombres y otra de edades)
df <- data.frame(
  Nombre = c("Ana", "Luis", "Marta", "Jorge", "Sofía"), # coma
  Edad = c(28, 34, 23, 45, 30),
  Ciudad = c("Madrid", "Barcelona", "Valencia", "Sevilla", "Bilbao") # no coma
) # Crear un data frame con nombres, edades y ciudades
df # Imprimir el data frame
head(df) # Mostrar las primeras filas del data frame
tail(df) # Mostrar las últimas filas del data frame
df$Nombre # Acceder a la columna Nombre del data frame
df[, "Nombre"] # Acceder a la columna Nombre del data frame (otra forma)
df[["Nombre"]] # Acceder a la columna Nombre del data frame (otra forma)
df$Edad # Acceder a la columna Edad del data frame
df$Ciudad # Acceder a la columna Ciudad del data frame
a <- df$Nombre # Asignar la columna Nombre a la variable a
a # Imprimir la variable a
df$Telefono <- c("123456789", "987654321", "456123789", "789456123", "321654987") # Agregar una nueva columna Teléfono al data frame
df # Imprimir el data frame actualizado
df[, c("Nombre", "Ciudad")] # Acceder a las columnas Nombre y Ciudad del data frame
df[, c(1,2)] # Acceder a las dos primeras columnas del data frame
df[df$Edad > 30, ] # Filtrar filas donde la Edad es mayor a 30
data <- data.frame(col1 = c(1,2,3), col2 = c(4,5,6)) # Crear un data frame de ejemplo para crear una matriz
data #imprimir data frame
m <- as.matrix(data) # Crear una matriz a partir de un data frame
m


## Factores (Categorías)
# Son variables de texto que representan categorías fijas (niveles). Útiles para clasificar datos, como "Pequeño/Mediano/Grande".
grupos <- c("Control", "Tratamiento", "Control", "Tratamiento")
grupos_factor <- factor(grupos)
grupos_factor # Fíjate en los "Levels" (Niveles)
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


##### EJERCICIO #########
# Objetivo: Crear una estructura de datos completa que combine todos los tipos de objetos aprendidos (variables, vectores, factores, matrices, dataframes y listas).
# 
# 1. Variables y Vectores
# Crea una variable llamada tienda con el nombre "Mi Primera Tienda".
tienda <- "Mi Primera Tienda"
# Crea un vector productos con 5 nombres de artículos (ej: "Mesa", "Silla"...).
productos <- c("Mesa", "Silla", "Lámpara", "Estantería", "Alfombra")
# Crea un vector precios con 5 valores numéricos. Truco: secuencias rápidas. Extra -> Randomización
# 
# Crea un vector stock con 5 valores lógicos (TRUE si hay existencias, FALSE si no).
# 
# 2. Factores y DataFrames
# Crea un vector de 5 elementos llamado categorias que use solo dos palabras: "Mueble" o "Accesorio". Conviértelo en un factor.
# 
# Crea un DataFrame llamado inventario que contenga las columnas: categorias, productos, precios, stock y categorias.
# 
# Añade una nueva columna al inventario llamada precio_iva que sea el precio multiplicado por 1.21.
# 
# 3. Matrices
# Crea una matriz de 3x3 llamada ventas_trimestre con números del 1 al 9 (representando ventas mensuales de 3 secciones).
# 
# Calcula el total de ventas multiplicando la matriz por 10.
# 
# 4. Listas
# Crea una lista final llamada informe_global que contenga:
#   
#   El nombre de la tienda (variable).
# 
#   La tabla completa (dataframe).
# 
#   La matriz de ventas (matriz).
# 
# Reto final: Accede al nombre de la tienda dentro de la lista y cámbialo a "Tienda Actualizada".

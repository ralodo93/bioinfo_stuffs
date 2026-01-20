### ¿Qué es un Dato?
# Un dato es la unidad mínima de información que R puede procesar.

### Datos Atómicos
# Son los componentes básicos e indivisibles.

## Número (entero o decimal)
# En R, los números se llaman "numeric". No importa si tienen decimales o no.
10 # el número 10
20 # el número 20
4.78 # el número 4.78-50 # el número -50

# Operaciones sencillas
8 + 7 # Sumar 8 y 7
8 + 7 # los espacios no importan, se trata de algo decorativo (gusto personal)
8 - 10 # Restar 8 menos 10
8 * 10 # Multiplicar 8 por 10
20 / 5 # Dividir 20 entre 5
8^2 # Elevar 8 al cuadrado. También sirve 8 ** 2
8 %% 3 # Resto de una división - 8 / 3 = 2. Resto = 2

# MiniReto: ¿Cuandos segundos hay en un día?

# Operaciones Complejas (Paréntesis)
# Los paréntesis agrupan operaciones para cambiar el orden de evaluación.
# R siempre resuelve desde el paréntesis más interno hacia afuera.

8 + 2 * 10 # 2*10 se calcula primero, después se le suma 8
(8 + 2) * 10 # 8+2 se calcula primero, después se aplica la multiplicación

(10 - 5) / (5 + 10) # 10-5 y 5+10 se hacen por separado, después se aplica la división a los resultados

# MiniReto: Tienes 3 cajas con 12 manzanas cada una. Si decides regalar 5 manzanas de una de las cajas y 
# luego repartir todas las manzanas restantes equitativamente entre 2 amigos, ¿cuántas manzanas recibe cada uno? 
# (Escribe la operación en una sola línea usando paréntesis).

## Texto (Siempre entre comillas)
# Se llaman "character". Las comillas indican a R que no debe buscar una función con ese nombre.
"Hola, esto es una cadena de texto"
"100" # Esto NO es un número, es una etiqueta de texto.
'Hola, yo también soy un character' # También se pueden usar comillas simples

## Booleano (Verdadero o Falso)
# Se llaman "logical". Son el resultado de comparaciones. Tiene solo dos opciones: TRUE o FALSE
TRUE
FALSE

# Operadores Lógicos Aplicados a números
# Comparan magnitudes y devuelven un booleano.
10 > 5   # Mayor que
10 >= 5  # Mayor o igual que
10 < 5   # Menor que
10 <= 5 # Menor o igual que
10 == 10 # IGUAL A (se usan dos signos para no confundir con asignación)
10 != 9  # DISTINTO DE

# uso de !
# al poner ! antes de una operación lógica, invierte el resultado
10 > 5 # TRUE!10 > 5 # FALSE!10 < 5 # TRUE

# Operadores lógicos también con texto
"usuario" != "usuario" # usuario es diferente de usuario?
"USUARIO" == "Usuario" # USUARIO es igual a Usuario?

# MiniReto: Comprueba si una persona de 15 años puede entrar en una discoteca (mayores de 18)

# Combinar operadores lógicos (Lógica de Boolenos)
# AND (&): Solo es verdad si TODO es verdad.
# OR (|): Es verdad si al menos UNA parte es verdad.
(5 > 1) & (3 == 3) # TRUE & TRUE -> TRUE
(5 > 1) & (3 == 4) # TRUE & FALSE -> FALSE
(5 > 1) | (3 == 4) # TRUE | FALSE -> TRUE (porque el 5>1 se cumple)

# MiniReto: Para que un examen esté aprobado, la nota debe ser mayor o igual a 5 Y la asistencia debe ser superior a 75.
# Comprueba si una persona aprueba con nota de 8 y asistencia de 75

## Factores (Categorías) -> se usa la función factor()
# Son datos que parecen texto pero representan niveles o grupos definidos.
factor("Hombre")

### Datos Estructurales
# Son formas de organizar los "ladrillos" anteriores en grupos más grandes.

## Vectores (Conjunto de datos de una dimensión) -> se asignan con c()
# Es una lista simple de elementos, todos deben ser del mismo tipo.
c(1, 2, 3, 4, 5)          # Vector numérico
c("Azul", "Rojo", "Verde") # Vector de texto
c(TRUE, FALSE, FALSE) # Vector booleano
c(1,"Azul",TRUE) # Vector mixto -> ! Lo convierte todo a TEXTO

# Acceder a los elementos de un vector - Se usa corchetes indicando la posición o posiciones que se desean obtener
c(10, 20, 30, 40)[1] # del vector dado, accedo a la posición número 1
c(10, 20, 30, 40)[c(1, 3)] # del vector dado, accedo a las posiciones 1 y 3


# MiniReto: Crea un vector con los nombres de los días de la semana laboral (Lunes a Viernes). 
# Una vez creado, escribe el código para extraer únicamente el miércoles y el viernes usando sus posiciones.

# Secuencias Rápidas - Se utilizan para crear vectores automáticamente
# Hay 3 formas de crearlas

# Usando operador :
1:10 # Crea un vector de 1 hasta 10 (de 1 en 1)
10:1 # También sirve a la inversa

# Si queremos modificar el salto (que no sea 1), usamos la función seq(primer_numero, ultimo_numero, salto)
seq(1, 10, 2) # crea un vector de 1 hasta 10 de 2 en 2

# Si queremos repetir un mismo patrón varias veces usamos la función rep(patron, numero_repeticiones)
rep("Hola", 5)
c(rep("Hola", 5), rep("Bonjour", 3))

# MiniReto: Crea una secuencia que vaya del 100 al 200, pero que solo incluya los números de 5 en 5 (100, 105, 110...).

## Matrices (2 dimensiones: filas y columnas) -> matrix() o as.matrix()
# Son tablas donde TODO (absolutamente todo) debe ser del mismo tipo de dato.
matrix(1:9, nrow = 3, ncol = 3) # Una tabla de 3x3 con números del 1 al 9

# Acceder a los elementos de una matriz: [,] A la izquierda de la coma se refiere a las filas, y a la derecha a las columnas
matrix(1:9, nrow = 3, ncol = 3)[1, 3] # accedo a la fila 1, columna 3
matrix(1:9, nrow = 3, ncol = 3)[1, ] # accedo a la fila 1, todas las columnas (no se indica ninguna, por lo que son todas)
matrix(1:9, nrow = 3, ncol = 3)[, 3] # accedo a todas las filas (no se indica ninguna, por lo que son todas), de la columna 3

# También se pueden usar vectores
matrix(1:9, nrow = 3, ncol = 3)[c(1, 2), 3] # accedo a la fila 1 y 2, columna 3

# MiniReto: Crea una matriz de 2 filas y 5 columnas que contenga los números del 1 al 10. 
# Después, extrae todos los números que están en la segunda fila.

## DataFrames (2 dimensiones: filas y columnas) -> data.frame()
# Es la estructura más usada. Cada columna puede ser un tipo de dato distinto.
# Es como una hoja de Excel: una columna de nombres y otra de edades.
data.frame(Nombre = c("Pedro", "Maria"), Edad = c(30, 25))

# Acceder a los elementos de un dataframe. Varias formas

# Igual que una matriz
data.frame(Nombre = c("Pedro", "Maria"), Edad = c(30, 25))[1, 2] # fila 1, columna 2
data.frame(Nombre = c("Pedro", "Maria"), Edad = c(30, 25))[,2] # columna 2

# Por nombre de columna
data.frame(Nombre = c("Pedro", "Maria"), Edad = c(30, 25))[,"Nombre"] # columna nombre (usando [])
data.frame(Nombre = c("Pedro", "Maria"), Edad = c(30, 25))$Nombre # columna nombre (usando $)

# MiniReto: Crea un pequeño DataFrame llamado tienda que tenga dos columnas: Producto: "Pan", "Leche", "Huevos".
# Precio: 1.20, 0.95, 2.50. Luego, utiliza el símbolo $ para extraer solo la columna de los precios.

## Listas (Contenedores flexibles) -> se usa la función list()
# Es como una caja donde puedes meter de todo: un número, un vector y una matriz juntos.
list(num=42, text="Cualquier cosa", vect=c(1, 2, 3))

# Acceder a los elementos de una lista -> [[]]
list(num=42, text="Cualquier cosa", vect=c(1, 2, 3))[[1]] # accedo al primer elemento de la lista

# Alternativa por nombre
list(num=42, text="Cualquier cosa", vect=c(1, 2, 3))[["num"]]

# MiniReto: Crea una lista llamada mi_perfil que contenga: Un elemento llamado usuario con tu nombre.
# Un elemento llamado puntuaciones que sea un vector con los números 10, 8 y 9. 
# Accede mediante el doble corchete [[ ]] al vector de puntuaciones.


### Datos Faltantes/Nulos
# R tiene formas específicas de decir "aquí no hay nada".

## NA (Not Available)
# Se usa cuando un dato existe en la realidad pero no lo tenemos (un dato perdido).
c(1, 2, NA, 4) # Un vector donde falta el tercer valor.

## NULL
# Representa la ausencia total del objeto. Es como una caja que está literalmente vacía.
NULL


#################################################################
# EJERCICIOS DE REFUERZO
#################################################################

# --- 1. NÚMEROS ---

# Reto A: Calcula cuántos segundos hay en una semana completa (7 días) 
# en una sola línea de código.


# Reto B: Una cuenta de 120€, más un 10% de propina, dividido entre 4 personas.
# ¿Cuánto paga cada uno? (Escribe la operación completa).


# --- 2. LOGICA ---

# Reto A: Edad 17 años, Ticket FALSE. 
# Regla: Ser mayor de 18 O ( | ) tener Ticket igual a TRUE. 
# ¿Puede entrar?


# Reto B: Comprueba si (5 multiplicado por 5) es DISTINTO de (10 sumado a 15).


# --- 3. VECTORES Y SECUENCIAS ---

# Reto A: Crea una secuencia del 1 al 50 de 5 en 5. 
# De esa secuencia, extrae la posición 2 y la 4 usando c(2, 4).


# Reto B: Crea un vector con 4 frutas y usa un índice negativo [-1] 
# para mostrar todas menos la primera.


# --- 4. MATRICES Y DATAFRAMES ---

# Reto A: Crea una matriz de 3x3 con los números del 10 al 18.
# Extrae el número que está en el centro (Fila 2, Columna 2).


# Reto B: Crea un Dataframe con: Equipos = c("Local", "Visitante") y Goles = c(3, 1).
# Extrae la columna "Goles" usando el símbolo $.


# --- 5. LISTAS Y VALORES NULOS ---

# Reto A: Crea una lista con: una secuencia 1:5, un valor NA y el texto "Pendiente".
# Accede al segundo elemento (el NA) usando [[]].


# Reto B: Acceso anidado. Tienes una lista que contiene otra lista: list(list(99), list(c(10, 20))).
# Accede al número 99 usando doble corchete dos veces [[ ]][[ ]].


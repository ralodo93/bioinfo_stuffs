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

## Operaciones Complejas (Paréntesis)
# Los paréntesis agrupan operaciones para cambiar el orden de evaluación.
# R siempre resuelve desde el paréntesis más interno hacia afuera.

8 + 2 * 10 # 2*10 se calcula primero, después se le suma 8
(8 + 2) * 10 # 8+2 se calcula primero, después se aplica la multiplicación

(10 - 5) / (5 + 10) # 10-5 y 5+10 se hacen por separado, después se aplica la división a los resultados

# MiniReto: multiplicar por 8 el resultado de 5 ^ 2

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

# MiniReto: 2 elevado a la 10 es mayor que 1000? - Haz que devuelva TRUE o FALSE

# Combinar operadores lógicos (Lógica de Boolenos)
# AND (&): Solo es verdad si TODO es verdad.
# OR (|): Es verdad si al menos UNA parte es verdad.
(5 > 1) & (3 == 3) # TRUE & TRUE -> TRUE
(5 > 1) & (3 == 4) # TRUE & FALSE -> FALSE
(5 > 1) | (3 == 4) # TRUE | FALSE -> TRUE (porque el 5>1 se cumple)

# MiniReto: Verifica si (8 es múltiplo de 2, ej: 8 %% 2 == 0) Y (8 es mayor que 10).

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

# Acceder a los elementos de un vector

# Secuencias Rápidas


## Matrices (2 dimensiones: filas y columnas) -> matrix() o as.matrix()
# Son tablas donde TODO (absolutamente todo) debe ser del mismo tipo de dato.
matrix(1:9, nrow = 3, ncol = 3) # Una tabla de 3x3 con números del 1 al 9

## DataFrames (2 dimensiones: filas y columnas) -> data.frame()
# Es la estructura más usada. Cada columna puede ser un tipo de dato distinto.
# Es como una hoja de Excel: una columna de nombres y otra de edades.
data.frame(Nombre = c("Pedro", "Maria"), Edad = c(30, 25))

## Listas (Contenedores flexibles) -> se usa la función list()
# Es como una caja donde puedes meter de todo: un número, un vector y una matriz juntos.
list(42, "Cualquier cosa", c(1, 2, 3))

---### Datos Faltantes/Nulos
  # R tiene formas específicas de decir "aquí no hay nada".
  
  ## NA (Not Available)
  # Se usa cuando un dato existe en la realidad pero no lo tenemos (un dato perdido).
  c(1, 2, NA, 4) # Un vector donde falta el tercer valor.

## NULL
# Representa la ausencia total del objeto. Es como una caja que está literalmente vacía.
NULL
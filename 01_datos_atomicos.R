#### Datos Atómicos ####
# Son los componentes básicos e indivisibles.

### Numéricos ###
## Tipos de Datos Numéricos ##
# --- Constantes Numéricas ---
10       # Numeric (doble precisión por defecto)
4.78     # Los decimales siempre usan punto (.), nunca coma (,)
-50      # Números negativos
1e2      # Notación científica (100)
10L      # La 'L' sufija obliga a que sea Integer (entero)

# Comprobación de tipos
class(100)    # "numeric"
class(10L)    # "integer"

# --- Asignación ---
# Usamos siempre <- ó = para asignar valores a variables
numero <- 10

## Operaciones Matemáticas ##
# --- Operadores Básicos ---
10 + 20   # Suma
20 - 10   # Resta
10 * 2    # Multiplicación
20 / 2    # División
8 %% 3    # Módulo (Resto de la división)
8 %/% 3   # División entera (Cociente)
2 ^ 10    # Potencia

# Operaciones con variables
numero_final <- numero + 20

# MINIRETO: ¿Cuántos segundos tiene un día?. 1 Día tiene 24 horas, 1 hora tiene 60 minutos, 1 minuto tiene 60 segundos.
# Escribe solución debajo:
dia <- 24
hora <- 60
minuto <- 60


# SOLUCIÓN:
dia * hora * minuto


# --- Orden de las Operaciones ---
# Al igual que en matemáticas, en R el orden de las operaciones sigue la regla mnemotécnica PEMDAS
# (Paréntesis, Exponentes, Multiplicación y División, Adición y Sustracción)
# De este modo 20 * 2 + 5 no es lo mismo que 20 * (2 + 5)
20 * (2 + 5)
(numero * 2) ^ 3


# MINIRETO: Tienes 36 manzanas. Si decides regalar 8 manzanas y luego repartir todas las manzanas restantes equitativamente entre 2 amigos, 
# ¿cuántas manzanas recibe cada uno?. Escribe la solución debajo:


# SOLUCIÓN:
manzanas <- 36
(manzanas - 8) / 2


# --- Funciones Matemáticas Avanzadas ---
# R incluye funciones integradas para cálculos complejos. 
sqrt(12) # devuelve la raíz cuadrada de un número
abs(-10) # devuelve el valor absoluto de un número
exp(5) # devuelve el exponencial de e (2.72828) elevado a un número
log(10) # devuelve el logaritmo natural de un número
log2(10) # devuelve el logaritmo en base 2 de un número
log10(10) # devuelve el logaritmo en base 10 de un número

# Podemos usar variables:
abs(-numero)

# El anidamiento de funciones se lee de adentro hacia afuera.
log10_res <- log10(10000)
sqrt(log10_res)

# Si anidamos funciones podemos reducir el número de líneas de código y el número de variables creadas
sqrt(log10(10000)) # Ejecuta el log10(10000); el resultado lo envía a la función sqrt()


# MINIRETO: ¿Cual es la raíz cuadrada de (10 + 20) * 2?


# SOLUCIÓN:
sqrt((10 + 20) * 2)


# --- Control de Decimales ---
round(5.258, 2)  # Redondeo simétrico a 2 decimales
ceiling(5.1)     # Techo: redondea siempre hacia arriba (6)
floor(5.9)       # Suelo: redondea siempre hacia abajo (5)


# MINIRETO: Redonde la la raíz cuadrada de (10 + 20) * 2 a 4 decimales. Truco: funciones dentro de funciones


# SOLUCIÓN:
round(sqrt((10 + 20) * 2), 4)



### Texto ###
## Tipos de Datos de Texto ##

# --- Constantes de Texto ---
# IMPORTANTE: Un dato de texto SIEMPRE va metido entre comillas simples ('Hola Mundo') o dobles ("Hola Mundo")
"Hola Mundo"    # dato de tipo texto (también llamado string o caracter)
'Hola Mundo'    # aunque generalmente se usan comillas dobles, podemos usar comillas simples
"100"           # CUIDADO! al meter un número entre comillas, pasa a convertirse en texto

# Comprobación de tipos y conversión
class("Hola Mundo")   # devuelve la clase caracter
as.character(100)     # convierte un número a texto ("100")
as.numeric("100")     # transforma caracter en numérico (100)

# --- Asignación ---
# Podemos asignarlos a variables:
saludo <- "Hola Mundo"


# MINIRETO: Crea un texto con el contenido: "Estoy aprendiendo R". Escribe solución debajo:


# SOLUCIÓN:
texto_reto <- "Estoy aprendiendo R"


## Manipulación de Textos ##
# --- Funciones de Modificación ---
nchar("Hola Mundo")             # devuelve el número de caracteres de un texto
toupper("Hola Mundo")           # devuelve el texto en mayúsculas
tolower("Hola Mundo")           # devuelve el texto en minúsculas
trimws("    Hola Mundo    ")    # limpia los espacios sobrantes de un texto
substring("Hola Mundo", 1, 3)   # coge los caracteres de las posiciones 1 hasta 3
substring("Hola Mundo", 2)      # coge los caracteres de la posicion 2 hasta el final
# Podemos usar variables:
nchar(saludo)

# --- Búsqueda y Sustitución ---
gsub("Hola", "Hello", "Hola Mundo")   # devuelve el texto sustituyendo "Hola" por "Hello"
grepl("Hola", "Hola Mundo")           # devuelve TRUE ya que "Hola" está en "Hola Mundo"
grepl("Hello", "Hola Mundo")          # devuelve FALSE ya que "Hello" no está en "Hola Mundo"

# Podemos usar variables:
gsub("Hola", "Hello", saludo)

## Unir Texto ##
# --- Función Paste ---
nombre <- "Juan"
numero <- 7

paste("Mi nombre es", nombre)               # devuelve la unión, por defecto el separador es " "
paste("Mi nombre es", nombre, sep = ": ")   # devuelve la unión usando el separador ": "
paste("Mi número favorito es el", numero)   # También se puede usar número, pero se convertirá en texto


# MINIRETO: Quédate solo con la palabra: "Estoy" del texto "Estoy aprendiendo R" y transfómala a MAYÚSCULA


# SOLUCIÓN:
toupper(substring("Estoy aprendiendo R", 1, 5))


## Case Sensitive ##
# --- Sensibilidad a Mayúsculas ---
# Debemos prestar atención con las mayúsculas y las minúsculas.
# R reconoce las mayúsculas y minúsculas, por lo que "Hola Mundo" no es igual que "hola mundo"
"Hola Mundo" == "hola mundo" # Devuelve FALSE



### Booleanos ###
## Tipos de Datos Lógicos ##

# --- Constantes Lógicas ---
# Son datos que solo pueden tener dos valores: TRUE o FALSE
TRUE    # Cuando SI se cumple una condición. No funciona true ni True.
FALSE   # Cuando NO se cumple una condición. No funciona false ni False.

# Comprobación de tipos y conversión
class(TRUE)      # devuelve clase lógico
as.logical(0)    # transforma número a booleano (solo el 0 es FALSE)
as.logical(1)    # cualquier número distinto de 0 se convierte en TRUE

# --- Asignación ---
# podemos asignarlos a variables:
resultado <- TRUE


## Operadores Relacionales ##
# --- Comparación de Valores ---
# Símbolos que se usan para comparar valores y evaluar la condición
10 < 20      # menor que
10 <= 20     # menor o igual que
10 > 20      # mayor que
10 >= 20     # mayor o igual que
10 == 20     # igual que (OJO: usar siempre doble igual == para comparar)
10 != 20     # diferente que

# Comparación de texto (Case Sensitive)
"Hola Mundo" == "hola mundo"  # FALSE: R diferencia mayúsculas de minúsculas
"Hola Mundo" != "hola mundo"  # TRUE

# --- Uso con Variables ---
numero <- 10
resultado_comp <- numero < 20

# Operador inverso (!)
# Invierte el resultado booleano (lo que es TRUE pasa a ser FALSE y viceversa)
!10 < 20     # Pasa de TRUE a FALSE


# MINIRETO: Comprueba si una persona de 15 años puede entrar en una discoteca (mayores de 18).
# Escribe solución debajo:


# SOLUCIÓN:
edad <- 15
edad >= 18


## Funciones que devuelven Booleanos ##
# --- Comprobación de Objetos ---
is.numeric(5)      # ¿es un número? -> TRUE
is.character(5)    # ¿es un carácter? -> FALSE
is.function(sqrt)  # ¿es una función? -> TRUE


# MINIRETO: Comprueba si "100" es numérico o texto


# SOLUCIÓN:
is.numeric("100")
is.character("100")


## Operadores Lógicos ##
# --- Combinación de Condiciones ---

# Operador AND (&)
# Devuelve TRUE solo si AMBAS condiciones son verdaderas
(numero < 20) & (20 > 5)                     # TRUE & TRUE -> TRUE
(numero < 20) & ("Hola Mundo" == "hola")     # TRUE & FALSE -> FALSE

# Operador OR (|)
# Devuelve TRUE si AL MENOS UNA de las condiciones es verdadera
(numero < 20) | (20 > 5)                     # TRUE | TRUE -> TRUE
(numero < 20) | ("Hola Mundo" == "hola")     # TRUE | FALSE -> TRUE
(20 < numero) | ("Hola Mundo" == "hola")     # FALSE | FALSE -> FALSE


# MINIRETO: Para que un examen esté aprobado, la nota debe ser mayor o igual a 5 Y la asistencia debe ser superior a 75.
# Comprueba si una persona aprueba con nota de 8 y asistencia de 75. Escribe solución debajo:


# SOLUCIÓN:
nota <- 8
asistencia <- 75
(nota >= 5) & (asistencia > 75)


# --- Anidar Operadores ---
# Los paréntesis definen el orden de evaluación, similar a PEMDAS en matemáticas
resultado_complejo <- (numero < 20) | (20 > 5 & numero < 5)


### Faltantes y Nulos ###
## Valores Especiales ##

# --- Definiciones ---
NA     # Not Available: Valor Faltante o Perdido. El valor existe pero se desconoce.
NULL   # Null: Valor Nulo. Indica que el objeto o valor no existe (vacío absoluto).

# Diferencia visual en operaciones
length(NA)   # Devuelve 1 (el espacio está reservado aunque sea un misterio)
length(NULL) # Devuelve 0 (el objeto está realmente vacío)

# --- Comprobación de tipos ---
is.na(NA)      # devuelve TRUE
is.null(NULL)  # devuelve TRUE

# --- Asignación ---
# también se pueden asignar a variables:
faltante <- NA
vacio <- NULL

## Comportamiento Matemático ##
# Los NA suelen "propagar" la incertidumbre en los cálculos
10 + NA       # devuelve NA (si no sabemos un sumando, no sabemos el resultado)


##########################################################
#                EJERCICIOS COMPLEMENTARIOS              #
##########################################################

# Ejercicio 1: Gestión de Inventario
# Una tienda de deportes tiene 150 balones de fútbol. Recibe un nuevo cargamento de 45 balones. 
# Si decide repartir el stock total de forma equitativa entre sus 3 almacenes:
# 1. Crea una variable para la cantidad inicial y otra para el cargamento.
# 2. Calcula cuántos balones recibe cada almacén en una nueva variable.
# 3. Muestra el resultado por consola.


# Ejercicio 2: Geometría y Redondeo
# Calcula el área de un círculo cuyo radio es de 7 cm. 
# La fórmula es: área = 3.1416 * radio^2
# Una vez obtenido el resultado, guárdalo en una variable y redondéalo a solo 1 decimal.


# Ejercicio 3: Limpieza de Identificadores de Usuario
# Crea una variable llamada 'usuario_id' con el texto "  USR-98765-ES  ".
# Realiza las siguientes transformaciones de forma progresiva:
# 1. Limpia los espacios en blanco sobrantes a los lados.
# 2. Extrae únicamente los caracteres de la posición 5 a la 9 (el código numérico).
# 3. Comprueba si ese resultado es exactamente igual al texto "98765".


# Ejercicio 4: Validación de Datos de Registro
# Disponemos de la siguiente variable: email_registro <- "contacto@empresa.es"
# Usando las funciones de manipulación de texto aprendidas:
# 1. Comprueba si el texto contiene el símbolo "@" (debe devolver TRUE).
# 2. Transforma todo el correo a letras MAYÚSCULAS.
# 3. Sustituye la extensión ".es" por ".com" en el correo original.


# Ejercicio 5: Evaluación de Requisitos (Operadores Lógicos)
# Para acceder a una beca, el alumnado debe cumplir al menos UNA de estas dos condiciones: 
# Tener una nota media superior a 8.5 O una renta familiar anual inferior a 20000 euros.
# Comprueba si una persona con una nota de 7.2 y una renta de 18500 euros tiene derecho a la beca.
# Tip: Define primero las variables de nota y renta y luego usa los operadores relacionales y lógicos.


# Ejercicio 6: Control de Calidad Industrial
# En una fábrica, una pieza es "apta" si su peso es mayor o igual a 100 gramos Y menor o igual a 110 gramos.
# 1. Crea una variable 'peso_pieza' con el valor 105.5.
# 2. Escribe una expresión lógica que verifique si la pieza es apta.
# 3. Utiliza el operador inverso (!) para transformar el resultado anterior y confirmar si la pieza "NO es apta".


#### SOLUCIONES A LOS EJERCICIOS PRÁCTICOS ####

# Ejercicio 1: Cálculo de Inventario
balones_iniciales <- 150
cargamento <- 45
balones_por_almacen <- (balones_iniciales + cargamento) / 3
balones_por_almacen


# Ejercicio 2: Geometría Básica
radio <- 7
pi_valor <- 3.1416
area_circulo <- pi_valor * (radio ^ 2) # el paréntesis no es necesario
round(area_circulo, 1)


# Ejercicio 3: Control de Usuarios
usuario_id <- "  USR-98765-ES  "
usuario_limpio <- trimws(usuario_id)
solo_numeros <- substring(usuario_limpio, 5, 9)
solo_numeros == "98765"


# Ejercicio 4: Validación de Formulario
email_registro <- "contacto@empresa.es"
# 1. Comprobación de "@"
grepl("@", email_registro)
# 2. Mayúsculas
toupper(email_registro)
# 3. Sustitución de extensión
gsub(".es", ".com", email_registro)


# Ejercicio 5: Sistema de Becas
nota_media <- 7.2
renta_anual <- 18500
tiene_derecho <- (nota_media > 8.5) | (renta_anual < 20000)
tiene_derecho


# Ejercicio 6: Control de Calidad
peso_pieza <- 105.5
# 2. Verificación de aptitud
es_apta <- (peso_pieza >= 100) & (peso_pieza <= 110)
es_apta
# 3. Operador inverso
!es_apta

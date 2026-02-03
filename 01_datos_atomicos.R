#### Datos Atómicos ####
# Son los componentes básicos e indivisibles.

### Numéricos ###
10 # el número 10
20 # el número 20
4.78 # el número 4.78. Los decimales se asignan con . NUNCA USÉIS COMAS
-50 # el número -50
1e2 # también es un número (100)
1e-2 # también es un número (0.01)
class(100) # clase numérico

# Podemos asignarlos a variables:
numero <- 10


## Operaciones ##
# Las operaciones básicas con R son:
10 + 20 # Suma
20 - 10 # Resta
10 * 2 # Multiplicación
20 / 2 # División
8 %% 3 # División entera (Resto)
2 ^ 10 # Potencia

# Podemos operar con variables:
numero + 20
numero * 2

# MINIRETO: ¿Cuántos segundos tiene un día?. 1 Día tiene 24 horas, 1 hora tiene 60 minutos, 1 minuto tiene 60 segundos.
# Escribe solución debajo:
dia <- 24
hora <- 60
minuto <- 60


# Para hacer operaciones algo más complejas, debemos prestar atención al uso de paréntesis
# Similar a como se aplica en matemáticas
10 + 20 * 2 # Se hace primero 20 * 2 y luego se le suma 10
(10 + 20) * 2 # Se hace primero 10 + 20 y luego se multiplica por 2
(numero - 5) / (5 + numero) # 10-5 y 5+10 se hacen por separado, después se aplica la división a los resultados

# MINIRETO: Tienes 36 manzanas. Si decides regalar 8 manzanas y luego repartir todas las manzanas restantes equitativamente entre 2 amigos, 
# ¿cuántas manzanas recibe cada uno?. Escribe la solución debajo:

# También podemos aplicar una serie de funciones para hacer cálculos matemáticos
sqrt(12) # devuelve la raíz cuadrada de un número
abs(-10) # devuelve el valor absoluto de un número
exp(5) # devuelve el exponencial de e (2.72828) elevado a un número
log(10) # devuelve el logaritmo natural de un número
log2(10) # devuelve el logaritmo en base 2 de un número
log10(10) # devuelve el logaritmo en base 10 de un número

# Podemos usar variables:
abs(-numero)

# MINIRETO: ¿Cual es la raíz cuadrada de (10 + 20) * 2?

# Y para devolver un resultado más ajustado
round(5.258, 2) # devuelve el número redondeado a 2 decimales
ceiling(5.25) # devuelve el entero superior
floor(5.25) # devuelve el entero inferior

# MINIRETO: Redonde la la raíz cuadrada de (10 + 20) * 2 a 4 decimales. Truco: funciones dentro de funciones


### Texto ###
# IMPORTANTE. Un dato de texto SIEMPRE va metido entre comillas simples ('Hola Mundo') o dobles ("Hola Mundo")
"Hola Mundo" # dato de tipo texto (también llamado string o caracter)
'Hola Mundo' # aunque generalmente se usan comillas dobles, podemos usar comillas simples
"100" # CUIDADO! al meter un número entre comillas, pasa a convertirse en texto
class("Hola Mundo") # devuelve la clase caracter
as.character(100) # convierte un número a texto
as.numeric("100") # transforma caracter en numérico

# Podemos asignarlos a variables:
saludo <- "Hola Mundo"


# MINIRETO: Crea un texto con el contenido: "Estoy aprendiendo R". Escribe solución debajo:


## Manipulación de Textos ##
nchar("Hola Mundo") # devuelve el número de caracteres de un texto
toupper("Hola Mundo") # devuelve el texto en mayúsculas
tolower("Hola Mundo") # devuelve el texto en minúsculas
trimws("   Hola Mundo   ") # limpia los espacios sobrantes de un texto
substring("Hola Mundo", 1, 3) # coge los caracteres de las posiciones 1 hasta 3
substring("Hola Mundo", 2) # coge los caracteres de la posicion 2 hasta el final
gsub("Hola", "Hello", "Hola Mundo") # devuelve el texto sustituyendo "Hola" por "Hello"
grepl("Hola", "Hola Mundo") # devuelve TRUE ya que "Hola" está en "Hola Mundo"
grepl("Hello", "Hola Mundo") # devuelve FALSE ya que "Hello" está en "Hola Mundo"

## Unir Texto ##
nombre <- "Juan"
paste("Mi nombre es", nombre) # devuelve la unión de los elementos en un mismo objeto, por defecto el separador es " "
paste("Mi nombre es", nombre, sep = ": ") # devuelve la unión de los elementos en un mismo objeto, usamos el separador ": "
paste("Mi número favorito es el", numero) # También se puede usar número, pero se convertirá en texto

# Podemos usar variables:
gsub("Hola", "Hello", saludo)


# MINIRETO: Quédate solo con la palabra: "Estoy" del texto "Estoy aprendiendo R" y transfómala a MAYÚSCULA


## Case Sensitive ##
# Debemos prestar atención con las mayúsculas y las minúsculas.
# R reconoce las mayúsculas y minúsculas, por lo que "Hola Mundo" no es igual que "hola mundo"

### Booleanos ###
# Son datos que solo pueden tener dos valores: TRUE o FALSE
TRUE # Cuando SI se cumple una condición. No funciona true ni True.
FALSE # Cuando NO se cumple una condición. No funciona false ni False.
class(TRUE) # devuelve clase lógico
as.logical(0) # tranforma número a booleano (solo el 0 es FALSE)

# podemos asignarlos a variables:
resultado <- TRUE

## Operadores Relacionales ##
# Símbolos que se usan para comparar valores y evaluar la condición
# Podemos aplicar diferentes operadores relacionales a datos numéricos y de texto
10 < 20 # menor que
10 <= 20 # menor o igual que
10 > 20 # mayor que
10 >= 20 # mayor o igual que
10 == 20 # igual que (OJO, usar ==)
"Hola Mundo" == "hola mundo" # aquí vemos lo que hablamos de case sensitive
10 != 20 # diferente que
"Hola Mundo" != "hola mundo" # aquí vemos lo que hablamos de case sensitive

# Podemos asignarlos a variables
resultado <- numero < 20
resultado

# Operador inverso (!)
# Cuando usamos el operador inverso (!) delante de una condición, se invierte el resultado booleano
10 < 20 # TRUE
!10 < 20 # Se invierte el resultado, pasa a ser FALSE

# MINIRETO: Comprueba si una persona de 15 años puede entrar en una discoteca (mayores de 18).
# Escribe solución debajo:



## Funciones que devuelve Booleanos ##
is.numeric(5) # ¿es un número?
is.character(5) # ¿es un carácter?
is.function(sqrt) # ¿es una función?


# MINIRETO: Comprueba si "100" es numérico o texto


## Operadores Lógicos ##
# Hay dos operadores que nos permiten combinar condiciones: AND y OR

# Operador AND (&)
# Devuelve TRUE solo si ambas condiciones a su izquierda y derecha son verdaderas. Si una de las dos falla, el resultado es falso.
(numero < 20) & (20 > 5) # TRUE & TRUE -> Ambas son TRUE -> TRUE
(numero < 20) & ("Hola Mundo" == "hola mundo") # TRUE & FALSE -> No todas son TRUE -> FALSE

# Operador OR (|)
# Devuelve TRUE si algunas de las condiciones a su izquierda y derecha son verdaderas. Aunque una de las dos falle, el resultado es verdadero.
(numero < 20) | (20 > 5) # TRUE | TRUE -> Ambas son TRUE -> TRUE
(numero < 20) | ("Hola Mundo" == "hola mundo") # TRUE | FALSE -> Al menos una de ellas es TRUE -> TRUE
(20 < numero) | ("Hola Mundo" == "hola mundo") # FALSE | FALSE -> Todas son FALSE -> FALSE

# MINIRETO: Para que un examen esté aprobado, la nota debe ser mayor o igual a 5 Y la asistencia debe ser superior a 75.
# Comprueba si una persona aprueba con nota de 8 y asistencia de 75. Escribe solución debajo:


# Anidar Operadores
# Podemos añadir tanta complejidad como queramos a nuestras combinaciones lógicas.
# Funcionan similar a las operaciones matemáticas, los paréntesis son muy útiles para definir el orden en que se comparan.
resultado <- (numero < 20) | (20 > 5 & numero < 5) # TRUE | (TRUE & FALSE) -> TRUE | FALSE -> TRUE
resultado


### Faltantes y Nulos ###
NA # Es un valor Faltante o Perdido. Indica que el valor existe pero se desconoce
NULL # Es un valor Nulo. Indica que el valor no existe
# En el futuro veremos las implicaciones que tiene cada uno

is.na(NA)
is.null(NULL)

# también se pueden asignar a variables:
faltante <- NA


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
total_balones <- balones_iniciales + cargamento
balones_por_almacen <- total_balones / 3
balones_por_almacen


# Ejercicio 2: Geometría Básica
radio <- 7
pi_valor <- 3.1416
area_circulo <- pi_valor * (radio ^ 2)
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

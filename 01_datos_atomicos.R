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


## Operaciones ##
# Las operaciones básicas con R son:
10 + 20 # Suma
20 - 10 # Resta
10 * 2 # Multiplicación
20 / 2 # División
8 %% 3 # División entera (Resto)
2 ^ 10 # Potencia

# MINIRETO: ¿Cuántos segundos tiene un día?. 1 Día tiene 24 horas, 1 hora tiene 60 minutos, 1 minuto tiene 60 segundos.
# Escribe solución debajo:


# Para hacer operaciones algo más complejas, debemos prestar atención al uso de paréntesis
# Similar a como se aplica en matemáticas
10 + 20 * 2 # Se hace primero 20 * 2 y luego se le suma 10
(10 + 20) * 2 # Se hace primero 10 + 20 y luego se multiplica por 2
(10 - 5) / (5 + 10) # 10-5 y 5+10 se hacen por separado, después se aplica la división a los resultados

# MINIRETO: Tienes 36 manzanas. Si decides regalar 8 manzanas y luego repartir todas las manzanas restantes equitativamente entre 2 amigos, 
# ¿cuántas manzanas recibe cada uno?. Escribe la solución debajo:

# También podemos aplicar una serie de funciones para hacer cálculos matemáticos
sqrt(12) # devuelve la raíz cuadrada de un número
abs(-10) # devuelve el valor absoluto de un número
exp(5) # devuelve el exponencial de e (2.72828) elevado a un número
log(10) # devuelve el logaritmo natural de un número
log2(10) # devuelve el logaritmo en base 2 de un número
log10(10) # devuelve el logaritmo en base 10 de un número

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

## Operadores Lógicos ##
# Símbolos que se usan para comparar valores y evaluar la condición
# Podemos aplicar diferentes operadores lógicos a datos numéricos y de texto
10 < 20 # menor que
10 <= 20 # menor o igual que
10 > 20 # mayor que
10 >= 20 # mayor o igual que
10 == 20 # igual que (OJO, usar ==)
"Hola Mundo" == "hola mundo" # aquí vemos lo que hablamos de case sensitive
10 != 20 # diferente que
"Hola Mundo" != "hola mundo" # aquí vemos lo que hablamos de case sensitive

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


## Combinar Operadores ##
# Hay dos operadores que nos permiten combinar condiciones: AND y OR

# Operador AND (&)
# Devuelve TRUE solo si ambas condiciones a su izquierda y derecha son verdaderas. Si una de las dos falla, el resultado es falso.
(10 < 20) & (20 > 5) # TRUE & TRUE -> Ambas son TRUE -> TRUE
(10 < 20) & ("Hola Mundo" == "hola mundo") # TRUE & FALSE -> No todas son TRUE -> FALSE

# Operador OR (|)
# Devuelve TRUE si algunas de las condiciones a su izquierda y derecha son verdaderas. Aunque una de las dos falle, el resultado es verdadero.
(10 < 20) | (20 > 5) # TRUE | TRUE -> Ambas son TRUE -> TRUE
(10 < 20) | ("Hola Mundo" == "hola mundo") # TRUE | FALSE -> Al menos una de ellas es TRUE -> TRUE
(20 < 10) | ("Hola Mundo" == "hola mundo") # FALSE | FALSE -> Todas son FALSE -> FALSE

# MINIRETO: Para que un examen esté aprobado, la nota debe ser mayor o igual a 5 Y la asistencia debe ser superior a 75.
# Comprueba si una persona aprueba con nota de 8 y asistencia de 75. Escribe solución debajo:


# Anidar Operadores
# Podemos añadir tanta complejidad como queramos a nuestras combinaciones lógicas.
# Funcionan similar a las operaciones matemáticas, los paréntesis son muy útiles para definir el orden en que se comparan.
(10 < 20) | (20 > 5 & 10 < 5) # TRUE | (TRUE & FALSE) -> TRUE | FALSE -> TRUE




### Faltantes y Nulos ###
NA # Es un valor Faltante. Indica que el valor existe pero se desconoce
NULL # Es un valor Nulo. Indica que el valor no existe
# En el futuro veremos las implicaciones que tiene cada uno


#### EJERCICIOS COMPLEMENTARIOS: DATOS ATÓMICOS Y OPERACIONES ####

# Ejercicio 1: Un comercio local quiere calcular el IVA de un producto. 
# Si el precio del producto es de 125.50 euros y el IVA es del 21%, 
# calcula el importe total (precio + IVA) utilizando las operaciones matemáticas básicas.


# Ejercicio 2: El área de un círculo se calcula como PI por el radio al cuadrado.
# Sabiendo que PI es aproximadamente 3.14159, calcula el área de un círculo
# cuyo radio es de 7 cm.


# Ejercicio 3: Estás gestionando una base de datos de clientes. 
# El nombre de un cliente viene registrado como "   juan perez   ". 
# Realiza las siguientes tareas de limpieza:
# 1. Elimina los espacios en blanco sobrantes a los lados.
# 2. Convierte el nombre completo a MAYÚSCULAS.


# Ejercicio 4: Una empresa de logística genera códigos de envío. 
# Si el código original es "PEDIDO-2024-Z", extrae únicamente los 
# primeros 6 caracteres para obtener el tipo de documento.


# Ejercicio 5: Un sensor de temperatura ha registrado un valor de 23.8562 grados.
# Redondea dicho valor a 1 solo decimal y, posteriormente, calcula el entero superior.


# Ejercicio 6: Tienes el texto "250". Transfórmalo a tipo numérico y comprueba 
# con una función lógica si el cambio se ha realizado correctamente (debe devolver TRUE).


# Ejercicio 7: Una plataforma de streaming requiere que, para acceder a una oferta, 
# la persona usuaria sea mayor de 18 años O tenga un cupón de descuento válido.
# Comprueba si una persona de 16 años con cupón (cupón es TRUE) puede acceder.


# Ejercicio 8: En un proceso de selección, se busca a alguien que cumpla dos requisitos:
# 1. Que su nombre contenga la letra "a" (Usa grepl sobre el nombre "Luis").
# 2. Que su edad sea mayor de 25 años (Edad: 30).
# Comprueba si el candidato Luis cumple AMBOS requisitos simultáneamente.


# Ejercicio 9: El sistema de inventario ha devuelto un valor erróneo "PRODUCTO_AGOTADO".
# Sustituye la palabra "AGOTADO" por "REPOSICION" en dicho texto.


# Ejercicio 10: Verifica si el resultado de sumar el valor absoluto de -50 
# y la raíz cuadrada de 144 es igual a 62. El resultado debe ser un booleano.
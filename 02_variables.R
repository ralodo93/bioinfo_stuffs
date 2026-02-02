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

# Prueba tú a generar una variable!

## ¿Cómo se que se ha creado una variable? -> Comprobar el Environment
# Una vez ejecutas la línea de asignación, la variable aparecerá en la pestaña 
# "Environment" (Entorno) de RStudio (panel superior derecho). 
# Si modifico la variable es como si la eliminase y la crease de nuevo
mi_numero <- 24

# Para conocer su valor simplemente la ejecutamos
mi_numero

## Reglas y consejos para los nombres de variables ##

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
mi_numero <- 25
mi_texto <- "Hola Mundo"
mi_bool <- TRUE

# Utilidad 1, nos permite procesar un mismo datos sin tener que escribirlo

# Imaginad que quiero hacer la siguiente operación: 145879 * (145879 + 10) - 145879

145879 * (145879 + 10) - 145879 # las probabilidades de equivocarse escribiendo son altas, además de que se tarda demasiado

mi_numero <- 145879 # si asigno el número a la variable mi_numero
mi_numero * (mi_numero + 10) - mi_numero  # puedo reutilizarla las veces que sean necesarias


# Utilidad 2, guardar el resultado de una operación
mi_numero <- 25 * 10
mi_texto <- toupper(mi_texto)
mi_bool <- (25 < 40) & (30 > 52)

#### EJERCICIOS COMPLEMENTARIOS: DATOS ATÓMICOS Y OPERACIONES CON VARIABLES ####

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
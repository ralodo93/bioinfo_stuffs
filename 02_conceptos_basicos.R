### Concepto de Variable
## ¿Qué son?
# Una variable es un "contenedor" con un nombre que almacena un valor o datos.
# Nos permite reutilizar información a lo largo del código sin escribirla de nuevo.

## ¿Cómo se asignan?
# En R se utiliza preferentemente el operador <- (ALT + Guión (-)).
# Aunque el signo = también funciona, <- es la norma de estilo en R.
# Estructura => nombre_variable <- valor_variable
# IMPORTANTE: Intentad siempre usar nombres de variables que sean explicativos, sobretodo para entender bien el código
# Si quiero asignar un valor de un precio de un producto, es preferible llamar a esa variable
# 'precio_producto' o 'precio' a llamarlo 'a', 'veteasaber'
# IMPORTANTE: Los nombres de las variables no llevan espacios, ni guiones
# INCORRECTO - nombre producto nombre-producto
# CORRECTO - nombre_producto o nombre.producto
# IMPORTANTE: Un nombre de variable no empieza nunca con un número
# INCORRECTO: 4gatos
# CORRECTO: gatos4, gatos_4, gatos.4 etc
mi_numero=25 # Podemos usar el símbolo igual
mi_numero = 25 # Podemos añadir espacios delante y detrás (más estético)
mi_numero <- 25 # En R profesional se usa <- (ALT + Guión (-))
print(mi_numero) # también funciona si solo escribimos mi_numero

nombre_usuario <- "Alex" # Otro ejemplo, en este caso con un texto. Importante, para escribir texto siempre usar comillas dobles o simples
nombre_usuario

# Truco Tabulador
print(mi)


## ¿Cómo se que se ha creado una variable? -> Comprobar el Environment
# Una vez ejecutas la línea de asignación, la variable aparecerá en la pestaña 
# "Environment" (Entorno) de RStudio (panel superior derecho). 
# También puedes usar la función ls() para listar todas las variables creadas.
ls()

## Imprimir una variable
# Para ver el contenido de una variable, simplemente escribe su nombre o usa print().
mi_numero
print(nombre_usuario)
# También podemos usarla con otras de las funciones que hemos aprendido:
paste("Mi número es el", mi_numero)

## CUIDADO! CASE SENSITIVE
# R distingue entre mayúsculas y minúsculas. No es lo mismo 'Variable' que 'variable'.
Dato <- 10
# dato # Si ejecutas esto, R dará error porque 'dato' (en minúsculas) no existe.

### Tipos de Variables (I). Una variable = Un valor

## Variables Numéricas
# Almacenan números decimales (doubles) o enteros (integers).
precio <- 99.99
cantidad <- 5

# Operaciones con variables numéricas
# Se pueden usar variables para realizar cálculos matemáticos simples
total <- precio * cantidad
total

# También para aplicar a algunas de las funciones que vimos de la calculadora
log_precio <- log(precio)
exp_precio <- exp(precio)
sqrt_precio <- sqrt(precio)


## Variables de Texto
## Variables de Texto
# También llamadas "Character" o "Strings". Siempre van entre comillas dobles o simples
saludo <- "Hola, bienvenido"
ciudad <- 'Madrid'

# Operaciones con variables de texto
# No se pueden "sumar" (+) como números, se usan funciones como paste().
mensaje_completo <- paste(saludo, "a la ciudad de", ciudad)
print(mensaje_completo)

## Variables Booleanas
# Llamadas "Logical". Solo pueden tener dos valores: TRUE (Verdadero) o FALSE (Falso).
# Nota: Deben ir siempre en mayúsculas y sin comillas.
es_mayor_de_edad <- TRUE
esta_abierto <- FALSE

# Operadores Lógicos
mayor_que <- 10 > 5  # Se usa símbolo > (mayor que)
menor_que <- 10 < 5  # Se usa símbolo < (menor que)
mayor_o_igual_que <- 10 >= 5 # Se usa símbolo >= (mayor o igual que)
menor_o_igual_que <- 10 <= 5 # # Se usa símbolo <= (menor o igual que)
igual_que <- 10 == 5 # Se usa símbolo == (igual que) !Cuidado, usar doble =
diferente_que <- 10 != 5 # Se usa el símbolo != (diferente que)



### EJERCICIOS: VARIABLES Y TIPOS DE DATOS (3 MINUTOS)
# Resuelve cada reto debajo de su comentario.

## -- RETO 1: VARIABLES NUMÉRICAS --
# 1. Crea una variable llamada 'base' con valor 10 y otra 'altura' con valor 5.


# 2. Crea una variable llamada 'area_triangulo' que calcule (base * altura) / 2.


# 3. Imprime el resultado de 'area_triangulo'.


# 4. Calcula el log en base 10 de la variable 'area_triangulo'



## -- RETO 2: VARIABLES DE TEXTO --
# 5. Crea una variable llamada 'nombre' con tu nombre entre comillas.


# 6. Crea una variable llamada 'apellido' con tu apellido.

# 7. Usa la función paste() para crear una variable llamada 'nombre_completo' que contenga nombre y apellido

# 8. Usa la función paste() para crear un mensaje que diga: 
# "Hola, mi nombre es [nombre_completo]" usando la variable 'nombre_completo'.

# EXTRA: ¿Puedes hacerlo todo en una sola línea de código?

## -- RETO 3: CASE SENSITIVE Y SOBREESCRITURA --
# 9. Crea la variable 'Dato' con valor 100.


# 10. Intenta sumar 'dato' + 5 (en minúsculas). ¿Qué ocurre? 
# (Coméntalo con #)


# 9. Sobreescribe la variable 'base' asignándole ahora el valor 20. 
# ¿Qué valor ves ahora en el Environment para 'base'?


## -- RETO 4: COMPARACIONES (BOOLEANAS) --
# 10. Crea una variable llamada 'comparacion' que guarde el resultado de 
# verificar si 15 es mayor que 10. (Usa el símbolo >)


# 11. Crea una variable llamada 'comparacion' que guarde el resultado de 
# verificar si 35 es menor o igual que 10.



### Vectores
## ¿Qué es un vector?
# Es la estructura de datos más básica en R. Es una colección de elementos que pueden ser:
# número, texto o booleano.
# Se crean con la función c() (de "combine").
c(1, 2, 3) # Ejemplo básico sin asignar

## Asignación de vectores
edades <- c(25, 30, 18, 42) # vector con los elementos 25, 30, 18 y 42
nombres <- c("Ana", "Luis", "Pedro") # vector con los elementos "Ana", "Luis", "Pedro"
bool <- c(TRUE, FALSE, FALSE) # vector con los elementos TRUE, FALSE, FALSE

## Acceder a los elementos de un vector
# En R, las posiciones (índices) empiezan en 1.

# Por Posición:
edades[1]    # Acceder al primer elemento del vector
c(1, 3) # Vector de dos elementos: 1 y 3
edades[c(1, 3)]  # Acceder a las posiciones indicadas en el vector c(1,3): posición 1 y posición 3

# Por Booleano (Filtrado):
# Selecciona los elementos donde la condición es TRUE
edades >= 30 # Vector booleano que indica que elementos del vector cumplen la condición
edades[edades >= 30] # Filtro los elementos (por posición) que son TRUE en el vector booleano
c(10, 20, 30)[c(TRUE, FALSE, TRUE)] # Ejemplo básico

## Operaciones con vectores
# R aplica las operaciones "elemento a elemento" (vectorización).
edades + 5
edades * 2

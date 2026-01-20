### Tipo de Dato Numérico

# En R, los números son 'double' (decimales) por defecto. 
# Si quieres un entero exacto, se añade una 'L' (ej: 5L).
# Las funciones matemáticas operan sobre estos objetos transformando sus valores.

## Operaciones Básicas
# Los operadores actúan como funciones invisibles que toman dos entradas.

8+7 # Sumar 8 y 7
8 + 7 # los espacios no importan, se trata de algo decorativo (gusto personal)
8 - 10 # Restar 8 menos 10
8 * 10 # Multiplicar 8 por 10
20 / 5 # Dividir 20 entre 5
8 ^ 2 # Elevar 8 al cuadrado. También sirve 8 ** 2
8 %% 3 # Resto de una división - 8 / 3 = 2. Resto = 2

# MiniReto: ¿Cuandos segundos hay en un día?

## Operaciones Complejas (Paréntesis)
# Los paréntesis agrupan operaciones para cambiar el orden de evaluación.
# R siempre resuelve desde el paréntesis más interno hacia afuera.

8 + 2 * 10 # 2*10 se calcula primero, después se le suma 8
(8 + 2) * 10 # 8+2 se calcula primero, después se aplica la multiplicación

(10-5) / (5+10) # 10-5 y 5+10 se hacen por separado, después se aplica la división a los resultados

# MiniReto: multiplicar por 8 el resultado de 5 ^ 2

## Operaciones Aplicando Funciones

# Una función tiene la estructura: nombre_funcion(argumento1, argumento2...).
# El argumento es el valor que la función procesa.
sqrt(10) # Raíz cuadrada de 10

# ¿Cómo se como usarla?. Siempre acude a la ayuda: ?mombre_funcion()
?sqrt() # Ayuda de sqrt()
sqrt(x = 64) # Raíz cuadrada de 64
sqrt(64) # En este caso se utiliza el primer parámetro (para esta función solo hay uno)

# Funciones útiles para cálculo
abs(-10) # Valor absoluto de -10
?log() # Ayuda de log()
log(x = 100) # Ejecutar log con x = 100 y base = exp(1) (defecto) Logaritmo Natural
exp(1) # Exponencial de 1 (e^1)
log(x = 100, base = 10) # Ejecutar log con x = 100 y base = 10
log(100, 10) # Ejecutar log con x = 100 y base = 10
log10(100) # La función log10() ya aplica el logaritmo en base 10
exp(3)    # Exponencial de 3 (e^3)
log(10*5) # Logaritmo natural de 10 por 5

?round() # ayuda round()
round(3.14159, 2) # Redondear 3.14159 a 2 decimales
ceiling(4.3) # Redondear hacia arriba al entero más cercano
floor(4.7)   # Redondear hacia abajo al entero más cercano
# muchas más funciones disponibles como factorial(), sin(), cos() etc.


# Uso Tabulador
ceiling(4.3)
c

# MiniReto: Obtén la raíz cuadrada de 144 y multiplícala por el valor absoluto de -5.


### Tipo de Datos Texto (Strings)
# Los 'characters' sirven para almacenar etiquetas, nombres o párrafos.
# Siempre se definen entre comillas simples '' o dobles "".

"Hola Mundo" # importante, para escribir texto siempre entre comillas dobles
'Hola Mundo' # o simples

## Imprimir por pantalla

# print()
print("Hola Mundo") 

# paste()
# Concatena (une) varios elementos convirtiéndolos a texto. 
# Por defecto, añade un espacio entre los elementos.
paste("El", "resultado", "es", 10) # sep por defecto es " "
paste("Letra", "A", sep = "-") # si queremos que añada otro separador, se le indica con sep

# paste0()
# Es una variante de paste() que concatena elementos sin espacios entre ellos.
# Es más eficiente cuando quieres pegar texto y números de forma compacta.
paste0("Usuario", 123)
paste0("http://", "google.com")

# message()
# Se usa para generar mensajes de diagnóstico o información al usuario. 
# En interfaces como RStudio, el texto suele aparecer en color azul. 
# No detiene la ejecución del código.
message("Cargando base de datos, por favor espere...")

# cat()
# (Concatenate and Print) Sirve para imprimir texto puro en la consola. 
# A diferencia de print(), no muestra las comillas ni los índices [1]. 
# Es ideal para dar formato manual usando saltos de línea (\n).
cat("Línea 1\nLínea 2\n")
cat("El valor de pi es aproximadamente", 3.1416)

## warning()
# Genera un mensaje de advertencia. A diferencia de un error, el código 
# sigue ejecutándose, pero avisa al usuario que algo podría estar mal.
warning("La columna contiene valores nulos.")

# MiniReto: Usa cat() para imprimir tu nombre y tu ciudad en dos líneas diferentes.

## Operaciones con Texto

# substring(texto, posición_inicial, posición_final) se usar para extraer parte de del texto
substring("Hola Mundo", 1, 5) # Nos quedamos con los caracteres de 1 a 5 del texto
substring("Hola Mundo", 2, 8) # Nos quedamos con los caracteres de 2 a 8 del texto
substring("Hola Mundo", 4) # Nos quedamos con los caracteres de 4 hasta el final del texto

# nchar(texto) se usa para contar el número total de caracteres (incluyendo espacios)
nchar("Hola")                 # Devuelve 4
nchar("R es genial")          # Devuelve 11 (cuenta los dos espacios)

# toupper(texto) convierte todo el texto a letras MAYÚSCULAS
toupper("hola mundo")         # Resultado: "HOLA MUNDO"
toupper("RStudio")            # Resultado: "RSTUDIO"

# tolower(texto) convierte todo el texto a letras minúsculas
tolower("HOLA MUNDO")         # Resultado: "hola mundo"
tolower("Data Science")       # Resultado: "data science"

# grep(patrón, texto) busca un patrón de texto dentro de un elemento. 
# Devuelve 1 si el patrón existe y un elemento vacío si no.
grep("en", "Programando en R") # Devuelve 1 (porque lo encontró R)
grep("z", "Hola Mundo")       # Devuelve integer(0) (porque no existe la 'z')

# trimws(texto) 
# Se utiliza para eliminar los espacios en blanco sobrantes al principio y/o al final de un texto.
# Es muy útil porque los espacios extra pueden hacer que dos textos parezcan distintos cuando no lo son.
trimws("   Juan Pérez   ")


### Datos Booleanos
# Solo existen dos valores: TRUE y FALSE. Son fundamentales para el control 
# de flujo (if/else) y para filtrar bases de datos.

## Operadores Lógicos Aplicados a números
# Comparan magnitudes y devuelven un booleano.
10 > 5   # Mayor que
10 >= # Mayor o igual que
10 < 5   # Menor que
10 <= 5 # Menor o igual que
10 == 10 # IGUAL A (se usan dos signos para no confundir con asignación)
10 != 9  # DISTINTO DE

# uso de !
# al poner ! antes de una operación lógica, invierte el resultado
10 > 5 # TRUE
!10 > 5 # FALSE
!10 < 5 # TRUE

# MiniReto: Pregúntale a R si 2 elevado a la 10 es mayor que 1000.

## Operadores Lógicos Aplicados a texto
# Comparan el contenido o el orden alfabético.
"RStudio" == "rstudio"  # FALSE: R es sensible a mayúsculas (Case Sensitive)
"abc" != "def"  # TRUE

# grepl(patron, texto) # determina si un patrón está en un texto
grepl("Hola", "Hola mundo")
grepl("z", "Hola mundo")

# MiniReto: Comprueba si "Enero" es distinto de "enero".

## Combinar operadores lógicos (Lógica de Boole)
# AND (&): Solo es verdad si TODO es verdad.
# OR (|): Es verdad si al menos UNA parte es verdad.
(5 > 1) & (3 == 3) # TRUE & TRUE -> TRUE
(5 > 1) & (3 == 4) # TRUE & FALSE -> FALSE
(5 > 1) | (3 == 4) # TRUE | FALSE -> TRUE (porque el 5>1 se cumple)

# MiniReto: Verifica si (8 es múltiplo de 2, ej: 8 %% 2 == 0) Y (8 es mayor que 10).


#########################################################################
###            EJERCICIOS                                             ###
#########################################################################

# --- RETO 1: LA CALCULADORA ---
# Calcula el volumen de un cubo de lado 5.5, redondea el resultado 
# al entero superior (hacia arriba).
# Pista: usa ^ y ceiling()


# --- RETO 2: FORMATEO DE RUTAS ---
# Tienes una carpeta llamada "datos" y un archivo "ventas.csv". 
# Crea la ruta "datos/ventas.csv" usando una función que NO añada espacios.
# Pista: usa paste0()


# --- RETO 3: LIMPIEZA DE TEXTO ---
# Convierte la frase "  análisis de datos  " a mayúsculas, quita los 
# espacios laterales y extrae la palabra "ANÁLISIS".
# Pista: combina trimws(), toupper() y substring()
# substring(toupper(trimws(texto)), 1, ¿?)

# --- RETO 4: CONTADOR DE CARACTERES ---
# ¿Es cierto que la palabra "Esternocleidomastoideo" tiene más de 20 letras?
# Pista: usa nchar() y el operador >


# --- RETO 5: BUSCADOR DE PATRONES ---
# Comprueba si la letra "z" (minúscula) está presente en la palabra "Zaragoza".
# Pista: usa grepl()


# --- RETO 6: LÓGICA DE SEGURIDAD ---
# Una contraseña debe cumplir dos condiciones: 
# 1. Tener más de 8 caracteres.
# 2. Ser diferente de "password123".
# Evalúa si la "123456789" es segura.
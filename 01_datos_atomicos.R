# Tipos de Datos Atómicos ----
# Son los componentes básicos e indivisibles. Pueden ser de cinco tipos (aunque hay más).

# Numéricos: números
class(10) # devuelve "numeric"
class(10L) # devuelve "integer"

# Character: cadenas de texto - Siempre entre comillas simples o dobles
class("Hola Mundo") # devuelve "character"

# Booleanos: Verdadero o Falso - Solo dos valores: TRUE y FALSE
class(TRUE) # devuelve "logical"

# Perdidos o Faltantes: Cuando falta un valor en nuestros datos - Solo un valor NA
class(NA) # devuelve "logical"

# Nulos: No existe ese dato - Solo un valor NULL
class(NULL)

#-------------------------------------------------------------------------#

# Datos Numéricos ----
## Constantes Numéricas ----
10       # Numeric (doble precisión por defecto)
4.78     # Los decimales siempre usan punto (.), nunca coma (,)
-50      # Números negativos
1e2      # Notación científica (100)
10L      # La 'L' sufija obliga a que sea Integer (entero)

# Asignación a variables
numero <- 10

### Operaciones Matemáticas ----
# Operaciones Básicas
numero + 3 # SUMA
numero - 3 # RESTA
numero * 3 # MULTIPLICACIÓN
numero / 3 # DIVISIÓN
numero ^ 3 # POTENCIA

# Las operaciones tienen un orden de aplicación
numero + 3 * 8 # Multiplica 3 y 8 y suma el valor de número
(numero + 3) * 8 # suma el valor de número y 3 y lo multiplica por 8

# Algunas funciones para hacer cálculos
sqrt(numero + 6) # RAÍZ CUADRADA de un número
abs(numero - 20) # VALOR ABSOLUTO de un número
log(numero) # LOGARITMO NATURAL de un número
log10(numero) # LOGARITMO EN BASE 10 de un número
log2(numero) # LOGARITMO EN BASE 2 de un número
exp(numero - 8) # EXPONENCIAL de un número
factorial(numero - 6) # FACTORIAL de un número

# Formatear números
round(10.58) # REDONDEAR un número a entero (por defecto)
round(10.58, 1) # REDONDEAR un número a 1 decimal
floor(10.58) # OBTENER EL NÚMERO ENTERO INFERIOR
ceiling(10.58) # OBTENER EL NÚMERO ENTERO SUPERIOR

# El anidamiento de funciones se lee de adentro hacia afuera.
log10_res <- log10(10000)
sqrt(log10_res)

# Si anidamos funciones podemos reducir el número de líneas de código y el número de variables creadas
sqrt(log10(10000)) # Ejecuta el log10(10000); el resultado lo envía a la función sqrt()


############################################################
# EJERCICIO 1
# Contexto:
# En un estudio de farmacocinética, se administra una dosis de un fármaco 
# y se observa que su concentración plasmática decae siguiendo una 
# escala logarítmica. Se necesita calcular la dosis efectiva final tras 
# aplicar un factor de corrección por metabolismo basal.
#
# Enunciado:
# 1. Crea una variable llamada 'dosis_mg' con el valor 250.
# 2. Calcula el logaritmo natural de la dosis y asígnalo a 'log_dosis'.
# 3. Eleva 'log_dosis' al cuadrado y suma 15 al resultado.
# 4. Redondea el valor final a 1 decimal usando la función correspondiente.
############################################################

# El estudiante debe completar a partir de aquí:



# SOLUCIÓN

dosis_mg <- 250

log_dosis <- log(dosis_mg)

resultado <- log_dosis^2 + 15

round(resultado, 1)


############################################################
# EJERCICIO 2
# Contexto:
# Un técnico de laboratorio mide el área de una placa de cultivo circular 
# donde crecen bacterias. El radio de la placa es de 5.2 cm. El técnico 
# debe reportar el área aproximada hacia el número entero superior para 
# asegurar que tiene suficiente medio de cultivo.
#
# Enunciado:
# 1. Calcula el área siguiendo la fórmula: Área = pi * radio^2. 
#    Nota: Usa el valor 3.1415 para pi y crea una variable 'radio' con el valor 5.
# 2. Una vez calculado el área, aplica la función que devuelve el 
#    entero superior (techo) para obtener la medida final.
# 3. Realiza todo el proceso anterior (punto 1 y 2) en una sola línea de 
#    código utilizando el anidamiento de funciones.
############################################################

# El estudiante debe completar a partir de aquí:



# SOLUCIÓN:

radio <- 5
area <- 3.1415 * radio^2

ceiling(area)

ceiling(3.1415 * radio^2)

#-------------------------------------------------------------------------#


# Datos Character (Texto) ----
## Definir un character ----
# Siempre entre comillas dobles o simples
"Hola Mundo"
'Hola Mundo'

# Si incluimos un número entre comillas, pasa a ser character
class("100") # Devuelve character
is.character("100") # devuelve TRUE
as.numeric("100") # Lo transforma a numérico

# Asignación a variables
texto <- "Hola Mundo"

## Manipulación de character ----
# Extraer información
nchar(texto)             # devuelve el número de caracteres de un texto
toupper("Hola Mundo")           # devuelve el texto en mayúsculas
tolower("Hola Mundo")           # devuelve el texto en minúsculas
trimws("    Hola Mundo    ")    # limpia los espacios sobrantes de un texto
substring("Hola Mundo", 1, 3)   # coge los caracteres de las posiciones 1 hasta 3
substring("Hola Mundo", 2)      # coge los caracteres de la posicion 2 hasta el final

# Búsqueda y reemplazo
gsub("Hola", "Hello", "Hola Mundo")   # devuelve el texto sustituyendo "Hola" por "Hello"
grepl("Hola", "Hola Mundo")           # devuelve TRUE ya que "Hola" está en "Hola Mundo"
grepl("Hello", "Hola Mundo")          # devuelve FALSE ya que "Hello" no está en "Hola Mundo"

# Unir Texto
paste("Mi saludo preferido es", texto) # por defecto se unen mediante " "
paste("Mi número favorito es", numero, "¿Cuál es el tuyo?") # podemos incorporar números, que se transforman en character
paste("Mi saludo preferido es", texto, sep = ": ") # para usar un separador diferente, usamos el argumento sep

############################################################
# EJERCICIO 1
# Contexto:
# Un secuenciador de ADN genera identificadores de muestras que a veces 
# incluyen espacios accidentales al inicio o al final. Además, los 
# investigadores prefieren trabajar siempre con los códigos en mayúsculas 
# para evitar errores de duplicidad en la base de datos.
#
# Enunciado:
# 1. Crea una variable 'id_sucio' con el valor "   patient_089_v1   ".
# 2. Limpia los espacios en blanco sobrantes de 'id_sucio' y guarda el 
#    resultado en una nueva variable llamada 'id_limpio'.
# 3. Transforma 'id_limpio' totalmente a mayúsculas.
# 4. Calcula cuántos caracteres tiene el identificador final después 
#    de haber sido limpiado.
############################################################

# El estudiante debe completar a partir de aquí:



# SOLUCIÓN

id_sucio <- "   patient_089_v1   "

id_limpio <- trimws(id_sucio)

toupper(id_limpio)

nchar(id_limpio)

############################################################
# EJERCICIO 2
# Contexto:
# En un informe de laboratorio, las variantes genéticas se registran 
# con un prefijo. Se ha detectado que una serie de muestras fueron 
# etiquetadas erróneamente con el prefijo "MUT" (mutación) y debe 
# cambiarse a "VAR" (variante) para cumplir con la nueva normativa. 
# Además, se requiere extraer solo el código numérico de la variante.
#
# Enunciado:
# 1. Dada la variable 'registro' con el valor "MUT-9482", utiliza la 
#    función de reemplazo para cambiar "MUT" por "VAR".
# 2. Comprueba si la palabra "VAR" existe dentro del nuevo texto 
#    utilizando una función de búsqueda lógica.
# 3. Extrae únicamente los dígitos "9482" de la variable original 
#    'registro' usando su posición (caracteres del 5 al 8).
# 4. Realiza los pasos 1 y 3 anidando funciones
# 5. Crea una frase final que diga: "Código procesado: [tu_codigo_extraido]" 
#    utilizando una función para unir texto.
############################################################

# El estudiante debe completar a partir de aquí:



# SOLUCIÓN

registro <- "MUT-9482"
registro <- gsub("MUT", "VAR", registro)
grepl("VAR", registro)
digitos <- substring(registro, 5, 8)

registro <- "MUT-9482"
digitos <- substring(gsub("MUT", "VAR", registro), 5, 8)

paste("Código procesado:", digitos)


#-------------------------------------------------------------------------#

# Datos Booleanos ----

## TRUE y FALSE ----
# Los datos de tipo booleano solo pueden tomar dos valores: TRUE y FALSE
TRUE # No sirve ni true ni True. Si que funciona T pero no es recomendable
FALSE # No sirve ni false ni False. Si que funciona F pero no es recomendable

# Podemos asignarlos a variables
resultado <- TRUE

## Operadores Relacionales ----
# En la mayoría de los casos obtendremos un valor booleano al realizar una comparación de dos o más elementos
# Los operadores relacionales son:

10 < 20      # menor que
10 <= 20     # menor o igual que
10 > 20      # mayor que
10 >= 20     # mayor o igual que
10 == 20     # igual que (OJO: usar siempre doble igual == para comparar)
10 != 20     # diferente que

# Comparación de texto (Case Sensitive)
"Hola Mundo" == "hola mundo"  # FALSE: R diferencia mayúsculas de minúsculas
"Hola Mundo" != "hola mundo"  # TRUE

# Podemos almacenar el resultado de una comparación en una variable
resultado_comp <- numero < 20

# Operador inverso (!)
# Invierte el resultado booleano (lo que es TRUE pasa a ser FALSE y viceversa)
!10 < 20     # Pasa de TRUE a FALSE

## Operadores Lógicos ----
# Son operadores que se usan para combinar varias condiciones: AND y OR

### Operador AND (&) ----
# Devuelve TRUE solo si AMBAS condiciones son verdaderas
(numero < 20) & (20 > 5)                     # TRUE & TRUE -> TRUE
(numero < 20) & ("Hola Mundo" == "hola")     # TRUE & FALSE -> FALSE

### Operador OR (|) ----
# Devuelve TRUE si AL MENOS UNA de las condiciones es verdadera
(numero < 20) | (20 > 5)                     # TRUE | TRUE -> TRUE
(numero < 20) | ("Hola Mundo" == "hola")     # TRUE | FALSE -> TRUE
(20 < numero) | ("Hola Mundo" == "hola")     # FALSE | FALSE -> FALSE

# Anidar Operadores 
# Los paréntesis definen el orden de evaluación de los operadores
(numero < 20) | (20 > 5 & numero < 5)

############################################################
# EJERCICIO 1
# Contexto:
# En un ensayo clínico, un paciente se considera apto para un tratamiento 
# experimental si su edad es mayor o igual a 18 años y su nivel de 
# glucosa en ayunas es estrictamente menor a 110 mg/dL.
#
# Enunciado:
# 1. Crea las variables 'edad' con valor 25 y 'glucosa' con valor 105.
# 2. Crea una variable lógica llamada 'es_apto' que combine ambas 
#    condiciones usando el operador AND (&).
# 3. Invierte el resultado de 'es_apto' usando el operador inverso (!) 
#    y guárdalo en una variable llamada 'excluido'.
# 4. Compara si el valor de 'edad' es diferente de 30.
############################################################

# El estudiante debe completar a partir de aquí:


#SOLUCIÓN

edad <- 25
glucosa <- 105

es_apto <- edad >= 18 & glucosa < 110

excluido <- !es_apto

edad != 30


############################################################
# EJERCICIO 2
# Contexto:
# Un sistema de alertas médicas se dispara si un paciente presenta una 
# condición crítica. La alerta de "Riesgo Cardiovascular" se activa si:
# El colesterol es mayor a 200 O la presión sistólica es mayor o igual a 140.
# Además, para confirmar la alerta, el paciente NO debe estar en el grupo "Control".
#
# Enunciado:
# 1. Define las variables: 'colesterol' (215), 'presion' (130) y 'grupo' ("Tratamiento").
# 2. Evalúa si el colesterol es superior a 200 o (|) la presión es mayor o igual a 140. 
#    Rodea esta operación con paréntesis. Guarda el resultado en una variable llamada alerta
# 3. Utilizando el operador AND (&), combina el resultado anterior con una 
#    comparación que verifique si 'grupo' es diferente de "Control". Guarda el resultado
#    en una variable llamada alerta_activa
############################################################

# El estudiante debe completar a partir de aquí:



# SOLUCIÓN

colesterol <- 215
presion <- 130
grupo <- "Tratamiento"

alerta <- (colesterol > 200) | (presion >= 140)

alerta_activa <- alerta == TRUE & grupo != "Control"

#-------------------------------------------------------------------------#

# Faltantes ----

## Valores NA
NA     # Not Available: Valor Faltante o Perdido. El valor existe pero se desconoce.
is.na(NA)      # devuelve TRUE
# Se pueden asignar a variables
faltante <- NA
# Los NA suelen "propagar" la incertidumbre en los cálculos
10 + NA       # devuelve NA (si no sabemos un sumando, no sabemos el resultado)


# Nulos ----

## Valores NULL
NULL   # Null: Valor Nulo. Indica que el objeto o valor no existe (vacío absoluto).
is.null(NULL)  # devuelve TRUE
# Se pueden asignar a variables
vacio <- NULL


############################################################
# EJERCICIO 1
# Contexto:
# Durante la digitalización de fichas médicas, se ha detectado que algunos 
# registros de "Nivel de Hemoglobina" están vacíos porque la muestra se 
# coaguló y no pudo ser analizada. En R, debemos marcar estos casos 
# correctamente para que no interfieran con los cálculos promedio.
#
# Enunciado:
# 1. Crea una variable 'hemoglobina' y asígnale un valor que indique 
#    que el dato es "Faltante" o "No Disponible" (NA).
# 2. Comprueba mediante una función lógica si la variable 'hemoglobina' 
#    es efectivamente un valor NA.
# 3. Intenta sumar 1.5 a la variable 'hemoglobina' y observa qué sucede. 
#    Explica el resultado en un comentario breve.
############################################################

# El estudiante debe completar a partir de aquí:




# SOLUCIÓN

hemoglobina <- NA

is.na(hemoglobina)

hemoglobina + 1.5 # intenta sumar un NA a un número, lo cual es imposible, devuelve NA

############################################################
# EJERCICIO 2
# Contexto:
# Un software de gestión hospitalaria genera etiquetas para muestras de 
# orina. La etiqueta debe incluir el ID del paciente, su estado de 
# hidratación (basado en la densidad de la orina) y si requiere revisión.
#
# Enunciado:
# 1. Crea las variables: 'id_paciente' (valor 505), 'densidad' (valor 1.035) 
#    y 'nombre_medico' (valor "  dr. garcía  ").
# 2. El paciente está "Deshidratado" si la 'densidad' es mayor a 1.030. 
#    Crea una variable lógica 'deshidratado' con esta comparación.
# 3. Limpia los espacios del 'nombre_medico' y conviértelo a mayúsculas 
#    en una sola línea de código (anidamiento).
# 4. Crea una frase final usando paste() que diga: 
#    "Paciente: 505 | Estado Deshidratado: TRUE | Médico: DR. GARCÍA"
############################################################

# El estudiante debe completar a partir de aquí:




# SOLUCIÓN

id_paciente <- 505
densidad <- 1.035
nombre_medico <- "  dr. garcía  "

deshidratado <- densidad > 1.030

nombre_medico <- toupper(trimws(nombre_medico))

paste("Paciente:", id_paciente,"| Estado Deshidratado:", deshidratado,"| Médico:", nombre_medico)


############################################################
# EJERCICIO 3
# Contexto:
# Un bioinformático analiza secuencias de ARN. Se considera una secuencia 
# "Interesante" si cumple dos condiciones: tiene una longitud superior a 
# 10 bases y contiene la palabra "AUG" (codón de inicio). Si no hay 
# secuencia (está vacía), el valor debe ser nulo.
#
# Enunciado:
# 1. Crea una variable 'secuencia' con el valor "  augccuagggcu  ".
# 2. Limpia los espacios de 'secuencia' y asegúrate de que sea "secuencia_fija".
# 3. Evalúa si la longitud de 'secuencia_fija' es mayor a 10 Y (&) 
#    contiene el texto "aug" (usa grepl). Guarda esto en 'es_interesante'.
############################################################

# El estudiante debe completar a partir de aquí:




# SOLUCIÓN

secuencia <- "  augccuagggcu  "

secuencia_fija <- trimws(secuencia)

es_interesante <- nchar(secuencia_fija) > 10 & grepl("aug", secuencia_fija)


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


# EJERCICIO 1: Cálculo del Índice de Crecimiento Relativo (RGR)
# Contexto: En un estudio de fisiología vegetal, queremos calcular el crecimiento 
# de una plántula. Si el peso inicial (W1) es de 2.5 gramos y el peso final (W2) 
# tras una semana es de 12 gramos, calcula la tasa de crecimiento exponencial 
# usando la fórmula del logaritmo natural: log(W2) - log(W1).
# Crea las variables w1 y w2 y almacena el resultado en una variable llamada 'rgr_planta'.



# SOLUCIÓN:
w1 <- 2.5
w2 <- 12
rgr_planta <- log(w2) - log(w1)
rgr_planta

#-------------------------------------------------------------------------#

# EJERCICIO 2: Transformación de abundancias y escala logarítmica
# Contexto: En ecología de comunidades, a menudo trabajamos con abundancias 
# de especies muy dispares. Tenemos una muestra con 10.000 individuos (1e4) 
# de una especie generalista. 
# 1. Asigna este valor a una variable.
# 2. Calcula su logaritmo en base 10 para normalizar los datos.
# 3. Calcula la raíz cuadrada del valor original para aplicar una transformación 
#    más suave (Hellinger-like).



# SOLUCIÓN:
abundancia <- 1e4
log_abundancia <- log10(abundancia)
sqrt_abundancia <- sqrt(abundancia)
log_abundancia
sqrt_abundancia

#-------------------------------------------------------------------------#

# EJERCICIO 3: Estimación de densidad poblacional y redondeo
# Contexto: Has delimitado una parcela de muestreo circular de 5 metros de radio.
# 1. Calcula el área de la parcela (Área = pi * radio^2). Nota: usa la constante 'pi'.
# 2. Si has encontrado 12 individuos de una especie de orquídea, calcula la 
#    densidad (individuos / área).
# 3. Calcula el valor absoluto de la diferencia entre esta densidad y una 
#    densidad teórica de 0.2 individuos/m2. Redondea el valor a 3 decimales. Hazlo en una sola
#    línea de código
pi # la constante pi está cargada por defecto en R


# SOLUCIÓN:
radio <- 5
area_parcela <- pi * radio^2
densidad <- 12 / area_parcela
diferencia <- round(abs(densidad - 0.2), 3)

area_parcela
densidad
diferencia

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

# EJERCICIO 1: Limpieza y normalización de nombres científicos
# Contexto: Has recibido una base de datos de campo donde el nombre de una 
# especie de ave, "  Lullula arborea  ", tiene espacios innecesarios al 
# principio y al final por un error de transcripción. 
# 1. Guarda el nombre con los espacios en una variable llamada 'nombre_sucio'.
# 2. Elimina los espacios sobrantes.
# 3. Transforma el nombre limpio a mayúsculas para estandarizar el registro.



# SOLUCIÓN
nombre_sucio <- "  Lullula arborea  "
nombre_limpio <- trimws(nombre_sucio)
nombre_mayus <- toupper(nombre_limpio)

nombre_mayus <- toupper(trimws(nombre_sucio)) # Alternativa anidando funciones

#-------------------------------------------------------------------------#

# EJERCICIO 2: Generación de códigos de etiquetado y búsqueda
# Contexto: En un herbario, las muestras se etiquetan combinando el género 
# y un código numérico. 
# 1. Crea una variable 'genero' con el texto "Quercus" y una variable 'id' 
#    con el número 105.
# 2. Únelos con un guion ("-") para crear el código "Quercus-105".
# 3. Comprueba mediante una función lógica si el código generado contiene 
#    la palabra "Quercus".


# SOLUCIÓN:
genero <- "Quercus"
id <- 105
codigo_muestra <- paste(genero, id, sep = "-")
grepl("Quercus", codigo_muestra)

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

# EJERCICIO 1: Rango de tolerancia térmica
# Contexto: Una especie de anfibio solo es activa cuando la temperatura ambiente 
# está entre los 15 °C (mínimo) y los 28 °C (máximo), ambos inclusive.
# 1. Crea una variable 'temp_actual' con el valor 28.5.
# 2. Crea una variable lógica llamada 'es_activa' que evalúe si la temperatura 
#    actual está dentro del rango de tolerancia (mayor o igual a 15 Y menor o igual a 28).
# 3. Invierte el resultado anterior usando el operador inverso para saber si 
#    el animal está en situación de "estrés térmico".


# SOLUCIÓN:
temp_actual <- 28.5
es_activa <- (temp_actual >= 15) & (temp_actual <= 28)
!es_activa

#-------------------------------------------------------------------------#

# EJERCICIO 2: Validación de calidad en inventarios forestales
# Contexto: Estamos revisando una base de datos de árboles. Un registro se 
# considera "sospechoso" si ocurre cualquiera de estas dos condiciones:
#    a) El diámetro (DAP) es menor o igual a 0 cm (error de medida).
#    b) La especie registrada no coincide con "Pinus sylvestris" (fuera de zona).
# 1. Define 'dap' como 45 y 'especie' como "Pinus sylvestris".
# 2. Crea la variable 'es_sospechoso' usando el operador OR (|). Ten en cuenta 
#    que R es sensible a mayúsculas.
# 3. Comprueba qué ocurre si cambias la especie a "pinus sylvestris" (en minúsculas).



# SOLUCIÓN:
dap <- 45
especie <- "Pinus sylvestris"

# Evaluación de sospecha (¿DAP <= 0 O especie distinta de "Pinus sylvestris"?)
es_sospechoso <- (dap <= 0) | (especie != "Pinus sylvestris")
es_sospechoso  # Devuelve FALSE (el dato es correcto)

# Prueba con error de formato
especie_error <- tolower(especie)
es_sospechoso_error <- (dap <= 0) | (especie_error != "Pinus sylvestris")
es_sospechoso_error  # Devuelve TRUE (R detecta que no son idénticos)

#-------------------------------------------------------------------------#

# Faltantes ----

## Valores NA
NA     # Not Available: Valor Faltante o Perdido. El valor existe pero se desconoce.
is.na(NA)      # devuelve TRUE
# Se pueden asignar a variables
faltante <- NA
# Los NA suelen "propagar" la incertidumbre en los cálculos
10 + NA       # devuelve NA (si no sabemos un sumando, no sabemos el resultado)

#-------------------------------------------------------------------------#

# Nulos ----

## Valores NULL
NULL   # Null: Valor Nulo. Indica que el objeto o valor no existe (vacío absoluto).
is.null(NULL)  # devuelve TRUE
# Se pueden asignar a variables
vacio <- NULL


#==============================================================================#
# EJERCICIOS DE REPASO
#==============================================================================#

# EJERCICIO 1: Cinética enzimática y normalización de datos
# Contexto: En un ensayo de laboratorio, la velocidad de una reacción enzimática 
# (V) se mide en 45.895 unidades. Sin embargo, para comparar con otros estudios, 
# se requiere transformar este valor a una escala logarítmica (base 2), 
# redondearlo al entero superior y asegurarse de que el resultado sea de tipo "integer".
# 1. Crea la variable 'v_medida' con el valor 45.895.
# 2. En una sola línea de código, calcula el logaritmo en base 2, aplica el 
#    redondeo al entero superior (ceiling) y transforma el resultado a entero.

# SOLUCIÓN:
v_medida <- 45.895
v_final <- as.integer(ceiling(log2(v_medida)))
v_final


#------------------------------------------------------------------------------#

# EJERCICIO 2: Reconstrucción de secuencias y metadatos
# Contexto: Un equipo de campo ha enviado una etiqueta de una muestra de ADN 
# con el formato: "   S-2024_01_canis_lupus   ". Necesitas normalizarla para 
# tu base de datos siguiendo estos pasos:
# 1. Elimina los espacios en blanco sobrantes.
# 2. Extrae únicamente el nombre de la especie ("canis_lupus"). Tip: Usa 
#    substring sabiendo que empieza en la posición 10.
# 3. Sustituye el guion bajo por un espacio en blanco.
# 4. Convierte la primera letra en mayúscula y el resto en minúscula (Formato Título).

# SOLUCIÓN:
etiqueta_sucia <- "   S-2024_01_canis_lupus   "
paso1 <- trimws(etiqueta_sucia)
paso2 <- substring(paso1, 10)
paso3 <- gsub("_", " ", paso2)
# Nota: Para el paso 4, asumiendo que el alumno conoce funciones básicas de texto
especie_final <- paste0(toupper(substring(paso3, 1, 1)), substring(paso3, 2))
especie_final


#------------------------------------------------------------------------------#

# EJERCICIO 3: Modelado de nicho y condiciones de exclusión
# Contexto: Estás definiendo el área de idoneidad para una planta endémica.
# La planta solo sobrevive si:
#    - La precipitación (prec) es mayor a 500 mm Y menor a 1200 mm.
#    - El pH del suelo NO es NA (dato conocido).
#    - Además, si la especie es "invasora", se descarta automáticamente.
# 1. Define 'prec' como 850, 'ph' como 6.2 y 'tipo' como "nativa".
# 2. Crea una variable lógica 'apta' que evalúe si se cumplen las condiciones
#    de precipitación Y que el pH no sea NA Y que 'tipo' sea igual a "nativa".

# SOLUCIÓN:
prec <- 850
ph <- 6.2
tipo <- "nativa"

apta <- (prec > 500 & prec < 1200) & (!is.na(ph)) & (tipo == "nativa")
apta


#------------------------------------------------------------------------------#

# EJERCICIO 4: Estimación de biomasa forestal (Alometría)
# Contexto: La biomasa (B) de un árbol se estima a menudo con la fórmula: 
# B = exp(a + b * log(DAP)), donde 'a' y 'b' son coeficientes específicos 
# y 'DAP' es el Diámetro a la Altura del Pecho.
# 1. Asigna a = -2.5, b = 2.4 y dap = 30.
# 2. Calcula la biomasa en una variable 'biomasa_kg'.
# 3. Supongamos que un segundo árbol tiene un DAP de NA. Calcula su biomasa
#    y comprueba si el resultado es un valor lógico TRUE mediante is.na().

# SOLUCIÓN:
a <- -2.5
b <- 2.4
dap <- 30

biomasa_kg <- exp(a + b * log(dap))
biomasa_kg

dap_missing <- NA
biomasa_missing <- exp(a + b * log(dap_missing))
is.na(biomasa_missing)

### Funciones

## ¿Qué es una función?
# Es un bloque de código reutilizable diseñado para realizar una tarea específica. 
# Piensa en ella como una "caja negra": le das una entrada (argumentos), 
# hace algo, y te devuelve una salida (resultado).

## ¿Cómo usar una función?
# Se escribe el nombre de la función seguido de paréntesis.
# Dentro de los paréntesis se colocan los argumentos.
round(3.14159, digits = 2) # Ejemplo: redondea a 2 decimales

## Funciones base
# R viene con cientos de funciones preinstaladas (sum, mean, max, etc.)
sum(c(1, 10, 100))
abs(-50) # Ejemplo básico: valor absoluto

# Ayuda de una función
# Si no sabes qué hace una función o qué argumentos necesita:
?sum
help(mean)

## Parámetros de una función
# Son las variables que la función necesita para trabajar.
# Algunos son obligatorios y otros tienen valores por defecto.
seq(from = 1, to = 10, by = 2) # from, to y by son parámetros

## Funciones útiles extra
# 1. trimws() - "Trim White Spaces"
# Elimina los espacios en blanco sobrantes al principio y al final de un texto.
texto_sucio <- "   Hola Mundo   "
trimws(texto_sucio) # Resultado: "Hola Mundo"

# También se aplica a vectores
textos_sucios <- c("   Hola mundo    ", "Soy experto en R    ")
trimws(textos_sucios)

# Útil cuando importas datos de Excel donde la gente escribe espacios por error.

# 2. strsplit() - "String Split"
# Divide una cadena de texto en varias partes según un separador.
# IMPORTANTE: Siempre devuelve una LISTA.
fecha <- "2023-10-25"
partes_fecha <- strsplit(fecha, split = "-") 
partes_fecha # Devuelve una lista con "2023", "10", "25"

# 3. unlist() - "Desenlistar"
# Convierte una lista en un vector simple. Se usa muchísimo junto a strsplit.
vector_fecha <- unlist(partes_fecha)
vector_fecha[1] # Ahora podemos acceder directamente al año: "2023"

# 4. substring() - "Sub-cadena"
# Extrae una parte de un texto indicando la posición inicial y final.
codigo <- "REF67890"
substring(codigo, first = 1, last = 3) # Extrae "REF"
substring(codigo, first = 4)           # Extrae desde la pos 4 al final: "67890"

# 5. paste() - Diferencia entre 'sep' y 'collapse'
# 'sep': Define el separador entre varios vectores distintos.
# 'collapse': Convierte un vector de varios elementos en UN SOLO texto.

# Ejemplo con sep:
paste("Gen", 1:3, sep = "_") 
# Resultado: "Gen_1" "Gen_2" "Gen_3" (Vectores independientes)

# Ejemplo con collapse:
paste(c("A", "B", "C"), collapse = " -> ") 
# Resultado: "A -> B -> C" (Un solo texto unido)

# 6. na.omit()
# Se utiliza para eliminar valores faltantes (NA) de un vector.
# En caso de usarse en una matriz o dataframe, eliminará todas las filas NA

# 7. runif()
# Se usa para generar tantos números aleatorios como se indique entre 0 y 1
runif(1) # un número aleatorio
runif(5) # 5 números aleatorios

datos_sensor <- c(23.5, 24.1, NA, 22.8, 25.0)
na.omit(datos_sensor) # sigue siendo un vector, pero tiene un atributo, si queremos dejarlo como vector limpio:
as.numeric(na.omit(datos_sensor)) # no es necesario, el vector anterior es completamente funcional

matriz1 <- matrix(1:9, ncol = 3, nrow = 3)
matriz1[1,1] <- NA
na.omit(matriz1) # elimina la primera fila completa

# 8. is.na()
# Se usa para determinar los elementos que son NA (devuelve TRUE o FALSE)
is.na(NA) # Devuelve TRUE
is.na(c(NA, 1, 8, 5)) # Devuelve TRUE, FALSE, FALSE, FALSE
is.na(matriz1) # Devuelve una matriz de TRUE y FALSE

# 9. set.seed()
# Se usa para establecer una semilla de aleatoriedad, muy útil cuando queremos replicar un caso
sample(1:6, size = 1)
sample(1:6, size = 1)

set.seed(12345) # al fijar una semilla de aleatoriedad (un número cualquiera) siempre obtendremos el mismo resultado
sample(1:15, size = 1) # no solo va a salir siempre el mismo resultado, sino que en todos los PCs del mundo saldría ese resultado

set.seed(12345) # al fijar una semilla de aleatoriedad (un número cualquiera) siempre obtendremos el mismo resultado
sample(1:15, size = 1)

# 10. unique()
# Se usa para seleccionar los valores únicos de un vector
unique(c(1,1,1,1,1,2,5,6,7,7,7,7))

### Ampliando R

## ¿Qué es una librería?
# Es un paquete de funciones, datos y documentación extra que alguien ha 
# escrito y compartido para que otros lo usen (ej. ggplot2 para gráficas).

## Instalar de CRAN, cargar y usar
# CRAN es el repositorio oficial de R.
# install.packages("nombre") # Solo se hace una vez
# library(nombre)           # Se hace cada vez que abres R
# install.packages("tidyverse") # Ejemplo: una librería para análisis de datos
# library(tidyverse)

## Bioconductor
# Es un repositorio especializado en herramientas para el análisis de 
# datos genómicos y biológicos. Se instala con un paquete especial (BiocManager).
# install.packages("BiocManager")
# BiocManager::install("limma")


### Funciones creadas por el usuario

## Anatomía de una función: nombre, argumentos, cuerpo, return
# nombre <- function(argumentos) {
#   cuerpo (operaciones)
#   return(resultado)
# }

# Ejemplo: Función para calcular el área de un círculo
calcular_area <- function(radio) {
  area <- pi * radio^2
  return(area)
}
calcular_area(5)

## Argumentos opcionales y obligatorios
# Podemos dar un valor por defecto a un argumento para hacerlo opcional.
saludar <- function(nombre, mensaje = "Hola") {
  paste(mensaje, nombre)
}
# Uso del argumento por defecto
# Como no especificamos 'mensaje', R utiliza "Hola" (el valor predefinido).
saludar("Alex") 

# Especificación explícita (Nombre del argumento)
# Indicamos qué valor va a cada parámetro. Es la forma más segura y clara.
saludar("Alex", mensaje = "Buenos días")

# Sobreescritura por posición
# R asigna los valores en el orden en que se definieron: 
# "Alex" va a 'nombre' y "Buenos días" va a 'mensaje'.
saludar("Alex", "Buenos días") 

# Cambio de orden (Uso de nombres)
# Al usar el nombre del argumento (mensaje = ...), el orden deja de importar.
# R busca la etiqueta y asigna el valor correctamente.
saludar(mensaje = "Buenos días", nombre = "Alex")

## ¿return es obligatorio?
# No es estrictamente obligatorio; R devuelve siempre la última línea 
# evaluada. Sin embargo, usar return() es una buena práctica para que 
# el código sea más legible.


### Motivos para crear una función

## Evita repetir código
# Si vas a copiar y pegar un bloque de código más de 3 veces, haz una función.

## Hacer código más legible y organizado
# Es más fácil entender `limpiar_datos(df)` que ver 50 líneas de limpieza.

## Usar funciones anidadas
# Una función puede llamar a otra función dentro de su cuerpo.
cuadrado <- function(x){
  return(x * x)
}
suma_cuadrados <- function(a, b) {
  total <- cuadrado(a) + cuadrado(b)
  return(total)
}
suma_cuadrados(3, 4)

## Aplicar funciones en familia apply()
# Puedes usar tus propias funciones con sapply o lapply.
mi_doble <- function(x) {
  return(x * 2)
}
sapply(c(1, 2, 3), mi_doble)

# También podemos definirlo como:
sapply(c(1, 2, 3), function(x){ # a esto se le llama función anónima
  return(x*2)
})

## Ámbitos y variables de Función

# Variables Locales (de función)
# Son variables creadas DENTRO de una función. Solo existen mientras la 
# función se ejecuta y "mueren" al terminar. No aparecen en tu Environment.
calcular_potencia <- function(base) {
  resultado_local <- base ^ 2  # Esta variable es invisible fuera de aquí
  return(resultado_local)
}
# Si intentas imprimir 'resultado_local' fuera de dicha función, R dará error, salvo que la hayas creado antes

# Variables Globales
# Son las variables que viven en tu Environment (panel derecho). 
# Las funciones pueden "leer" variables globales, pero no deberían modificarlas 
# a menos que sea estrictamente necesario.
tasa_iva <- 0.21 # Variable Global

aplicar_impuesto <- function(precio) {
  return(precio * (1 + tasa_iva)) # La función "mira" hacia afuera y encuentra el IVA
}

# El operador de asignación global (<<-)
# Se usa dentro de una función para modificar una variable que está fuera (en el Environment). 
# ¡Cuidado! Úsalo con moderación porque puede ensuciar tu código.
contador_global <- 0
incrementar <- function() {
  contador_global <<- contador_global + 1 # Modifica la variable externa
}

# Funciones Anónimas (Lambda)
# Son funciones que no tienen nombre. Se crean, se usan y se olvidan.
# Son muy útiles dentro de la familia apply() o purrr para tareas rápidas.

# Ejemplo: Queremos elevar al cuadrado un vector sin crear una función con nombre
sapply(c(1, 2, 3), function(x) x^2)

# Funciones como Argumentos
# En R, las funciones son "objetos de primera clase". Esto significa que 
# puedes pasar una función como si fuera un número a OTRA función.
operar <- function(x, funcion_a_usar) {
  funcion_a_usar(x)
}
operar(c(1, 4, 9), sqrt) # Le pasamos la función de raíz cuadrada



## Ejemplos Reales

# 1. Análisis estadístico rápido
# escribir una función que devuelva una lista con la media, la mediana, el mínimo, el máximo y la sd de un vector numérico
datos <- c(15, 18, NA, 45, 25, 10)
resumen_variable <- function(v){
  v <- na.omit(v) # eliminar na.omit
  resultado <- list(
    media = mean(v),
    mediana = median(v),
    min = min(v),
    max = max(v),
    sd = sd(v)
  )
  return(resultado)
}
resumen_variable(datos)

## 2. Clasificador de Riesgo con validación de datos
# Útil para clasificar pacientes o clientes basándose en múltiples reglas.
# función con dos parámetros (edad y colesterol)
# ALTO RIESGO -> edad > 60 OR colesterol > 240
# MODERADO -> edad > 40 AND colesterol > 200
# Bajo -> Todo lo demás

# Paso 1 - Simular datos
set.seed(123456789) # fijamos semilla

# Creamos un DataFrame con 100 pacientes ficticios
df <- data.frame(
  edad = sample(20:80, 100, replace = TRUE),        # Edades entre 20 y 80 años
  colesterol = sample(100:260, 100, replace = TRUE) # Colesterol entre 100 y 260
)

# Seleccionamos 10 posiciones aleatorias para "ensuciar" los datos con NAs
redad <- sample(1:100, 10)
rcolesterol <- sample(1:100, 10)

# Introducimos valores faltantes (NA) en esas posiciones
df$edad[redad] <- NA
df$colesterol[rcolesterol] <- NA

# Definimos la función clasificar_riesgo con dos parámetros
clasificar_riesgo <- function(edad, colesterol) {
  
  # VALIDACIÓN INICIAL: 
  # Si cualquiera de los dos datos es NA, no podemos calcular el riesgo.
  if (is.na(edad) | is.na(colesterol)){
    return("Datos incompletos")
  }
  
  # LÓGICA DE NEGOCIO:
  # Regla 1: Alto riesgo si es mayor de 60 años O tiene colesterol > 240
  if (edad > 60 | colesterol > 240) {
    status <- "ALTO RIESGO"
    
    # Regla 2: Riesgo moderado si es mayor de 40 años Y tiene colesterol > 200
  } else if (edad > 40 & colesterol > 200) {
    status <- "MODERADO"
    
    # Regla 3: Si no cumple ninguna de las anteriores, el riesgo es bajo
  } else {
    status <- "BAJO"
  }
  
  return(status) # Devolvemos el resultado
}

# Probamos la lógica con casos individuales
clasificar_riesgo(65, 180) # Debería dar: "ALTO RIESGO"
clasificar_riesgo(30, 190) # Debería dar: "BAJO"
clasificar_riesgo(NA, 150) # Debería dar: "Datos incompletos"


### 3. APLICACIÓN MASIVA (Automatización)

# Usamos sapply para recorrer el dataframe fila por fila.
# El primer argumento (1:nrow(df)) le dice a R que itere desde 1 hasta 100.
# Usamos una FUNCIÓN ANÓNIMA que toma 'i' (el número de fila actual).

resultado_riesgo <- sapply(1:nrow(df), function(i){
  
  # Extraemos la fila completa número 'i'
  row_values <- df[i,]
  
  # Extraemos los valores específicos de esa fila
  edad <- row_values$edad
  colesterol <- row_values$colesterol
  
  # Llamamos a nuestra función principal y devolvemos su resultado
  return(clasificar_riesgo(edad, colesterol))
})

resultado_riesgo


# 3. Conversor de Moneda
# Objetivo: Crear una tabla comparativa de valores en distintas divisas partiendo de una entrada.

# La función debe tomar como entrada un valor y el tipo de moneda:
# convertir_moneda <- function(valor, moneda = "euro")

# --- PREPARACIÓN DEL ENTORNO ---

# Definimos una LISTA GLOBAL con los tipos de cambio con respecto al Euro.
# Esta lista servirá como "diccionario" de referencia para nuestra función.
lista_conversiones <- list(dolar = 1.16, yen = 183.53, franco = 0.93, peso = 1670.22)

# --- PRUEBAS DE LÓGICA (Prototipado) ---

# Escenario A: Si la moneda de entrada ya es Euro.
moneda = "euro"
valor = 500
# Creamos el dataframe multiplicando el valor por cada factor de la lista.
data.frame(euros = valor,
           dolares = valor * lista_conversiones$dolar,
           yenes = valor * lista_conversiones$yen,
           francos = valor * lista_conversiones$franco,
           pesos = valor * lista_conversiones$peso)

# Escenario B: Si la moneda de entrada NO es Euro (ej. Dólar).
moneda = "dolar"
# Paso 1: Convertimos el valor original a Euros (dividiendo por su tasa).
valor_euros <- valor / lista_conversiones[[moneda]] 
# Paso 2: Actualizamos 'valor' para que la construcción del dataframe sea idéntica.
valor <- valor_euros
data.frame(euros = valor,
           dolares = valor * lista_conversiones$dolar,
           yenes = valor * lista_conversiones$yen,
           francos = valor * lista_conversiones$franco,
           pesos = valor * lista_conversiones$peso)

# --- DEFINICIÓN DE LA FUNCIÓN ---

convertir_moneda <- function(valor, moneda = "euro"){
  
  # LÓGICA DE NORMALIZACIÓN:
  # Si la moneda no es euro, primero calculamos su equivalente en euros.
  # Usamos [[moneda]] para buscar el nombre dinámicamente en la lista global.
  if (moneda != "euro"){
    valor_euros <- valor / lista_conversiones[[moneda]]
    valor <- valor_euros # 'valor' ahora es la base en euros
  }
  
  # CONSTRUCCIÓN DEL RESULTADO:
  # Generamos el dataframe con todas las conversiones aplicadas.
  df <- data.frame(euros = valor,
                   dolares = valor * lista_conversiones$dolar,
                   yenes = valor * lista_conversiones$yen,
                   francos = valor * lista_conversiones$franco,
                   pesos = valor * lista_conversiones$peso)
  
  return(df) # Devolvemos el dataframe completo
}

# --- PRUEBAS DE LA FUNCIÓN ---

convertir_moneda(100, "yen")     # ¿Cuánto valen 100 yenes en las demás monedas?
convertir_moneda(100, "euro")    # ¿Cuánto valen 100 euros?
convertir_moneda(100, "franco")  # ¿Cuánto valen 100 francos suizos?

# --- AUTOMATIZACIÓN (Iteración) ---

# Ejecutamos la función para un rango de valores (de 50 a 60 dólares).
# lapply aplicará 'convertir_moneda' a cada número del vector 50:60.
# El argumento 'moneda = "dolar"' se pasa automáticamente a la función.
resultados_lista <- lapply(50:60, convertir_moneda, moneda = "dolar")
resultados_lista

# Nota: El resultado es una LISTA de 11 dataframes.
# Para unir todos los dataframes en uno solo, podrías usar: do.call(rbind, resultados_lista)
do.call(rbind, resultados_lista)


# 4. Estandarizar texto. Imagina que recibes este vector y debes limpiarlo para que se vea:
# Juan, Maria, Pedro y Maria Jesus
nombres_sucios <- c("  juAn ", "MarIa", " Pedro  ", " maRia jeSus ")

# primer escenario: simple -> "Juan"
nombre1 <- nombres_sucios[1]
nombre1
paso1 <- trimws(nombre1)
paso1
primera_letra <- substring(paso1, 1, 1)
primera_letra
primera_letra_mayus <- toupper(primera_letra)
primera_letra_mayus
resto_letras <- substring(paso1, 2)
resto_letras
resto_letras_minus <- tolower(resto_letras)
resto_letras_minus
nombre_completo <- paste0(primera_letra_mayus, resto_letras_minus)
nombre_completo

# segundo escenario: complejo -> "Maria Jesus"
nombre1 <- nombres_sucios[4]
nombre1
paso1 <- trimws(nombre1)
paso1
primera_letra <- substring(paso1, 1, 1)
primera_letra
primera_letra_mayus <- toupper(primera_letra)
primera_letra_mayus
resto_letras <- substring(paso1, 2)
resto_letras
resto_letras_minus <- tolower(resto_letras)
resto_letras_minus
nombre_completo <- paste0(primera_letra_mayus, resto_letras_minus)
nombre_completo

# usando strsplit
palabras <- strsplit(paso1, " ") # añadido
palabras
palabras <- unlist(palabras) # añadido
palabras
primera_letra <- substring(palabras, 1, 1)
primera_letra
primera_letra_mayus <- toupper(primera_letra)
primera_letra_mayus
resto_letras <- substring(palabras, 2)
resto_letras
resto_letras_minus <- tolower(resto_letras)
resto_letras_minus
nombre_completo <- paste0(primera_letra_mayus, resto_letras_minus)
nombre_completo
nombre_completo <- paste(nombre_completo, collapse = " ") # añadido
nombre_completo

# funciona con nombres simples?
nombre1 <- nombres_sucios[1]
nombre1
paso1 <- trimws(nombre1)
paso1
palabras <- strsplit(paso1, " ") # primer paso dudoso
palabras # check!
palabras <- unlist(palabras) 
palabras # en este caso el resultado no varía, pero en caso de casos como maria jesus hace el arreglo
primera_letra <- substring(palabras, 1, 1)
primera_letra
primera_letra_mayus <- toupper(primera_letra)
primera_letra_mayus
resto_letras <- substring(palabras, 2)
resto_letras
resto_letras_minus <- tolower(resto_letras)
resto_letras_minus
nombre_completo <- paste0(primera_letra_mayus, resto_letras_minus)
nombre_completo
nombre_completo <- paste(nombre_completo, collapse = " ") # segundo paso dudoso
nombre_completo # este bloque de código tampoco sirve de nada en este caso, pero con maria jesus nos sirve y a este no le afecta

# Crear la función: dos partes -> paso1 (trimws) y paso2 (toda la limpieza)
# para el paso 2 es buena idea hacer otra función. empezamos con ella

# FUNCIÓN 1: Capitalizar (Responsabilidad: Manejar el texto palabra por palabra)
capitalizar_nombre <- function(nombre){
  # 1. Separar por espacios y convertir en vector simple
  palabras <- unlist(strsplit(nombre, " "))
  
  # 2. Transformar letras (Mayúscula la primera, minúscula el resto)
  primera_letra <- toupper(substring(palabras, 1, 1))
  resto_letras  <- tolower(substring(palabras, 2))
  
  # 3. Recomponer el nombre compuesto
  nombre_capitalizado <- paste0(primera_letra, resto_letras)
  nombre_capitalizado <- paste(nombre_capitalizado, collapse = " ")
  
  return(nombre_capitalizado)
} 

# el paso 2 funciona estupendamente
capitalizar_nombre("juan")
capitalizar_nombre("maria jesus")

# FUNCIÓN 2: Limpiar Nombres (Responsabilidad: Limpiar el vector y aplicar la capitalización)
limpiar_nombres <- function(texto){
  # Paso 1: Limpieza de espacios en blanco en todo el vector
  paso1 <- trimws(texto) 
  
  # Paso 2: Aplicar la función de capitalización a cada elemento limpio.
  # Usamos sapply porque queremos que el resultado sea un vector de nuevo.
  paso2 <- sapply(paso1, capitalizar_nombre) 
  
  # Estética: sapply suele poner el texto original como nombre del vector, lo quitamos.
  names(paso2) <- NULL 
  
  return(paso2)
}

limpiar_nombres(nombres_sucios)


### BLOQUE DE EJERCICIOS: FUNCIONES COMPLEJAS

## -- EJERCICIO 1: Reporte de Calidad de Datos --
# Objetivo: Crear una función que reciba un vector y devuelva una lista con diagnósticos.
# Debe calcular: Total elementos, cantidad de NA, % de NAs y la Moda (valor más repetido).

# Pista para la moda: sort(table(x), decreasing = TRUE)[1]

diagnostico_vector <- function(v) {
  # --- Escribe tu código aquí ---
  # total_elementos <- 
  # Pista: para contabilizar número de NA, deberías filtrar el vector con los elementos que sean NA
  # v_na <- 
  # perc_na <- 
  # Pista para la moda: sort(table(x), decreasing = TRUE)[1]
  # moda <- 
  informe <- list(
    # completar
  )
  # ------------------------------
  return(informe)
}

# Prueba:
test_v <- c(1, 2, NA, 4, 2, 2, NA)
diagnostico_vector(test_v)


## -- EJERCICIO 2: Calculadora de Tarifas de Envío --
# Objetivo: Determinar el coste de envío según peso y destino usando sapply.

# Paso 1: Simular datos (Ejecuta esto)
set.seed(123)
envios <- data.frame(
  id = 1:50,
  peso = sample(c(2, 10, 25, NA), 50, replace = TRUE),
  destino = sample(c("Nacional", "Internacional"), 50, replace = TRUE)
)

# Paso 2: Crear función calcular_envio(peso, destino)
# Reglas: Internacional = 50. Nacional: <5kg = 10, 5-20kg = 20, >20kg = 40.
calcular_envio <- function(peso, destino) {
  # --- Escribe tu código aquí ---
  
  
  # ------------------------------
}

# Paso 3: Aplicar a la tabla con sapply
# envios$coste <- sapply(1:nrow(envios), function(i) { ... })


## -- EJERCICIO 3: Descuento Dinámico --
# Objetivo: Calcular precio final usando una lista global de descuentos.

descuentos <- list(ropa = 0.20, electronica = 0.10, hogar = 0.05)

calcular_precio_final <- function(precio, categoria) {
  # --- Escribe tu código aquí ---
  # Pista: Comprobar si la categoria existe en la lista: categoria %in% names(descuentos)
  
  
  # ------------------------------
}

# Prueba con lapply para una lista de precios de "ropa"
precios_test <- c(100, 200, 300)
# lapply(precios_test, calcular_precio_final, categoria = "ropa")


## -- EJERCICIO 4: Generador de Correos Corporativos --
# Objetivo: De "  Lucas GOMEZ " -> "lgomez@empresa.com"
# Requiere: Función anidada. Una para procesar 1 nombre y otra para el vector.

nombres_personal <- c("  Lucas GOMEZ ", "AnA mArIn ", "  Luis feRnandez ")

crear_email_unitario <- function(nombre_completo) {
  # 1. Limpiar espacios y minúsculas
  # 2. Separar nombre y apellido (strsplit)
  # 3. Extraer primera letra del nombre y pegarla al apellido
  # 4. Añadir "@empresa.com"
  
  # --- Escribe tu código aquí ---
  
  
  # ------------------------------
}

generar_base_emails <- function(vector_nombres) {
  # Debería usar trimws y luego sapply llamando a la función anterior
}

# Prueba final:
# generar_base_emails(nombres_personal)

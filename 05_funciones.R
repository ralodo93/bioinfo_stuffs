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

datos_sensor <- c(23.5, 24.1, NA, 22.8, 25.0)
na.omit(datos_sensor) # sigue siendo un vector, pero tiene un atributo, si queremos dejarlo como vector limpio:
as.numeric(na.omit(datos_sensor)) # no es necesario, el vector anterior es completamente funcional

matriz1 <- matrix(1:9, ncol = 3, nrow = 3)
matriz1[1,1] <- NA
na.omit(matriz1) # elimina la primera fila completa

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
sapply(c(1, 2, 3), function(x){
  return(x*2)
})

## Ejemplos Reales

# 1. Análisis estadístico rápido
# escribir una función que devuelva una lista con la media, la mediana, el mínimo, el máximo y la sd de un vector numérico
datos <- c(15, 18, NA, 45, 25, 10)
resumen_variable <- function(v){
  v <- na.omit(v) # eliminar na.omit
  resultado <- list(
    media = mean(v),
    mdiana = median(v),
    min = min(v),
    max = max(v),
    sd = sd(v)
  )
  return(resultado)
}

resumen_variable(datos)

# 3. Automatización de flujo de condicionales
# Útil para clasificar pacientes o clientes basándose en múltiples reglas.
# función con dos parámetros (edad y colesterol)
# ALTO RIESGO -> edad > 60 OR colesterol > 240
# MODERADO -> edad > 40 AND colesterol > 200
# BAJO -> Todo lo demás

clasificar_riesgo <- function(edad, colesterol) {
  if (edad > 60 | colesterol > 240) {
    status <- "ALTO RIESGO"
  } else if (edad > 40 & colesterol > 200) {
    status <- "MODERADO"
  } else {
    status <- "BAJO"
  }
  return(status)
}

# Probamos la lógica
clasificar_riesgo(65, 180) # Alto riesgo por edad
clasificar_riesgo(30, 190) # Bajo riesgo


# 3. Conversor de Moneda
# Crea una función que tome un valor y un tipo de moneda. Debe generar un data.frame con los valores de varias monedas
# Usa estas similitudes:

# 1 € = 1.16 $
# 1 € = 183.53 yenes
# 1 € = 0.93 francos suizos
# 1 € = 1670.22 pesos argentinos

# convertir_moneda <- function(valor, moneda = "euro"){ rellenar }

# creamos lista de conversiones con respecito a euros
lista_conversiones <- list(dolar = 1.16, yen = 183.53, franco = 0.93, peso = 1670.22)

# funcionalidad con moneda = "euro"
moneda = "euro"
valor = 500
data.frame(euros = valor,
           dolares = valor * lista_conversiones$dolar,
           yenes = valor * lista_conversiones$yen,
           francos = valor * lista_conversiones$franco,
           pesos = valor * lista_conversiones$peso)

# funcionalidad con moneda != "euro"
moneda = "dolar"
valor_euros <- valor / lista_conversiones[[moneda]]
valor <- valor_euros
data.frame(euros = valor,
           dolares = valor * lista_conversiones$dolar,
           yenes = valor * lista_conversiones$yen,
           francos = valor * lista_conversiones$franco,
           pesos = valor * lista_conversiones$peso)

# crear la función
convertir_moneda <- function(valor, moneda = "euro"){
  if (moneda != "euro"){
    valor_euros <- valor / lista_conversiones[[moneda]]
    valor <- valor_euros
  }
  
  df <- data.frame(euros = valor,
                   dolares = valor * lista_conversiones$dolar,
                   yenes = valor * lista_conversiones$yen,
                   francos = valor * lista_conversiones$franco,
                   pesos = valor * lista_conversiones$peso)
  return(df)
}

convertir_moneda(100, "yen")
convertir_moneda(100, "euro")
convertir_moneda(100, "franco")

# ejecutar en un lapply
lapply(50:60, convertir_moneda, moneda = "dolar")


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
palabras <- strsplit(paso1, " ")
palabras
palabras <- unlist(palabras)
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
nombre_completo <- paste(nombre_completo, collapse = " ")
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

capitalizar_nombre <- function(nombre){
  palabras <- unlist(strsplit(nombre, " "))
  primera_letra <- substring(palabras, 1, 1)
  primera_letra <- toupper(primera_letra)
  resto_letras <- substring(palabras, 2)
  resto_letras <- tolower(resto_letras)
  nombre_capitalizado <- paste0(primera_letra,
                                resto_letras)
  nombre_capitalizado <- paste(nombre_capitalizado, collapse = " ")
  return(nombre_capitalizado)
}

# el paso 2 funciona estupendamente
capitalizar_nombre("juan")
capitalizar_nombre("maria jesus")

# crear la función con el paso1 (trimws()) y el paso2 (capitalizar_nombre)
limpiar_nombres <- function(texto){
  paso1 <- trimws(texto) # se usa para quitar los espacios al principio y al final de todos elementos
  paso2 <- sapply(paso1, capitalizar_nombre) # aplico un sapply con la función capitalizar_nombre
  names(paso2) <- NULL # le quito los names (estética)
  return(paso2)
}

limpiar_nombres(nombres_sucios)






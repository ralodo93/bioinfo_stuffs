## Funciones base: Ya están listas para usar
notas <- c(7.5, 8.2, 9.0, 6.5)
especies <- c("Roble", "Pino", "Roble", "Encina", "Pino")
m <- matrix(1:9, nrow=3, ncol=3)

# 1. Inspección de datos (Para saber qué tenemos)
mean(notas)                  # Calcula el promedio aritmético
?mean()                       # Abre el manual de ayuda para ver los argumentos de la función
notas1 <- c(7.5, 8.2, 9.0, 6.5, NA)
mean(notas1)                 # ERROR TÍPICO: Devuelve NA si hay un solo valor faltante
?mean()                        # Abre el manual de ayuda para ver los argumentos de la función
mean(notas1, na.rm = TRUE)   # SOLUCIÓN: na.rm (NA remove) ignora los vacíos para calcular
max(notas)                   # Devuelve el valor más alto del vector
min(notas)                   # Devuelve el valor más bajo del vector)
length(notas)                # Cuenta cuántos elementos hay en el vector
summary(notas)               # Resumen estadístico: Min, Max, Media y Cuartiles
str(notas)                   # Muestra la estructura (tipo de dato y longitud)
head(notas, 2)               # Muestra solo los primeros 2 elementos
round(notas)                 # Redondea al número entero más cercano
sum(notas)                   # Suma todos los elementos del vector
unique(especies)             # Elimina duplicados: muestra las categorías únicas

# 2. Comunicación de datos (Para mostrar resultados al usuario)
print(notas)                 # Muestra el contenido básico en la consola
paste("Las notas son:", notas) # Pega el texto a cada elemento del vector (vectorización)

# collapse une todo el vector en una sola cadena de texto
paste("Las notas son:", paste(notas, collapse = ", ")) 

# sep define qué carácter separa a objetos distintos
paste("Gen1", "Gen2", "Gen3", sep = " - ") 

# paste0 pega elementos sin espacios por defecto (ideal para etiquetas)
paste0("Las notas son -->", paste(notas, collapse = ", "))

# 3. Transformación de datos (Para modificar la estructura)
t(m)                         # Transponer: convierte filas en columnas y viceversa
sort(notas)                  # Ordena los números de menor a mayor
rev(notas)                   # Invierte el orden de los elementos (el último pasa a ser el primero)
toupper(especies)            # Convierte todo el texto a MAYÚSCULAS
tolower(especies)            # Convierte todo el texto a minúsculas

## Librerías 
# install.packages("openxlsx")
library(openxlsx) # Cargar una librería para manejar archivos Excel
# install.packages("tidyverse") # El paquete más famoso para ciencia de datos
library(tidyverse)
# install.packages("BiocManager") # Instalar Bioconductor
# BiocManager::install("GenomicRanges")
library(GenomicRanges)

## Crear nuestras propias funciones
# Sintaxis básica:
# nombre_funcion <- function(parametro1, parametro2, ...) {
#   # Cuerpo de la función: código que realiza la tarea
#   resultado <- parametro1 + parametro2  # Ejemplo de operación
#   return(resultado)  # Devuelve el resultado
# }

#  Ejemplo: Función que suma dos números
suma <- function(a, b) {
  resultado <- a + b
  return(resultado)
}
resultado_suma <- suma(5, 10) # por defecto el primer valor es a y el segundo b
resultado_suma <- suma(a = 5, b = 10)
resultado_suma <- suma(b = 10, a = 5) # El orden no importa si usas nombres

# Ejemplo: Función que calcula el área de un círculo
area_circulo <- function(radio) {
  area <- pi * radio^2
  return(area)
}
area5 <- area_circulo(5) # la variable area no se crea, es un ámbito local de la función

# Ejemplo: Función que crea un informe de un paciente
crear_informe <- function(paciente, resultados) {
  # Calculamos la media usando una función base
  media <- mean(resultados, na.rm = TRUE)
  # Unimos los resultados en una cadena bonita
  lista_puntos <- paste(resultados, collapse = " | ")
  # Construimos el mensaje final con paste0 (sin espacios extra)
  mensaje <- paste0("INFORME PACIENTE: ", paciente, 
                    "\nValores detectados: ", lista_puntos, # salto de línea \n
                    "\nPromedio final: ", round(media, 2))
  
  return(mensaje)
}
informe_juan <- crear_informe("Juan Pérez", c(7.5, 8.2, 9.0, 6.5))
print(informe_juan)
cat(informe_juan) # procesa caracteres especiales como \n (salto de línea) o \t (tabulador), lo que hace que los informes finales se vean mucho más limpios y profesionales en la consola.


# ¿Para que crear funciones?
# evitar repetir código. código organizado y legible
table1 <- data.frame(
  Nombre = c("Ana", "Luis", "Marta"),
  Res1 = c(5, 8, 7),
  Res2 = c(6, 9, 8),
  Res3 = c(7, 7, 9),
  Res4 = c(8, 6, 7)
)

table2 <- data.frame(
  Nombre = c("Carlos", "Sofía", "Javier"),
  Res1 = c(9, 5, 6),
  Res2 = c(8, 7, 7),
  Res3 = c(7, 8, 8),
  Res4 = c(6, 9, 9)
)

for (i in 1:nrow(table1)) {
  paciente <- table1$Nombre[i]
  resultados <- as.numeric(table1[i, 2:5])
  media <- mean(resultados, na.rm = TRUE)
  # Unimos los resultados en una cadena bonita
  lista_puntos <- paste(resultados, collapse = " | ")
  # Construimos el mensaje final con paste0 (sin espacios extra)
  mensaje <- paste0("INFORME PACIENTE: ", paciente, 
                    "\nValores detectados: ", lista_puntos, # salto de línea \n
                    "\nPromedio final: ", round(media, 2))
  cat(mensaje, "\n\n") # Imprime el informe con un salto de línea
}

for (i in 1:nrow(table2)) {
  paciente <- table2$Nombre[i]
  resultados <- as.numeric(table2[i, 2:5])
  media <- mean(resultados, na.rm = TRUE)
  # Unimos los resultados en una cadena bonita
  lista_puntos <- paste(resultados, collapse = " | ")
  # Construimos el mensaje final con paste0 (sin espacios extra)
  mensaje <- paste0("INFORME PACIENTE: ", paciente, 
                    "\nValores detectados: ", lista_puntos, # salto de línea \n
                    "\nPromedio final: ", round(media, 2))
  cat(mensaje, "\n\n") # Imprime el informe con un salto de línea
}

# Ahora usando la función creada
for (i in 1:nrow(table1)) {
  paciente <- table1$Nombre[i]
  resultados <- as.numeric(table1[i, 2:5])
  mensaje <- crear_informe(paciente, resultados)
  cat(mensaje, "\n\n") # Imprime el informe con un salto de línea
}

for (i in 1:nrow(table2)) {
  paciente <- table2$Nombre[i]
  resultados <- as.numeric(table2[i, 2:5])
  mensaje <- crear_informe(paciente, resultados)
  cat(mensaje, "\n\n") # Imprime el informe con un salto de línea
}

# Funciones anidadas
crear_informe_desde_tabla <- function(tabla){
  for (i in 1:nrow(tabla)) {
    paciente <- tabla$Nombre[i]
    resultados <- as.numeric(tabla[i, 2:ncol(tabla)])
    mensaje <- crear_informe(paciente, resultados) # usar una función dentro de otra
    cat(mensaje, "\n\n") # Imprime el informe con un salto de línea
  }
}

crear_informe_desde_tabla(table1)
crear_informe_desde_tabla(table2)


# --- EJERCICIO 0: Funciones Base ---
# Tarea: Calcular media de alturas ignorando NAs y redondear a 1 decimal
alturas <- c(1.70, 1.82, NA, 1.90, 1.65, 1.75, NA)


# --- EJERCICIO 1: Conversor Celsius a Kelvin (Fácil) --- kelvin = celsius + 273.15
celcius_a_kelvin <- function(celsius) {
  # rellenar
}
# Prueba:
celcius_a_kelvin(25)


# --- EJERCICIO 2: Generador de Etiquetas (Intermedio) --- -> devolver: MUESTRA-504_Pulmón
etiquetar_muestra <- function(id, tejido) {
  # rellenar
}
# Prueba:
etiquetar_muestra(504, "Pulmón")


# --- EJERCICIO 3: Validador de Calidad (Lógica) --- -> devolver "PASA" si valor > 50, sino "FALLA"
chequear_calidad <- function(valor) {
  # rellenar
}
# Prueba:
chequear_calidad(45)
chequear_calidad(60)


# --- EJERCICIO 4: Informador de Genes (Collapse) --- -> debe devolver: Los genes analizados son: TP53; BRCA1; MYC
resumen_genes <- function(genes) {
  #rellenar
}
# Prueba:
resumen_genes(c("TP53", "BRCA1", "MYC"))


# --- EJERCICIO 5: Analizador Meteorológico (Experto) ---
# Tarea: Recibe vector de temperaturas y devuelve los rangos mínimo y máximo y la media.
# Devolver en este formato: "El rango es de 5°C a 12°C con una media de 8.44°C"

analizar_clima <- function(temps) {
  # rellenar
}
# Prueba
analizar_clima(c(5,8,7,NA,10,12,6,9,11,8))

analizar_clima <- function(temps) {
  # 1. Cálculos base
  minimo <- min(temps, na.rm = TRUE)
  maximo <- max(temps, na.rm = TRUE)
  media  <- mean(temps, na.rm = TRUE)
  
  # 2. Construcción del mensaje
  informe <- paste0("El rango es de ", minimo, "°C a ", maximo, 
                    "°C con una media de ", round(media, 2), "°C")
  
  # 3. Retorno
  return(informe)
}



inventario_norte <- data.frame(
  Sitio = c("Bosque_A", "Bosque_B", "Bosque_C"),
  Roble = c(12, 0, 5),
  Pino = c(30, 45, 10),
  Encina = c(2, 15, 8),
  Abeto = c(0, 5, 20)
)

inventario_sur <- data.frame(
  Sitio = c("Ribera_1", "Ribera_2"),
  Sauce = c(20, 15),
  Aliso = c(10, 8),
  Chopo = c(5, 12),
  Fresno = c(0, 4)
)

# Definir la función básica para analizar cada parcela
# lo que va a hacer es:

nombre_parcela <- inventario_norte$Sitio[1]
conteos_especies <- as.numeric(inventario_norte[1, 2:ncol(inventario_norte)])

especies_detectadas <- length(conteos_especies[conteos_especies > 0])
total_individuos <- sum(conteos_especies, na.rm = TRUE)
promedio_por_especie <- mean(conteos_especies, na.rm = TRUE)
detalle_conteo <- paste(conteos_especies, collapse = " - ")
informe <- paste0("--- REPORTE ECOLÓGICO: ", nombre_parcela, " ---",
                  "\nConteos por especie: ", detalle_conteo,
                  "\nTotal de individuos: ", total_individuos,
                  "\nRiqueza (nº de especies): ", especies_detectadas,
                  "\nDensidad media: ", round(promedio_por_especie, 2), " ind/especie")

cat(informe)

# 1. Definimos la función básica: Informe de una sola parcela
analizar_parcela <- function(nombre_parcela, conteos_especies) {
  # rellenar
  return(informe)
}

# 2. Crear función anidada para analizar cada tabla al completo
procesar_inventario <- function(datos_inventario){
  cat("==========================================\n")
  cat("INICIANDO PROCESAMIENTO DE INVENTARIO\n")
  cat("==========================================\n\n")
  # rellenar
  
}

# 3. Ejecución del análisis
procesar_inventario(inventario_norte)
procesar_inventario(inventario_sur)


# Funciones ----

# Concepto y Uso de una Función ----

# Una función es un bloque de código que podemos reutilizar de forma sencilla y
# orgánica para aplicar la misma operación a diferentes datos. En este curso
# ya hemos visto muchas funciones, pero hemos pasado de lado por ellas, por lo
# que en este bloque aprenderemos realmente a usarlas.

## Uso y Ayuda de una Función ----

### Usar una Función ----
# Cómo hemos ido viendo a lo largo de la clase, las funciones se usar siguiendo la estructura de:
# nombre_funcion(argumento1, argument2, etc); obteniendo un resultado.
round(5.458, 2)

### Usar la Ayuda de una Función ----
# Cuando no sabemos (o no recordamos) como usar una función, las funciones instaladas en R tienen una sección
# de ayuda que nos sirve como guía y descripción de como usar dicha función, además de para que sirve y 
# algunos ejemplos de uso. Para acceder a la ayuda d euna función usamos ?nombre_funcion
?round

## Argumentos de una Función ----

# El aspecto clave como usuarios de una función (además de para que sirve) es saber los argumentos que pide una función.
# Un argumento es un elemento que usa una función para llevar a cabo una operación. Una función puede tener tantos argumentos
# como sea necesarios.
?round # Volviendo a la ayuda de round, vemos que tiene un argumento x y otro argumento digits
round(x = 5.258, digits = 2) # Ésta sería la forma "formal" de llamar a esta función

### Cómo usar los Argumentos de una Función ----
# Aunque siempre podemos usar las funciones mediante su forma "formal", en la mayoría de los casos
# querremos ahorrarnos un poco de código para tareas que conocemos bien. En este aspecto nos centraremos
# en como se usan los argumentos de una función, que siguen una serie de reglas simples:
# Por defecto, si no se indica ningún argumento, se asignan los argumentos por orden

round(5.258, 2) # x = 5.258, digits = 2
round(2, 5.258) # x = 2, digits = 5.258

# Si uno de los argumentos se asignan, el resto sigue el orden, pero el argumento asignado coge el valor que se le da
round(digits = 2, 5.258) # digits = 2, el primer argumento es x, por lo que x = 5.258

# En muchas ocasiones, las funciones definen algunos de estos argumentos asignando un valor por defecto. Es decir, en caso que
# ese argumento no se asigne a ningún valor, toma el preestablecido
?round
round(5.258) # el argumento digits por defecto es cero

?paste # el argumento collapse es NULL
?sample # el argumento replace es FALSE
?log # el argumento base es exp(1)


# RECOMENDACIÓN: Si conocéis una función y es una función simple (2-3 argumentos) podéis usarla sin asignar argumentos
seq(1, 10, 5)
substring("Hola Mundo", 2, 5)
log(10, 2)

# Pero si la función es más compleja o tiene un argumento diferencial que modifica su comportamiento, es mejor definir los argumentos
sample(c(1, 8, 6), size = 2, replace = TRUE)

### Funciones estadísticas ----
# Todas las funciones que aplican operaciones estadísticas a un vector numérico (media, suma, mediana etc) tiene un 
# argumento común que es motivo de muchos fallos en nuestro código
?mean # el argumento na.rm indica si se deben eliminar NAs antes de aplicar la media

vector_na <- 1:10
vector_na[3] <- NA
mean(vector_na) # devuelve NA ya que na.rm por defecto es FALSE
mean(vector_na, na.rm = TRUE) # Ahora elimina el NA y calcula la media


# Crear Funciones ----

# Habrá momentos en los que queramos crear nuestras propias funciones

## Estructura de una Función ----
# Para crear una función usamos la función function, con los elementos de una función: nombre, argumentos, cuerpo y return
# nombre_funcion <- function(arg1, arg2, ...){
#       bloque de código que indique que hace la función (cuerpo)
#       lo que devuelve la función (return)
# }

imprimir_saludo <- function(nombre, apellido){
  texto <- paste("Hola, me llamo", nombre, apellido)
  return(texto)
}

imprimir_saludo("Juan", "Álvarez")
imprimir_saludo("Ana","Torres")

# Como en la función se usa una función vectorizada, podemos usar esta funcionalidad
imprimir_saludo(nombre = c("Juan", "Ana"), apellido = c("Álvarez", "Torres"))

### Scope o Entorno de una función ----
# En la función anterior hemos creado una variable texto dentro de la función, sin embargo esa variable no se
# ha incorporado al entorno. Tampoco los argumentos de dicha función.
# Esto se debe a que las funciones tienen su propio entorno, pueden usar elementos del entorno general pero
# no incorporar sus propios elementos al entorno

nombre <- "Juan"
imprimir_saludo <- function(apellido){
  texto <- paste("Hola, me llamo", nombre, apellido)
  return(texto)
}

imprimir_saludo("Álvarez") # Utiliza la variable nombre del entorno global
apellido # pero si intento acceder a sus elementos, no existen fuera de la función
texto


## ¿Para qué sirve una Función? ----

# Por regla general crearemos una función cuando: queramos ejecutar un mismo proceso varias veces y no exista una función que ya lo haga
# Por ejemplo: función para calcular el área de un triángulo. Lo quiero aplicar varias veces pero no quiero mirar la fórmula cada vez

area_triangulo <- function(base, altura){
  area <- (base * altura) / 2
  return(area)
}
area_triangulo(5, 10)

# También podemos crear una función para añadir funcionalidad a una función ya existente.
# Por ejemplo, quiero crear una función que calcule la media de un vector, pero de forma que na.rm siempre sea TRUE
media <- function(x){
  resultado <- mean(x, na.rm = TRUE)
  return(resultado)
}
media(c(8, 7, 4, NA, 5, 6))

## Buenas Prácticas para crear Funciones ----
# Aunque no es necesario aplicar las siguientes prácticas para trabajar con funciones, si que son muy recomendables

# 1. Documentación. Añade comentarios y documenta tu función. Una versión mínima de una función debería ser:
# Función: calcular_imc
# Descripción: Calcula el Índice de Masa Corporal.
# Argumentos: peso (kg), altura (metros).
# Retorna: Valor numérico del IMC.
calcular_imc <- function(peso, altura) {
  return(peso / (altura^2))
}

# 2. Modularidad. Cuando tengas funciones muy extensas, es posible dividirla en varias funciones más pequeñas
# de modo que controlemos mejor como funciona el proceso  global.
# Ejemplo, queremos calcular la media y la desviación estandar de un vector usando funciones como la que hemos creado anteriormente.
# en lugar de hacer una función con todo el código "crudo" creamos varias funciones y las aplicamos en una función final
media <- function(x){
  resultado <- mean(x, na.rm = TRUE)
  return(resultado)
}

desviacion_estandar <- function(x){
  resultado <- sd(x, na.rm = TRUE)
  return(resultado)
}

obtener_estadisticas <- function(x){
  resultado <- list(media = media(x), desviacion_estandar = desviacion_estandar(x))
  return(resultado)
}
obtener_estadisticas(c(8, 7, 4, NA, 5, 6))

# 3. Checking. Usando las estructuras de control condicionales, podemos controlar que la función se ejecute de forma correcta
obtener_estadisticas <- function(x){
  if (!is.numeric(x)){
    stop("x debe ser un vector numérico") # usamos stop para parar una función y devolver un mensaje
  } 
  resultado <- list(media = media(x), desviacion_estandar = desviacion_estandar(x))
  return(resultado)
}
obtener_estadisticas(c("Hola", "Mundo"))


############################################################
# EJERCICIO 1
# Contexto: 
# Un nutricionista necesita automatizar el cálculo del IMC para varios 
# pacientes y clasificarlos.
#
# Enunciado:
# 1. Crea una función llamada 'analizar_paciente' que reciba 'peso' y 'altura'.
# 2. Dentro, calcula el imc (peso / altura^2).
# 3. Usa un ifelse() o if/else para devolver una lista con dos elementos:
#    - 'valor': El número del IMC.
#    - 'estado': "Normal" si el IMC es < 25, y "Sobrepeso" si es >= 25.
# 4. Prueba la función con un peso de 85 y altura de 1.75.
#############################################################

# El estudiante debe completar a partir de aquí




# SOLUCIÓN

analizar_paciente <- function(peso, altura) {
  # Cálculo del imc
  valor_imc <- peso / (altura^2)
  
  # Clasificación
  estado_paciente <- ifelse(valor_imc < 25, "Normal", "Sobrepeso")
  
  # Retornar lista
  return(list(valor = valor_imc, estado = estado_paciente))
}

# Prueba
analizar_paciente(peso = 85, altura = 1.75)



############################################################
# EJERCICIO 2
# Contexto: 
# En control de calidad, se analizan lotes de productos. Un lote se 
# considera "Rechazado" si la media de sus medidas se desvía demasiado 
# del estándar o si tiene demasiados valores perdidos (NA).
#
# Enunciado:
# 1. Crea la función 'control_calidad' que reciba un vector 'medidas'.
# 2. Checking: Si el vector tiene más de 2 valores NA (usa sum(is.na(x))), 
#    la función debe usar stop() con el mensaje "Lote con demasiados NA".
# 3. Si pasa el check, calcula la media (eliminando NAs).
# 4. La función debe retornar "Lote Aceptado" si la media está entre 
#    18 y 22, de lo contrario debe retornar "Lote Rechazado".
# 5. Prueba con: c(20, 19, NA, 21) y con c(20, NA, NA, NA).
#############################################################

# El estudiante debe completar a partir de aquí




# SOLUCIÓN

control_calidad <- function(medidas) {
  # Checking de NAs
  if (sum(is.na(medidas)) > 2) {
    stop("Lote con demasiados NA")
  }
  
  # Cálculo de la media
  media_lote <- mean(medidas, na.rm = TRUE)
  
  # Condicional de aceptación
  if (media_lote >= 18 & media_lote <= 22) {
    return("Lote Aceptado")
  } else {
    return("Lote Rechazado")
  }
}

# Pruebas
control_calidad(c(20, 19, NA, 21)) # Aceptado
control_calidad(c(20, NA, NA, NA)) # Esto lanzará el error de stop()



############################################################
# EJERCICIO 3
# Contexto: 
# Un centro de investigación quiere procesar un DataFrame de muestras 
# genéticas aplicando una limpieza de texto automática.
#
# Enunciado:
# 1. Crea la función 'limpiar_dataframe' que reciba un dataframe 'df'.
# 2. La función debe:
#    - Identificar la columna llamada "Codigo" y convertirla a mayúsculas.
#    - Identificar la columna "Valor" y sustituir los valores negativos por 0.
#    - Retornar el dataframe modificado.
# 3. Simula un df con: Codigo = c("a1", "b2"), Valor = c(10, -5) y pruébala.
#############################################################

# El estudiante debe completar a partir de aquí




# SOLUCIÓN

limpiar_dataframe <- function(df) {
  # Convertir columna Codigo a mayúsculas
  df$Codigo <- toupper(df$Codigo)
  
  # Sustituir negativos por 0 en Valor (vectorización)
  df$Valor <- ifelse(df$Valor < 0, 0, df$Valor)
  
  return(df)
}

# Simulación y prueba
mi_df <- data.frame(Codigo = c("a1", "b2"), Valor = c(10, -5))
limpiar_dataframe(mi_df)



############################################################
# EJERCICIO 4
# Contexto: 
# Quieres crear una función "resumen_biotec" que automatice las 
# estadísticas de una matriz de ensayos.
#
# Enunciado:
# 1. La función recibe una matriz 'm'.
# 2. Dentro de la función, usa apply() para calcular la media de 
#    cada columna y la media de cada fila.
# 3. La función debe retornar una LISTA con dos elementos: 'por_ensayo' 
#    (medias de columnas) y 'por_paciente' (medias de filas).
# 4. Prueba la función con una matriz de 3x3 de números aleatorios.
#############################################################

# El estudiante debe completar a partir de aquí




# SOLUCIÓN

resumen_biotec <- function(m) {
  # Medias de columnas (ensayos)
  ensayos <- apply(m, 2, mean)
  
  # Medias de filas (pacientes)
  pacientes <- apply(m, 1, mean)
  
  # Retorno de lista estructurada
  return(list(por_ensayo = ensayos, por_paciente = pacientes))
}

# Prueba con matriz aleatoria 3x3
matriz_test <- matrix(runif(9, 1, 10), nrow = 3)
resumen_biotec(matriz_test)



############################################################
# EJERCICIO 5
# Contexto: 
# Un laboratorio recibe datos de ensayos en una lista de listas. 
# Cada lote contiene: nombre, matriz de resultados y un umbral.

# DATOS DE ENTRADA
set.seed(123)
datos_ensayo <- list(
  lote1 = list(nombre = "Alfa",  matriz = matrix(runif(9, 5, 10), nrow=3), umbral = 7),
  lote2 = list(nombre = "Beta",  matriz = matrix(runif(9, 2, 5),  nrow=3), umbral = 4),
  lote3 = list(nombre = "Gamma", matriz = matrix(runif(9, 0, 10), nrow=3), umbral = 8)
)

# ENUNCIADO:
# 1. Crea una función llamada 'procesar_laboratorio' que reciba 
#    la lista 'datos_ensayo'.
# 2. La función debe recorrer cada lote (usa un bucle for o lapply).
# 3. Para cada lote, debe calcular la media de su 'matriz'.
# 4. Usando un condicional (if o ifelse), determinar el veredicto:
#    - Si media >= umbral: "APROBADO"
#    - Si media < umbral: "RECHAZADO"
# 5. La función debe retornar un DataFrame con 3 columnas: 
#    'Lote_Nombre', 'Media_Obtenida' y 'Veredicto'.

# PISTA: Puedes crear vectores vacíos antes del bucle para ir 
# guardando los datos de cada lote y luego unirlos en el dataframe.
#############################################################

# El estudiante debe completar a partir de aquí




# SOLUCIÓN

procesar_laboratorio <- function(lista_lotes) {
  
  # Creamos vectores vacíos para ir almacenando los resultados de cada iteración
  nombres <- c()
  medias  <- c()
  verdictos <- c()
  
  # Usamos un bucle para recorrer la lista de lotes
  for (i in 1:length(lista_lotes)) {
    
    # Extraemos el lote actual
    lote_actual <- lista_lotes[[i]]
    
    # Calculamos la media global de la matriz de ese lote
    media_global <- mean(lote_actual$matriz)
    
    # Lógica condicional para el veredicto
    veredicto_final <- ifelse(media_global >= lote_actual$umbral, "APROBADO", "RECHAZADO")
    
    # Guardamos los resultados en nuestros vectores
    nombres <- c(nombres, lote_actual$nombre)
    medias  <- c(medias, round(media_global, 2))
    verdictos <- c(verdictos, veredicto_final)
  }
  
  # Construimos el DataFrame final con los vectores recolectados
  df_resumen <- data.frame(
    Lote_Nombre = nombres,
    Media_Obtenida = medias,
    Veredicto = verdictos
  )
  
  return(df_resumen)
}

procesar_laboratorio(datos_ensayo)


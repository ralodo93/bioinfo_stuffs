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

# EJERCICIO 1. Función de Crecimiento Logístico de Poblaciones
# En ecología, el crecimiento de una población suele seguir un modelo logístico. 
# Crea una función llamada 'crecimiento_logistico' que calcule el tamaño poblacional (Nt).
# La fórmula es: Nt = K / (1 + ((K - N0) / N0) * exp(-r * t))
# Argumentos:
#   - N0: Tamaño poblacional inicial.
#   - K: Capacidad de carga del entorno.
#   - r: Tasa intrínseca de crecimiento.
#   - t: Tiempo transcurrido.
# La función debe comprobar si alguno de los parámetros es negativo y, de ser así, 
# detener la ejecución con un mensaje de error apropiado.


# SOLUCIÓN:
crecimiento_logistico <- function(N0, K, r, t) {
  if (any(c(N0, K, r, t) < 0)) {
    stop("Todos los parámetros biológicos deben ser valores no negativos.")
  }
  Nt <- K / (1 + ((K - N0) / N0) * exp(-r * t))
  return(Nt)
}
crecimiento_logistico(N0 = 10, K = 100, r = 0.5, t = 10)


# EJERCICIO  2. Índice de Diversidad de Simpson
# El índice de Simpson (D) mide la probabilidad de que dos individuos seleccionados 
# al azar de una muestra pertenezcan a la misma especie: D = sum(pi^2), donde pi 
# es la proporción de individuos de la especie i.
# Crea una función 'indice_simpson' que reciba un vector numérico con las 
# abundancias de cada especie.
# Requisitos:
#   - Debe calcular internamente las proporciones (pi).
#   - Debe manejar valores NA eliminándolos antes del cálculo.
#   - Debe retornar el valor de la diversidad (1 - D), conocido como Índice de 
#     Diversidad de Simpson.


# SOLUCIÓN
indice_simpson <- function(abundancias) {
  abundancias <- abundancias[!is.na(abundancias)]
  proporciones <- abundancias / sum(abundancias)
  D <- sum(proporciones^2)
  return(1 - D)
}

# Solución ejemplo:
indice_simpson(c(10, 20, 70, NA))


# EJERCICIO 3. Conversión de Unidades y Modularidad
# Es común en botánica medir la tasa de transpiración en diferentes unidades.
# Crea dos funciones modulares:
#   a) 'celsius_a_kelvin': convierte grados Celsius a Kelvin (K = C + 273.15).
#   b) 'presion_vapor': calcula la presión de vapor de saturación (es) usando la 
#      fórmula simplificada: es = 0.611 * exp((17.27 * Temp) / (Temp + 237.3)).
# Crea una tercera función 'analisis_climatico' que reciba una temperatura en Celsius, 
# use la primera función para obtener Kelvin y la segunda para obtener la presión, 
# devolviendo ambos resultados en una lista etiquetada.


# SOLUCIÓN:
celsius_a_kelvin <- function(celsius) {
  return(celsius + 273.15)
}

presion_vapor <- function(temp_c) {
  es <- 0.611 * exp((17.27 * temp_c) / (temp_c + 237.3))
  return(es)
}

analisis_climatico <- function(temp_c) {
  res <- list(
    temp_k = celsius_a_kelvin(temp_c),
    presion_sat = presion_vapor(temp_c)
  )
  return(res)
}

analisis_climatico(25)


# EJERCICIO 4. Función con Argumentos por Defecto: Estandarización de Biomasa
# Imagina que estás analizando muestras de biomasa forestal. Crea una función 
# llamada 'estandarizar_biomasa' que reciba un vector de pesos.
# Argumentos:
#   - x: Vector numérico de pesos.
#   - metodo: Un texto que por defecto sea "centrado". 
# Si metodo == "centrado", resta la media al vector.
# Si metodo == "zscore", resta la media y divide por la desviación estándar.
# Usa las funciones de ayuda 'mean' y 'sd' asegurándote de que siempre se 
# eliminen los NA por defecto dentro de tu función.


# SOLUCIÓN
estandarizar_biomasa <- function(x, metodo = "centrado") {
  mu <- mean(x, na.rm = TRUE)
  sigma <- sd(x, na.rm = TRUE)
  
  if (metodo == "centrado") {
    return(x - mu)
  } else if (metodo == "zscore") {
    return((x - mu) / sigma)
  } else {
    stop("Método no reconocido. Usa 'centrado' o 'zscore'.")
  }
}

# Solución ejemplo:
estandarizar_biomasa(c(1.2, 2.5, 0.8, 4.1), metodo = "zscore")


# EJERCICIO 5. Scope y Reutilización: Filtro de Calidad de Datos Genómicos
# Define una variable global 'UMBRAL_CALIDAD' con valor 20.
# Crea una función 'filtrar_lecturas' que reciba un vector de puntuaciones de 
# calidad de secuenciación.
# La función debe:
#   1. Identificar qué lecturas están por debajo del 'UMBRAL_CALIDAD'.
#   2. Devolver una lista con: el vector filtrado (solo valores >= umbral) y el 
#      porcentaje de lecturas eliminadas.
# Demuestra qué ocurre si intentas acceder a una variable creada dentro de la 
# función desde el entorno global.



# SOLUCIÓN
UMBRAL_CALIDAD <- 20

filtrar_lecturas <- function(puntuaciones) {
  eliminadas <- sum(puntuaciones < UMBRAL_CALIDAD, na.rm = TRUE)
  porcentaje_perdida <- (eliminadas / length(puntuaciones)) * 100
  filtradas <- puntuaciones[puntuaciones >= UMBRAL_CALIDAD]
  
  return(list(datos_limpios = filtradas, perdida = porcentaje_perdida))
}

# Solución ejemplo y verificación de scope:
resultado <- filtrar_lecturas(c(15, 22, 30, 18, 25))
print(resultado)

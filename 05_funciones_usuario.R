#### Funciones de Usuario ####

### Anatomía ###
# Crear una función es como definir una "receta": le das unos ingredientes (argumentos), 
# ejecutas unos pasos (cuerpo) y entregas un plato final (return).

## Componentes ##

# 1. Nombre de Función: Debe ser descriptivo (preferiblemente verbos).
# 2. Definir la función usando function()
# 3. Argumentos: Los datos que la función necesita. Pueden ser requeridos o por defecto
# 4. Cuerpo: El código encerrado entre llaves {}.
# 5. Return: La última línea o el valor dentro de return() que se devuelve al usuario.

nombre_funcion <- function(arg1, arg2 = "valor_por_defecto") {
  # Cuerpo de la función
  resultado <- paste(arg1, arg2)
  return(resultado) # O simplemente 'resultado'
}

# Ejemplo simple:
saludar <- function(nombre) {
  mensaje <- paste("Hola", nombre, "¿cómo estás?")
  return(mensaje)
}
saludar("R-User")

# MINIRETO: Crea una función llamada 'calcular_iva' que reciba un precio
# y devuelva el precio final con un IVA del 21%.
calcular_iva(100)

# SOLUCIÓN:
calcular_iva <- function(precio) {
  precio_final <- precio * 1.21
  return(precio_final)
}
calcular_iva(100)


# MINIRETO: Modifica la función anterior para que el valor del IVA sea un argumento, que por defecto sea 1.21 pero pueda modificarse
calcular_iva(100, 1.04)


# SOLUCIÓN:
calcular_iva <- function(precio, iva = 1.21) {
  precio_final <- precio * iva
  return(precio_final)
}
calcular_iva(100, 1.04)

## Ámbito de las funciones (Scope) ##
# Cuando creamos parámetros dentro de una función no se almacenan en el entorno, sino que se almacenan en la memoria de dicha función

mi_funcion <- function(x) {
  variable_interna <- 10  # Solo existe aquí dentro
  return(x + variable_interna)
}

mi_funcion(5)
# si intento mostrar la variable interna me dirá que esa variable no existe


# En la inmensa mayoría de los casos los argumentos son datos (independientemente del tipo de datos), pero en ocasiones concretas
# podemos usar un argumento que haga referencia a otra función (sea nuestra o de R base). Por ejemplo, podemos unificar todas las funciones que vimos
# de agregación de números en una sola

agregar_numeros <- function(x, func){ # el argumento func va a actuar como una función
  return(func(x, na.rm = TRUE)) # devolvemos el resultado de esa función, podemos usar los propios argumentos de la misma ya que func puede ser mean, median etc
}

vector_numeros <- c(10, 20, NA, 40, 50, 60)
agregar_numeros(vector_numeros, func = mean) # aplicamos la función mean
agregar_numeros(vector_numeros, func = quantile) # aplicamos la función quantile

## Objetivo ##

# ¿Para qué queremos crear una función?
# 1. Evitar repetir código (DRY: Don't Repeat Yourself).
# 2. Automatizar tareas complejas.
# 3. Hacer que el código sea más legible y fácil de mantener.

# Tenemos una serie de etiquetas que queremos estandarizar. Podemos hacer con código normal de R sin hacer funciones
categorias <- c("norte", "sur")
codigos <- c(1, 2)
paste0("[", toupper(categorias), "] - ID: ", codigos)

# sin embargo paste0("[", toupper(categoria), "] - ID: ", codigo) puede resultar algo confuso... sobretodo si es algo
# que vamos a hacer a menudo. Podemos crear una función:
formatear_etiqueta <- function(categoria, codigo) {
  etiqueta <- paste0("[", toupper(categoria), "] - ID: ", codigo)
  return(etiqueta)
}

# Usarla las veces que queramos, de forma mucho más explícita
formatear_etiqueta("ventas", 1024)
formatear_etiqueta(c("norte", "sur"), c(1, 2))


### Buenas Prácticas ###

## Documentar ##
# Es vital explicar qué hace la función, qué espera y qué devuelve.
# En R, se suele usar el formato de comentarios antes de la función.

# Función: calcular_imc
# Descripción: Calcula el Índice de Masa Corporal.
# Argumentos: peso (kg), altura (metros).
# Retorna: Valor numérico del IMC.
calcular_imc <- function(peso, altura) {
  return(peso / (altura^2))
}

# MINIRETO: Documenta y crea una función que convierta grados Celsius a Fahrenheit.
# Fórmula: (C * 9/5) + 32

# SOLUCIÓN:
# Función: c_a_f
# Descripción: Convierte temperatura de Celsius a Fahrenheit.
# Argumentos: celsius (numérico).
# Retorna: numérico en Fahrenheit.
c_a_f <- function(celsius) {
  f <- (celsius * 9 / 5) + 32
  return(f)
}
c_a_f(30)

## Modularidad ##
# Es mejor tener 3 funciones pequeñas que una gigante. Cada función debe hacer UNA sola cosa.

# Ejemplo modular:
# 1. Función de Extracción: Simula obtener ingresos brutos
# (Podría venir de una base de datos o un CSV)
obtener_ingresos <- function() {
  ingresos <- c(1200, 1500, 800, 2100, 1750)
  return(ingresos)
}

# 2. Función de Transformación: Aplica impuestos
# Es independiente de dónde vienen los datos
aplicar_impuestos <- function(cantidades, tasa = 0.15) {
  neto <- cantidades * (1 - tasa)
  return(neto)
}

# 3. Función de Resumen: Genera el resultado final
generar_informe <- function(datos_limpios) {
  total <- sum(datos_limpios)
  media <- mean(datos_limpios)
  return(paste("Total Neto:", total, "| Promedio por venta:", media))
}

# --- EJECUCIÓN DEL FLUJO MODULAR ---
# Conectamos las piezas como una cadena de montaje
bruto   <- obtener_ingresos()
neto    <- aplicar_impuestos(bruto)
informe <- generar_informe(neto)
informe


# MINIRETO: Crea una función que limpie un texto (trimws y tolower) 
# y otra que use la anterior para limpiar un vector y luego cuente caracteres (nchar).
analizar_texto("  HOLA Mundo   ")

# SOLUCIÓN:
limpiar_texto <- function(txt) {
  return(tolower(trimws(txt)))
}

analizar_texto <- function(vector_txt) {
  limpios <- limpiar_texto(vector_txt)
  return(nchar(limpios))
}
analizar_texto("  HOLA Mundo   ")

## Testing ##
# Siempre prueba tu función con casos extremos (valores vacíos, NA, tipos de datos incorrectos).

# MINIRETO: Prueba la función 'calcular_iva' con un vector de precios y con un NA.
# ¿Qué pasa? ¿Cómo podrías mejorarla usando na.rm?

# SOLUCIÓN:
precios_test <- c(10, 20, NA, 40)
calcular_iva(precios_test) # Devuelve NA donde había NA.

# Mejora para ignorar NA
calcular_iva_seguro <- function(precio) {
  return(precio * 1.21) # En este caso simple, R ya lo gestiona vectorialmente.
}


### Usos (Ejemplos Graduales) ###
# A continuación, ejemplos de cómo diseñar funciones que "piensan" por nosotros procesando datos de forma masiva.

## Ejemplo 1 ##
 
# Calcular un Z-score: Número de veces que la desviación estándar se aleja de la media, para hacer esto requerimos de:
salarios <- c(1200, 1300, 1250, 1400, 5000, 1100) # datos entrada
media  <- mean(salarios, na.rm = TRUE)
desv   <- sd(salarios, na.rm = TRUE)
z      <- (salarios - media) / desv

# Si ahora quisiera calcularlo para otro vector, debemos reescribir la estructura y modificar las variables 
precios <- c(8, 10, 12, 15)
media  <- mean(precios, na.rm = TRUE)
desv   <- sd(precios, na.rm = TRUE)
z      <- (precios - media) / desv

# Este tipo de casos son el ejemplo perfecto de la potencia de usar funciones, creamos la función simplemente introduciendo la estructura en el cuerpo
calcular_z_score <- function(x){
  media  <- mean(x, na.rm = TRUE)
  desv   <- sd(x, na.rm = TRUE)
  z      <- (x - media) / desv
  return(z)
}

# lo que antes eran 3 líneas de código repetido, ahora son solo una
calcular_z_score(salarios)
calcular_z_score(precios)

## Ejemplo 2 ##
# Ahora queremos usar un vector numérico de entrada, calcularemos el valor mínimo y el máximo y estableceremos un punto medio entre ambos
# La función devolverá TRUE o FALSE dependiende de si cada elemento del vector está por encima de ese punto medio, generando previamente un
# mensaje informativo

# paso a paso
vector_numerico <- -10:50
maximo <- max(vector_numerico)
minimo <- min(vector_numerico)
punto_medio <- mean(c(maximo, minimo))
paste("El punto medio de tu vector es", punto_medio)
vector_numerico[vector_numerico > punto_medio]

categorizar_intervalos <- function(x){
  maximo <- max(x, na.rm = TRUE)
  minimo <- min(x, na.rm = TRUE)
  punto_medio <- mean(c(maximo, minimo))
  print(paste("El punto medio de tu vector es", punto_medio))
  resultado <- x[x > punto_medio]
  return(resultado)
}

categorizar_intervalos(vector_numerico)


#### Ejercicios Prácticos: Funciones de Usuario ####

# Ejercicio 1: Conversión de divisas
# Crea una función llamada 'convertir_usd_a_eur' que reciba una cantidad en dólares
# y la devuelva convertida a euros (utiliza una tasa de cambio fija de 0.92).
# Prueba la función con el valor 100.

# Ejercicio 2: Personalización del tipo de cambio
# Modifica la función anterior para que acepte un segundo argumento llamado 'tasa'.
# Define por defecto que la tasa sea 0.92, pero permite que la persona usuaria 
# pueda cambiarla si lo desea. Prueba a convertir 100 dólares con una tasa de 0.85.

# Ejercicio 3: Cálculo de áreas
# Documenta y crea una función llamada 'calcular_area_rectangulo' que reciba 
# la base y la altura. La función debe devolver el área (base * altura). 
# Recuerda seguir las buenas prácticas de documentación (Descripción, Argumentos, Retorna).

# Ejercicio 4: Estandarización de nombres de usuario
# Crea una función llamada 'generar_usuario' que reciba un nombre y un apellido.
# La función debe:
# 1. Unir el nombre y el apellido con un punto en medio (ej: "nombre.apellido").
# 2. Convertir todo el resultado a minúsculas.
# 3. Eliminar espacios en blanco sobrantes a los lados.
# Pista: Puedes usar funciones como paste0(), tolower() y trimws().

# Ejercicio 5: Modularidad y análisis de inventario
# Vamos a trabajar de forma modular con dos funciones:
# 1. Crea una función 'calcular_stock_total' que reciba un vector numérico y devuelva su suma.
# 2. Crea una función 'resumen_inventario' que reciba un vector de stock y un nombre de producto.
# Esta segunda función debe usar internamente 'calcular_stock_total' y devolver un mensaje
# del tipo: "El stock total de [producto] es de [cantidad] unidades".
# Prueba el flujo con el producto "Sillas" y el vector c(10, 5, 20).

# Ejercicio 6: Funciones como argumentos
# Crea una función llamada 'operar_vector' que reciba un vector numérico (x) 
# y una función de agregación (func). La función debe devolver el resultado 
# de aplicar 'func' al vector x, asegurándote de que se gestionen los valores NA 
# (usando el argumento na.rm = TRUE) dentro de la ejecución de func. 
# Prueba la función pasando un vector con NAs y la función 'sd' (desviación típica).

# Ejercicio 7: Procesamiento de métricas de calidad
# Crea una función llamada 'detectar_anomalias' que reciba un vector de medidas.
# La función debe:
# 1. Calcular la media del vector.
# 2. Calcular la desviación estándar (sd).
# 3. Devolver exclusivamente los valores del vector que sean mayores que (media + sd).
# Prueba la función con el vector: c(10, 12, 11, 15, 30, 11, 10).

# Ejercicio 8: Formateo avanzado de etiquetas de envío
# Crea una función llamada 'etiquetar_envio' que reciba tres argumentos: 
# 'ciudad' (texto), 'codigo_postal' (numérico) y 'urgente' (lógico: TRUE o FALSE).
# La función debe devolver una cadena de texto que combine los tres datos:
# Ejemplo de salida esperada: "[MADRID] - CP: 28001 - Urgente: TRUE"
# Asegúrate de que la ciudad siempre se procese en mayúsculas.



#### Soluciones: Funciones de Usuario ####

# Solución 1:
convertir_usd_a_eur <- function(dolares) {
  resultado <- dolares * 0.92
  return(resultado)
}
convertir_usd_a_eur(100)

# Solución 2:
convertir_usd_a_eur <- function(dolares, tasa = 0.92) {
  resultado <- dolares * tasa
  return(resultado)
}
convertir_usd_a_eur(100, 0.85)

# Solución 3:
# Función: calcular_area_rectangulo
# Descripción: Calcula el área de un rectángulo a partir de su base y altura.
# Argumentos: base (numérico), altura (numérico).
# Retorna: Valor numérico del área.
calcular_area_rectangulo <- function(base, altura) {
  area <- base * altura
  return(area)
}
calcular_area_rectangulo(5, 10)

# Solución 4:
generar_usuario <- function(nombre, apellido) {
  unido <- paste0(nombre, ".", apellido)
  limpio <- trimws(unido)
  usuario <- tolower(limpio)
  return(usuario)
}
generar_usuario(" Juan ", "Perez ")

# Solución 5:
calcular_stock_total <- function(vector_stock) {
  return(sum(vector_stock))
}

resumen_inventario <- function(vector_stock, producto) {
  cantidad <- calcular_stock_total(vector_stock)
  mensaje <- paste("El stock total de", producto, "es de", cantidad, "unidades")
  return(mensaje)
}
resumen_inventario(c(10, 5, 20), "Sillas")

# Solución 6:
operar_vector <- function(x, func) {
  resultado <- func(x, na.rm = TRUE)
  return(resultado)
}
vector_test <- c(10, 20, NA, 40)
operar_vector(vector_test, sd)

# Solución 7:
detectar_anomalias <- function(medidas) {
  media <- mean(medidas, na.rm = TRUE)
  desv  <- sd(medidas, na.rm = TRUE)
  umbral <- media + desv
  anomalias <- medidas[medidas > umbral]
  return(anomalias)
}
detectar_anomalias(c(10, 12, 11, 15, 30, 11, 10))

# Solución 8:
etiquetar_envio <- function(ciudad, codigo_postal, urgente) {
  etiqueta <- paste0("[", toupper(ciudad), "] - CP: ", codigo_postal, " - Urgente: ", urgente)
  return(etiqueta)
}
etiquetar_envio("Madrid", 28001, TRUE)
#### Funciones ####

### Estructura de una Función ###
sqrt(5) # el nombre de la función es sqrt, el argumento de la función es 5, el return es el resultado de aplicar la función a ese argumento
round(10.85) # el nombre de la función es round, el argumento es 10.85, el return es el resultado de aplicar la función a esos argumentos
round(10.85, digits = 1) # el nombre de la función es round, los argumentos son 10.85 y digits = 1, el return es el resultado de aplicar la función a esos argumentos

## Ayuda de una función ##
?sqrt # abre una ventana en Ayuda (o Help). Nos indica que hace la función, cuales son sus argumentos y algunos ejemplos
?round # aquí vemos que round tiene dos arguementos, un vector numérico (x) y un valor numérico (digits) que por defecto es 0


# MINIRETO: Busca la ayuda de la función mean, ¿que pasa cuando se aplica a cada uno de estos vectores? ¿Cómo lo solucionarías?
set.seed(123)
vector1 <- rnorm(12)
vector2 <- c(12, 8, 7, NA, 5, 4, 9, 10, 8)


# SOLUCIÓN:
?mean
mean(vector1) # no hay problema
mean(vector2) # devuelve NA porque hay un NA y por defecto na.rm es FALSE
mean(vector2, na.rm = TRUE) # modificamos el argumento na.rm y ya funciona

# Esto mismo ocurre con muchas de las funciones que aplican cálculos estadísticos, por lo que ten cuidado: 
# 1) elimina siempre NA antes de aplicar la función ó 2) usa siempre el argumento na.rm = TRUE


## Argumentos ##
# Aunque ya hemos visto algo sobre los argumentos, vamos a aprender a usarlos de forma correcta. Para ello usaremos como ejemplo la función log
?log # la ayuda nos dice que hay dos argumentos: x es un vector numérico y base es un valor que indica la base sobre la que se calcula el logaritmo de x

# el uso correcto de esta función sería
log(x = 10) # si queremos el logarimto natural (base = exp(1))
log(x = 10, base = 2) # si queremos usar una base distinta a exp(1)

# sin embargo, las funciones en R leen los argumentos por orden, ya que los argumentos son x y base, podemos usar simplemente el orden
# CUIDADO: usar esto siempre que: 1) conozcamos la función y 2) la función no tenga demasiado argumentos
log(10, 2) # logaritmo en base 2 de 10
round(12.6487, 2)

# podemos mezclar entre argumentos por orden y argumentos por nombre
round(12.6546, digits = 2) # seguramente esta sea la forma más elegante de usar la función, es la más clara

# ejemplo de función que no podremos usar tan solo por orden, tiene demasiados argumentos
install.packages("pheatmap")
library(pheatmap)
?pheatmap

test = matrix(rnorm(200), 20, 10)
pheatmap(test) # genera un gráfico de un heatmap
pheatmap(test, cluster_row = FALSE) # sin clusterizar filas


### Crear Funciones ###

## Estructura ##
# nombre_funcion <- function(arg1, arg2, ...){bloque de código que indique que hace la función}

imprimir_nombre <- function(nombre, apellido){ # entre las llaves va el código
  texto <- paste("Me llamo",nombre, apellido)
  return(texto) # return se usa para devolver un resultado
}

# Lo puedo reutilizar las veces que quiera
imprimir_nombre("Juan","Arenas")
imprimir_nombre("Marta","López")
imprimir_nombre("Ana","Martínez")

# Ya que la función usa paste, que es un función vectorizada, podríamos utilizar vectores para obtener un resultado en un solo comando
imprimir_nombre(nombre = c("Juan", "Ana", "Marta"), apellido = c("Arenas", "López", "Martínez"))


# MINIRETO: Crea una función que calcule la media de un vector de números (no uses mean, usa la fórmula de la media). Llama a la función calcular_media
set.seed(123)
vector_numeros <- rnorm(12)


# SOLUCIÓN:
calcular_media <- function(x){
  suma <- sum(x, na.rm = TRUE)
  n <- length(x)
  return(suma / n)
}
calcular_media(vector_numeros)

## Buenas Prácticas ##
# Podemos diseñar las funciones como queramos pero hay una serie de buenas prácticas que deberíamos tener en cuenta

# --- Documentar la función ---
# Añadir comentarios previos a la función (o dentro de la misma), detallando datos de entrada, de salida y lo que hace

# Función: calcular_imc
# Descripción: Calcula el Índice de Masa Corporal.
# Argumentos: peso (kg), altura (metros).
# Retorna: Valor numérico del IMC.
calcular_imc <- function(peso, altura) {
  return(peso / (altura^2))
}

# --- Modularidad ---
# En ocasiones es probable que la función que estés creando sea muy grande o haga varias cosas diferentes
# En estas situaciones se recomienda modularizar la función, es decir, crear pequeñas funciones que hagan
# cosas muy concretas y sean fáciles de controlar y añadirlas todas a una o varias funciones más generales

# 1. Función para calcular el descuento
restar_descuento <- function(precio, porcentaje) {
  descuento <- precio * (porcentaje / 100)
  return(precio - descuento)
}

# 2. Función para calcular el IVA (16% en este ejemplo)
sumar_iva <- function(precio) {
  return(precio * 1.16)
}

# 3. Función Modular (utiliza las dos anteriores)
calcular_precio_final <- function(precio_base, tasa_descuento) {
  # Primero llamamos a la función de descuento
  precio_con_descuento <- restar_descuento(precio_base, tasa_descuento)
  
  # Luego, sobre ese resultado, aplicamos el IVA
  precio_final <- sumar_iva(precio_con_descuento)
  
  return(precio_final)
}

# --- Probando el sistema ---
resultado <- calcular_precio_final(precio_base = 100, tasa_descuento = 10)
print(paste("El precio final es:", resultado))


# --- Testing ---
# Siempre prueba tu función con valores extremos (NA, NULL etc)

# --- Estructuras de Control ---
# Dentro de las funciones debemos incluir estructuras de control que nos aseguren que la función se ejecuta correctamente
calcular_precio_final <- function(precio_base, tasa_descuento){
  if (!is.numeric(precio_base)){ # si precio_base NO es numérico
    message("'precio_base' debe ser una variable numérica, prueba de nuevo") # también puede ser un print
    return() # devuelve un NULL
  }
  
  if (!is.numeric(tasa_descuento)){ # si precio_base NO es numérico
    stop("'tasa_descuento' debe ser una variable numérica, prueba de nuevo") # esto devuelve un mensaje similar pero con la palabra error
    # En este caso no se devuelve nada, stop para la ejecución
    # También se puede usar warning, pero esto no para la ejecución
  }
  
  # Primero llamamos a la función de descuento
  precio_con_descuento <- restar_descuento(precio_base, tasa_descuento)
  
  # Luego, sobre ese resultado, aplicamos el IVA
  precio_final <- sumar_iva(precio_con_descuento)
  
  return(precio_final)
}

calcular_precio_final(precio_base = "100", tasa_descuento = "10")
calcular_precio_final(precio_base = 100, tasa_descuento = "10")
calcular_precio_final(precio_base = 100, tasa_descuento = 10)

# MINIRETO:
# Situación: Una pequeña librería necesita automatizar el cálculo del valor de su stock.
# Para ello, debes crear un sistema modular siguiendo las buenas prácticas aprendidas.

# 1. Crea una función llamada 'calcular_valor_producto'. 
#    - Debe recibir dos argumentos: 'cantidad' y 'precio_unitario'.
#    - Debe retornar el producto de ambos.
#    - No olvides documentarla (descripción, argumentos y retorno).

# 2. Crea una función llamada 'aplicar_merma'.
#    - Debe recibir el 'valor_total' y un 'porcentaje_merma' (pérdidas por deterioro).
#    - Debe restar dicho porcentaje al valor total y retornar el resultado.

# 3. Crea una función principal llamada 'gestion_stock'.
#    - Debe recibir: 'unidades', 'precio' y 'porcentaje'.
#    - Dentro de la función, utiliza estructuras de control (if) para validar:
#      a) Que 'unidades' sea un valor numérico
#      b) Que 'precio' sea un valor numérico 
#    - La función debe llamar internamente a las dos funciones anteriores para 
#      obtener el valor neto final tras aplicar la merma.

# 4. Prueba la función principal con un caso de éxito (p.ej. 10 unidades a 20€ con 5% de merma) 
#    y con un caso de error (introduciendo un texto en lugar de un número).



# SOLUCIÓN:
# 1. Función: calcular_valor_producto
# Descripción: Calcula el valor total de un producto según existencias.
# Argumentos: cantidad (unidades), precio_unitario (moneda).
# Retorna: Valor total numérico.
calcular_valor_producto <- function(cantidad, precio_unitario) {
  return(cantidad * precio_unitario)
}

# 2. Función: aplicar_merma
# Descripción: Resta un porcentaje de pérdida al valor total.
# Argumentos: valor_total, porcentaje_merma.
# Retorna: Valor neto tras la reducción.
aplicar_merma <- function(valor_total, porcentaje_merma) {
  descuento <- valor_total * (porcentaje_merma / 100)
  return(valor_total - descuento)
}

# 3. Función Modular: gestion_stock
# Descripción: Integra el cálculo de valor y merma con validación de datos.
# Argumentos: unidades, precio, porcentaje.
# Retorna: Valor final del stock.
gestion_stock <- function(unidades, precio, porcentaje) {
  
  # Validación de 'unidades'
  if (!is.numeric(unidades)) {
    stop("'unidades' debe ser una variable numérica, prueba de nuevo")
  }
  
  # Validación de 'precio'
  if (!is.numeric(precio)) {
    stop("'precio' debe ser una variable numérica, prueba de nuevo")
  }
  
  # Proceso modular
  valor_bruto <- calcular_valor_producto(unidades, precio)
  valor_neto <- aplicar_merma(valor_bruto, porcentaje)
  
  return(valor_neto)
}

# 4. --- Testing del sistema ---

# Caso de éxito
resultado_exito <- gestion_stock(unidades = 10, precio = 20, porcentaje = 5)
print(paste("El valor neto del stock es:", resultado_exito))

# Caso de error con stop (unidades como texto)
gestion_stock(unidades = "10", precio = 20, porcentaje = 5)


## Lógica de las Funciones ##
# Sabemos como crear una función, pero... ¿que lógica debemos seguir para crear una función?
# ADVERTENCIA: Es un consejo personal de como suelo hacerlo yo, seguro hay maneras diferentes y mejores

# Ejemplo 1: Estandarización de nombres de usuario
# En una base de datos de recursos humanos, los nombres han llegado con espacios
# extra y mezclas de mayúsculas y minúsculas. 
# Crea una función llamada 'normalizar_usuario' que reciba una cadena de texto, 
# elimine los espacios en blanco a los extremos (usando trimws) y convierta 
# todo el texto a minúsculas (usando tolower).

# Paso 1: Crear un ejemplo de testing
nombre = "    JuAn     " # creamos un ejemplo que contenga todas las particularidades, es como ponernos en el peor escenario
# Paso 2: que pasos debo hacer?
# como elimino espacios?
nombre_trim <- trimws(nombre)
# como transforme a minusculas?
nombre_minus <- tolower(nombre_trim)
# Paso 3: colapsar código
# es posible colapsar algo de código sin generar líneas muy extensas
nombre_minus <- tolower(trimws(nombre)) # esto sería el bloque de la función

# Los pasos 1, 2 y 3 se deberían repetir siempre y cuando haya variantes en el código. 
# Como en este caso es algo simple, solo necesitaremos comprobarlos una vez.

# Paso 4: crear la función
normalizar_usuario <- function(nombre){
  nombre_minus <- tolower(trimws(nombre))
  return(nombre_minus)
}

# Paso 5: Testing. probar varias variantes
normalizar_usuario("juan")
normalizar_usuario("Juan")
normalizar_usuario("   juan")


# Ejemplo 2: Conversor de divisas con valor por defecto
# Imagina que trabajas en un departamento financiero y necesitas convertir 
# presupuestos de dólares a euros.
# Crea una función llamada 'convertir_a_euros' que reciba una cantidad en dólares
# y un tipo de cambio. El tipo de cambio debe tener un valor por defecto de 0.92.
# La función debe devolver la cantidad resultante.

# Paso 1: Crear un ejemplo de testing
dolares <- 10
cambio <- 0.92
# Paso 2: que pasos debo hacer?
# pasar de dólares a euros
euros <- dolares * cambio
# Paso 3: colapsar código
# ya de por si el código es muy simple

# Los pasos 1, 2 y 3 se deberían repetir siempre y cuando haya variantes en el código. 
# Como en este caso es algo simple, solo necesitaremos comprobarlos una vez.

# Paso 4: crear la función
convertir_a_euros <- function(dolares, cambio = 0.92){
  euros <- dolares * cambio
  return(euros)
}

# Paso 5: Testing. probar varias variantes
convertir_a_euros(100)
convertir_a_euros(100, cambio = 0.9)
convertir_a_euros(10.85, cambio = 0.85)


# Ejemplo 3: Cálculo de margen de beneficio (Vectorización)
# Una empresa de retail necesita calcular rápidamente el beneficio neto de 
# varios productos.
# Crea una función llamada 'calcular_beneficio' que reciba dos argumentos: 
# un vector de precios de venta y un vector de costes de adquisición. 
# La función debe restar el coste al precio de venta para obtener el beneficio.
# Prueba la función pasando dos vectores de la misma longitud: 
# precios <- c(100, 250, 500) y costes <- c(60, 150, 420).

# Paso 1: Crear un ejemplo de testing
precios <- c(100, 250, 500)
costes <- c(60, 150, 420)
# Paso 2: que pasos debo hacer?
# calcular beneficios
beneficios <- precios - costes
# calcular beneficio total
total <- sum(beneficios)
# Paso 3: colapsar código
# ya de por si el código es muy simple

# Los pasos 1, 2 y 3 se deberían repetir siempre y cuando haya variantes en el código. 
# Como en este caso es algo simple, solo necesitaremos comprobarlos una vez.

# Paso 4: crear la función
calcular_beneficio <- function(precios, costes){
  beneficios <- precios - costes
  total <- sum(beneficios)
  return(total)
}

# Paso 5: Testing. probar varias variantes
calcular_beneficio(precios, costes)
calcular_beneficio(c(10, 20), c(5, 2, 1)) # WARNING: vectores de longitud distinta


# Ejercicio 4: Flujo modular de gestión de inventario
# Vamos a crear un sistema modular para gestionar el stock de un almacén.
# Para ello, sigue estos tres pasos creando funciones independientes:
#
# A. Crea una función 'ajustar_stock' que reciba un vector de stock actual 
#    y le reste una cantidad fija de unidades vendidas.
#
# B. Crea una función 'formatear_referencia' que reciba un código numérico 
#    y una categoría, y devuelva una etiqueta usando paste0 de este tipo: 
#    "REF-CATEGORIA-CODIGO" (la categoría debe aparecer en mayúsculas).
#
# C. Crea una función 'generar_alerta' que reciba el stock final y el nombre 
#    de la referencia formateada, y devuelva un mensaje de texto que diga: 
#    "Producto [NOMBRE_REF] actualizado. Stock restante: [VALOR]". Por defecto 
#    la venta será de 1 unidad.
#
# Al finalizar, ejecuta el flujo completo usando un stock inicial de 50, 
# para la categoría "muebles" y el código 105.

# En este caso podemos dividir la función en módulos más pequeños. Tenemos dos opciones
# 1. si tenemos claro como hacerlo, programamos primero los módulos y luego la 
# función principal (generar_alerta)

# PARTE 1
# Paso 1: Crear un ejemplo de testing
stock_inicial <- 50
venta <- 1
# Paso 2: que pasos debo hacer?
# calcular stock
stock_final <- stock_inicial - venta
# Paso 3: colapsar código
# ya de por si el código es muy simple

# Los pasos 1, 2 y 3 se deberían repetir siempre y cuando haya variantes en el código. 
# Como en este caso es algo simple, solo necesitaremos comprobarlos una vez.

# Paso 4: crear la función
ajustar_stock <- function(stock_inicial, venta){
  stock_final <- stock_inicial - venta
  return(stock_final)
}

# Paso 5: Testing. probar varias variantes
ajustar_stock(50, 1)

# PARTE 2
# Paso 1: Crear un ejemplo de testing
categoria <- "muebles"
codigo <- 105
# Paso 2: que pasos debo hacer?
# formatear la referencia
paste("REF",toupper(categoria),codigo, sep = "-")
# Paso 3: colapsar código
# ya de por si el código es muy simple

# Los pasos 1, 2 y 3 se deberían repetir siempre y cuando haya variantes en el código. 
# Como en este caso es algo simple, solo necesitaremos comprobarlos una vez.

# Paso 4: crear la función
formatear_referencia <- function(categoria, codigo){
  formato <- paste("REF",toupper(categoria),codigo, sep = "-")
  return(formato)
}

# Paso 5: Testing. probar varias variantes
formatear_referencia("muebles", 105)

# PARTE 3
# Paso 1: Crear un ejemplo de testing
categoria <- "muebles"
codigo <- 105
stock_inicial <- 50
venta <- 1
# Paso 2: que pasos debo hacer?
# ajustar stock
stock_final <- ajustar_stock(stock_inicial, venta)
# formatear código
formato <- formatear_referencia(categoria, codigo)
# mensaje
mensaje <- paste("Producto", formato,"actualizado. Stock restante:", stock_final)
# Paso 3: colapsar código
# ya de por si el código es muy simple, ya lo tenemos modularizado

# Los pasos 1, 2 y 3 se deberían repetir siempre y cuando haya variantes en el código. 
# Como en este caso es algo simple, solo necesitaremos comprobarlos una vez.

# Paso 4: crear la función
generar_alerta <- function(stock_inicial, categoria, codigo, venta = 1){
  # ajustar stock
  stock_final <- ajustar_stock(stock_inicial, venta)
  # formatear código
  formato <- formatear_referencia(categoria, codigo)
  # mensaje: "Producto [NOMBRE_REF] actualizado. Stock restante: [VALOR]"
  mensaje <- paste("Producto", formato,"actualizado. Stock restante:", stock_final)
  return(mensaje)
}

# Paso 5: Testing. probar varias variantes
generar_alerta(50, "muebles", 105)

# 2. si no tenemos muy claro como hacer la función, intentamos hacerla completa, sin modular
# Paso 1: Crear un ejemplo de testing
categoria <- "muebles"
codigo <- 105
stock_inicial <- 50
venta <- 1
# Paso 2: que pasos debo hacer?
# ajustar stock
stock_final <- stock_inicial - venta
# formatear código
formato <- paste("REF",toupper(categoria),codigo, sep = "-")
# mensaje
mensaje <- paste("Producto", formato,"actualizado. Stock restante:", stock_final)
# Paso 3: colapsar código
# en este punto ya podemos valorar la necesidad de crear funciones modulares

# Paso 4: crear la función
generar_alerta <- function(stock_inicial, categoria, codigo, venta = 1){
  # ajustar stock
  stock_final <- stock_inicial - venta # decidir si esto se puede modular, si se puedo crear una función
  # formatear código
  formato <- paste("REF",toupper(categoria),codigo, sep = "-") # decidir si esto se puede modular, si se puede crear una función
  # mensaje
  mensaje <- paste("Producto", formato,"actualizado. Stock restante:", stock_final) # decidir si esto se puede modular, si se puede crear una función
  return(mensaje)
}

# Paso 5: Testing. probar varias variantes
generar_alerta(50, "muebles", 105)



##########################################################
# EJERCICIOS DE REFUERZO: FUNCIONES EN R #
##########################################################

# Ejercicio 1: Exploración de funciones estadísticas en campo
# Situación: Has registrado la altura de 10 ejemplares de una planta endémica.
# Uno de los datos se perdió (NA).
# 1. Crea un vector llamado 'alturas' con los valores: 1.25, 0.82, 1.54, NA, 1.11, 1.32, 0.93, 1.47, 1.08, 1.29
# 2. Usa la ayuda (?) para investigar la función 'range'.
# 3. Calcula el rango de alturas evitando que el valor NA invalide el resultado.
# 4. Redondea el resultado de la media de estas alturas a un solo decimal usando la función 'round'.





# Ejercicio 1
?range
alturas <- c(1.25, 0.82, 1.54, NA, 1.11, 1.32, 0.93, 1.47, 1.08, 1.29)
round(range(alturas, na.rm = TRUE), 1)


# Ejercicio 2: Entendiendo los argumentos por orden vs. nombre
# Situación: Queremos calcular el logaritmo de la biomasa de una parcela para normalizar los datos.
# 1. Imagina que la biomasa es 150. Calcula su logaritmo en base 10 de tres formas distintas:
#    a) Especificando los nombres de los argumentos (x y base).
#    b) Usando solo el orden de los argumentos.
#    c) Mezclando el primer argumento por orden y el segundo por nombre.





# Ejercicio 2
biomasa <- 150
log(x = biomasa, base = 10)
log(biomasa, 10)
log(biomasa, base = 10)



# Ejercicio 3: Función básica de conversión de unidades
# Situación: En los muestreos de agua, la temperatura se toma a veces en Fahrenheit, 
# pero necesitamos Celsius para el informe.
# 1. Crea una función llamada 'farenheit_a_celsius'.
# 2. La fórmula es: (farenheit - 32) * (5 / 9).
# 3. La función debe recibir el argumento 'temp_f' y retornar el valor convertido.
# 4. Prueba la función con 32, 68 y 100 grados Fahrenheit.





# Ejercicio 3
farenheit_a_celsius <- function(temp_f){
  temp_c <- (temp_f - 32) * (5 / 9)
  return(temp_c)
}
farenheit_a_celsius(32)
farenheit_a_celsius(68)
farenheit_a_celsius(100)

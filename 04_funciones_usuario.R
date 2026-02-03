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



# MINIRETO: Modifica la función anterior para que el valor del IVA sea un argumento, que por defecto sea 1.21 pero pueda modificarse
calcular_iva(100, 1.04)



## Ámbito de las funciones (Scope) ##
# Cuando creamos parámetros dentro de una función no se almacenan en el entorno, sino que se almacenan en la memoria de dicha función

mi_funcion <- function(x) {
  variable_interna <- 10  # Solo existe aquí dentro
  return(x + variable_interna)
}

mi_funcion(5)
variable_interna
# si intento mostrar la variable interna me dirá que esa variable no existe

## Objetivo ##

# ¿Para qué queremos crear una función?
# 1. Evitar repetir código (DRY: Don't Repeat Yourself).
# 2. Automatizar tareas complejas.
# 3. Hacer que el código sea más legible y fácil de mantener.

# Tenemos una serie de etiquetas que queremos estandarizar. Podemos hacer con código normal de R sin hacer funciones
categoria <- "norte"
codigo <- 1
paste0("[", toupper(categoria), "] - ID: ", codigo) # paste0 es una alternativa a usar paste(sep = "")

# sin embargo paste0("[", toupper(categoria), "] - ID: ", codigo) puede resultar algo confuso... sobretodo si es algo
# que vamos a hacer a menudo. Podemos crear una función:
formatear_etiqueta <- function(categoria, codigo) {
  etiqueta <- paste0("[", toupper(categoria), "] - ID: ", codigo)
  return(etiqueta)
}

# Usarla las veces que queramos, de forma mucho más explícita
formatear_etiqueta("ventas", 1024)
formatear_etiqueta("norte", 1)


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
# y otra que use la anterior para limpiar texto y luego cuente caracteres (nchar).
analizar_texto("  HOLA Mundo   ")


## Testing ##
# Siempre prueba tu función con casos extremos (valores vacíos, NA, tipos de datos incorrectos).

# MINIRETO: Prueba la función 'calcular_iva' con un vector de precios y con un NA.
# ¿Qué pasa?

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


################################################################################
#                         EJERCICIOS COMPLEMENTARIOS                           #
#                Tema: Funciones, Vectorización y R Base                       #
################################################################################

# Ejercicio 1: Extractor de Iniciales para Usuarios
# Para crear nombres de usuario internos, necesitamos las dos primeras letras de una palabra.
# Crea una función llamada 'generar_prefijo' que reciba un nombre de departamento,
# lo convierta a mayúsculas y extraiga solo las dos primeras letras (pista: usa substring()).
# Prueba la función con el departamento "Contabilidad".

# Ejercicio 2: Limpieza de Caracteres Especiales en Precios
# A veces los datos vienen de Excel con el símbolo "$" pegado al número como texto: "$125.50".
# Crea una función llamada 'limpiar_precio' que reciba ese texto, elimine el símbolo "$" 
# (pista: usa gsub()), lo convierta a numérico (as.numeric()) y lo multiplique por 0.92 
# para convertirlo a euros.
# Prueba la función con el valor "$100".

# Ejercicio 3: Contador de Diversidad de Productos
# Un supervisor quiere saber cuántas categorías únicas hay en un listado de stock.
# Crea una función llamada 'contar_categorias' que reciba un vector con muchas categorías
# repetidas y devuelva el número total de categorías diferentes (pista: usa unique() y length()).
# Prueba con: stock <- c("Mesa", "Silla", "Mesa", "Sofá", "Silla", "Mesa").

# Ejercicio 4: Generador de Temas para Blog
# Para las URLs de una web, los títulos deben estar en minúsculas y con guiones en vez de espacios.
# Crea una función llamada 'crear_tema' que reciba una frase (ej: "Curso de R Base")
# y devuelva el texto en minúsculas sustituyendo los espacios por guiones (pista: usa tolower() y gsub()).
# Prueba con: "Introduccion a las Funciones en R".

# Ejercicio 5: Generador de Mensajes de Stock
# Imagina que gestionas un almacén. Necesitas una función que genere un aviso 
# sobre el estado de un producto.
# Crea una función llamada 'estado_inventario' que reciba tres argumentos:
# 'producto' (nombre del objeto), 'cantidad' (un número) y 'pasillo' (una letra).
# El argumento 'pasillo' debe tener el valor por defecto "Z".
# La función debe devolver un mensaje como este: 
# "Producto: [PRODUCTO] | Unidades: [CANTIDAD] | Ubicación: Pasillo [PASILLO]"
# Prueba la función con el producto "Tuercas", cantidad 500 y pasillo "A".
# Prueba también qué pasa si solo le pasas el producto "Tornillos" y la cantidad 100.

# Ejercicio 6: Flujo Modular - Formateo de Informes Médicos
# Vamos a crear un sistema modular para procesar nombres de pacientes:
#
# A. Crea la función 'limpiar_texto' que elimine espacios laterales y convierta a mayúsculas.
# B. Crea la función 'añadir_etiqueta' que reciba el nombre limpio y le pegue 
#    delante el texto "PACIENTE: ".
# C. Crea la función 'preparar_registro' que combine las dos anteriores para 
#    procesar un nombre y devolver el resultado final.
#
# Prueba el flujo con el nombre: "    garcía pérez, juan    ".

################################################################################
#                         SOLUCIONES PROPUESTAS                                #
################################################################################

# Solución Ejercicio 1:
generar_prefijo <- function(departamento) {
  dep_mayus <- toupper(departamento)
  prefijo   <- substr(dep_mayus, 1, 2)
  return(prefijo)
}
# Test: 
generar_prefijo("Contabilidad")


# Solución Ejercicio 2:
limpiar_precio <- function(texto_precio) {
  # Eliminamos el símbolo de dólar
  solo_numero <- gsub("$", "", texto_precio, fixed = TRUE)
  # Convertimos a numérico para poder operar
  valor_num   <- as.numeric(solo_numero)
  # Conversión a euros (0.92)
  resultado   <- valor_num * 0.92
  return(resultado)
}
# Test: 
limpiar_precio("$100")


# Solución Ejercicio 3:
contar_categorias <- function(vector_datos) {
  unicos <- unique(vector_datos)
  total  <- length(unicos)
  return(total)
}
# Test: 
contar_categorias(c("Mesa", "Silla", "Mesa", "Sofá", "Silla", "Mesa"))


# Solución Ejercicio 4:
crear_tema <- function(titulo) {
  en_minusculas <- tolower(titulo)
  con_guiones   <- gsub(" ", "-", en_minusculas)
  return(con_guiones)
}
# Test: 
crear_tema("Introduccion a las Funciones en R")


# Solución Ejercicio 5:
estado_inventario <- function(producto, cantidad, pasillo = "Z") {
  # Usamos paste para construir la cadena con los tres elementos
  mensaje <- paste("Producto:", producto, 
                   "| Unidades:", cantidad, 
                   "| Ubicación: Pasillo", pasillo)
  
  return(mensaje)
}

# Test con todos los argumentos:
estado_inventario("Tuercas", 500, "A")

# Test usando el valor por defecto para el pasillo:
estado_inventario("Tornillos", 100)


# Solución Ejercicio 6:
# A.
limpiar_texto <- function(texto) {
  paso1 <- trimws(texto)
  paso2 <- toupper(paso1)
  return(paso2)
}

# B.
añadir_etiqueta <- function(nombre_limpio) {
  resultado <- paste("PACIENTE:", nombre_limpio)
  return(resultado)
}

# C.
preparar_registro <- function(nombre_crudo) {
  limpio    <- limpiar_texto(nombre_crudo)
  etiquetado <- añadir_etiqueta(limpio)
  return(etiquetado)
}
# Test: 
preparar_registro("    garcía pérez, juan    ")

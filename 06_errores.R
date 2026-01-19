### Errores en la Consola o en RStudio

## Unexpected Symbol
# Ocurre cuando R encuentra algo donde no debería estar, generalmente por 
# falta de una coma, un operador o un paréntesis mal cerrado.
# Ejemplo de error:

# mean(c(1, 2) 5)  -> Error: unexpected numeric constant
# y = 10 5         # Error: unexpected numeric constant (falta el operador + o *)
# 5x <- 5         # Error: Las variables no empiezan nunca por número
# x y = 7   # Las variables tampoco tienen espacio
# x-y <- 7 # Las variables no llevan guiones

## Could not find function
# Significa que R no reconoce el nombre de la función. 
# Causas: 1) Librería no cargada, 2) Error tipográfico (R distingue mayúsculas).
# Ejemplo:
# readxlsx("datos.xlsx") # Error: could not find function "readxlsx" (es read.xlsx)
# ploty(iris)            # Error: no cargaste library(plotly)
# men(c(4,5,7,8,9,78)) # Error: No existe la función men (querrías decir mean?)

## File does not exists
## File does not exists
# R no encuentra el archivo en la ruta especificada. 
# Revisa getwd() o si el nombre tiene errores de escritura.
# read.csv("mis_datos_falsos.csv") # Error: cannot open the connection. No such file or directory

## Object not found
# Intentas usar una variable que no ha sido creada o cuyo nombre está mal escrito.
# Ejemplo:
resultado_final <- 100
# print(resultado_fianl) # Error: object 'resultado_fianl' not found (error tipográfico)

## Subscript out of bounds
# Ocurre al intentar acceder a una posición (índice) que no existe en un vector o matriz.
mi_vector <- c(10, 20, 30)
# mi_vector[5]           # En vectores devuelve NA, pero en matrices/arrays da el error:
# matriz <- matrix(1:4, 2, 2)
# matriz[3, 1]           # Error: subscript out of bounds

## argument 'x' not found
# Ocurre cuando una función requiere obligatoriamente un parámetro y no se lo das.
# mean()                 # Error: argument "x" is missing, with no default

## unused argument
# Le estás pasando a la función un parámetro que no reconoce.
# sum(10, 20, color = "red") # Error: unused argument (color = "red")

### Trucos para evitar errores

# RStudio resalta la sintaxis. Si ves una cruz roja en el margen izquierdo, 
# hay un error de sintaxis antes de ejecutar el código.

# Unexpected symbol

# 5x <- 5 # atención a la cruz

# Cerrar corchetes, paréntesis, llaves etc
# Regla de oro: Todo lo que se abre, se debe cerrar.

# if(5 > 1){    # Tambien aparece el error
#   print("hola")

# Al escribir "(", RStudio suele poner ")" automáticamente. ¡No lo borres!
mi_lista <- list(a = c(1, 2, 3)) # Correcto

if(5 > 1){    # Usamos el cursos para saber a que corchete pertenece
  print("hola")
}


## Usar tabulador para definir variables
# Empieza a escribir el nombre de tu objeto o función y pulsa TAB.
# RStudio autocompletará el nombre, evitando errores de ortografía (typos).
# Ejemplo: escribes "write" + TAB y RStudio sugiere "write.csv", "write.table" etc

## Ejecutar un bucle paso a paso
# Si un bucle for falla, define el índice manualmente para probar el interior.
# for(i in 1:10) { ... }
# Si falla, haz: i <- 1 y ejecuta línea a línea lo que hay dentro de las llaves {}.

## Usar la ayuda de las funciones
# Ante la duda, mira qué argumentos acepta la función exactamente.
?seq
# Si el ejemplo de la ayuda funciona pero el tuyo no, el problema está en tus datos.

### EJERCICIO DE "CAZA DE ERRORES" (Debugging)

# Misión: El siguiente código está lleno de errores. 
# Tu objetivo es identificar por qué falla cada línea y corregirla.

# --- ERROR 1: ¿Qué falta aquí? ---
# Tip: Revisa los símbolos inesperados.
resultado <- (50 + 50 2
print(resultado)


# --- ERROR 2: El error del principiante ---
# Tip: R es sensible a mayúsculas y minúsculas (Case Sensitive).
VALOR_inicial <- 500
total <- valor_inicial + 100


# --- ERROR 3: La función desaparecida ---
# Tip: Esta función es de la librería 'readr'.
# Si no la cargas, R no sabrá qué es.
write_csv(iris, "datos_test.csv")


# --- ERROR 4: Límites de la realidad ---
# Tip: Mira las dimensiones de esta matriz.
mi_tabla <- matrix(1:9, nrow = 3, ncol = 3)
# Queremos el dato de la fila 4, columna 1
dato_especifico <- mi_tabla[4, 1]


# --- ERROR 5: Argumentos rebeldes ---
# Tip: Consulta la ayuda con ?sum para ver si 'na.remove' existe.
numeros <- c(1, 2, NA, 4)
suma_total <- sum(numeros, na.remove = TRUE)


# --- ERROR 6: El bucle infinito (o roto) ---
# Tip: Prueba a definir i <- 1 manualmente y ejecuta lo de dentro.
nombres <- c("Ana", "Luis", "Pedro")

for (i in 1:length(nombres)) {
  print(
    paste("Hola", nombres[i])
}
# (Pista: Fíjate en los paréntesis del print)

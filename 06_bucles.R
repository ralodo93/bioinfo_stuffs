# Los bucles son estructuras de control que nos permiten ejecutar un mismo proceso varias veces de forma automática. 
# Son la base de automatizar un proceso. Volviendo a nuestros ejemplos, tenemos la función resumen_vector, 
# que nos devolvía un dataframe con los valores de la media, la mediana y la desviación estándar de un vector. 
# Pero... ¿y si tengo más de un vector?. Para no tener que repetir el código tantas veces como vectores haya, 
# podemos aplicar un bucle en el que cada vuelta coja uno de los vectores y aplique la función.


# Los bucles más conocidos son los bucles for, aunque también tenemos los bucles while y 
# algunas funciones útiles como las de la familia apply()

### Bucle for

print(paste("Estoy en la vuelta", 1))
print(paste("Estoy en la vuelta", 2))
print(paste("Estoy en la vuelta", 3))

# La estructura de un bucle for consiste en: asignar una variable a cada vuelta. Se asigna la variable i a cada vuelta del bucle. 
# Es decir, i tomará el valor 1, ejecutará lo que haya entre las llaves y al volver al for tomará el valor 2, y así hasta que no haya más valores.

for (i in 1:3){
  print(paste("Estoy en la vuelta", i))
}


# También puede tomar elemento a elemento los elementos de un vector. 
# Ya sabemos que la función paste(), al ser vectorizada no necesita de este bucle, 
# por lo que solo lo muestro como explicación
vector_numeros <- c(5,7,8,9)
for (numero in vector_numeros){
  print(paste("Soy el número", numero))
}

# útiles cuando tenemos funciones no vectorizadas
resumen_vector <- function(vector_numeros){
  df <- data.frame(media = function_na.rm(vector_numeros, mean),
                   mediana = function_na.rm(vector_numeros, median),
                   sd = function_na.rm(vector_numeros, sd))
  return(df)
}

vectores_interes <- list(1:10, 11:25)
# resumen_vector(vectores_interes) da un error ya que espera un solo vector, debemos usar un bucle

for (vector_interes in vectores_interes){
  print(resumen_vector(vector_interes)) # ahora si que devuelve los resultados de cada vector
}

# Podemos guardar los resultados en una lista o en vector (siempre que los datos sean atomicos)
resultados <- c() # creamos un vector vacío
for (i in 1:10){
  resultados <- c(resultados, i * 10) # a cada vuelta se le añade un nuevo valor (i * 10)
}

resultados <- list() # creamos una lista vacía
for (i in 1:length(vectores_interes)){
  resultados[[i]] <- resumen_vector(vectores_interes[[i]]) # cada vuelta crea un nuevo vector en la lista vacía
}
resultados

## Bucles anidados

# Es cuando dentro de un bucle ocurre otro. Hasta que no termine el bucle interior no cambia de valor el bucle exterior
for (i in 1:10){
  for (j in 11:20){
    print(paste("Valor I:", i, "; Valor J:", j))
  }
}

# Ejemplos:

# 1. Imagina que tienes que generar una lista de nombres de archivos para un reporte mensual. 
# Queremos que el nombre del archivo combine el mes y el año, 
# pero queremos hacerlo paso a paso para confirmar cada nombre.

meses <- c("Enero", "Febrero", "Marzo")
anio <- 2024

# crear una función para generar el informe
generar_informe <- function(mes, anio){
  nombre <- paste0("informe_", mes, "_", anio, ".csv")
  return(nombre)
}

for (m in meses) {
  archivo_final <- generar_informe(m, anio)
  print(archivo_final)
}

# 2. Este es un caso clásico donde el for es muy útil: cuando quieres ver cómo evoluciona un valor a lo largo del tiempo. 
# Vamos a calcular cuánto dinero tendrías cada año si ahorras una cantidad fija, 
# sin usar fórmulas financieras complejas, solo sumando.

# Configuración
anios <- 1:5
ahorro_inicial <- 0
aportacion <- 1000 # anual

saldo_acumulado <- ahorro_inicial # establecemos el saldo acumulado

for (anio in anios){
  saldo_acumulado <- saldo_acumulado + aportacion # modificamos el valor de saldo acumulado en cada vuelta
  mensaje <- paste("Al finalizar el año",anio,"tienes",saldo_acumulado)
  print(mensaje)
}

# MiniReto: 

# 1. Crea la función 'metros_a_cm' (multiplica por 100)
metros_a_cm <- function(m) {
  # Tu código aquí
}

# 2. Vector de medidas
medidas_metros <- c(1.5, 2, 0.75, 10)

# 3. Usa un bucle FOR para imprimir: "X metros son Y centímetros"
for (medida in medidas_metros) {
  # Tu código aquí
}

### Bucles while

# La estructura de un bucle while consiste en: dar vueltas infinitas hasta que se cumpla una condición. 
# Con este bucle debemos tener cuidado ya que en caso de que lo configuremos mal, podría quedarse en bucle infinito.

contador <- 0
while (contador < 10){
  print("Otra vuelta, aún no se ha cumplido la condición")
  contador <- contador + 1
}

# Evitar usarlo siempre que no sea necesario. Por lo general usaremos bucle for. 
# Este tipo de bucle está pensado para escenarios en los que no sabemos cuantas vueltas hay que dar: 
# por ejemplo - número de lanzamientos de un dado hasta que salga un número.

lanzamientos <- 0
numero_dado <- 0

while (numero_dado != 5){ # hasta que no salga un cinco vamos a estar lanzando el dado
  lanzamientos <- lanzamientos + 1
  numero_dado <- sample(1:6, 1)
  print(paste("En el lanzamiento número", lanzamientos, "se ha obtenido un", numero_dado))
}

# MiniReto:

# Imagina que quieres comprarte una consola que cuesta 300€. 
# Tienes una hucha vacía y cada día metes una cantidad de dinero aleatoria (entre 10 y 50 euros) 
# que encuentras por casa. Como no sabes qué cantidad encontrarás cada día, 
# no sabes cuántos días tardarás en llegar a la meta.

# 1. Variables iniciales
meta_ahorro <- 300
hucha <- 0
dia <- 0

# 2. El bucle While
# La condición es: "mientras la hucha sea menor que la meta..."

while (hucha < meta_ahorro) {
  # Aumentamos el contador de días
  # Escribir código
  
  # Generamos una cantidad aleatoria encontrada ese día (entre 10 y 50)
  # Escribir código
  
  # Sumamos el dinero a la hucha (actualiza la variable hucha)
  # Escribir código
  
  # Imprimimos el progreso
  print(paste("Día", dia, ": He encontrado", dinero_encontrado, "€. En la hucha hay:", hucha, "€"))
}


### Bucles familia apply (apply(), lapply(), sapply())

# Las funciones de la familia apply son una de las características más potentes de R. 
# Se utilizan para aplicar una función a los elementos de un objeto (como una lista, un vector o una matriz) 
# de forma eficiente, evitando escribir bucles for largos y complejos.

# La familia apply es un conjunto de funciones que actúan como sustitutos de los bucles. La idea es: "Tengo este conjunto de datos, aplícale esta función a cada parte". 
# Las más usadas son apply(), sapply() y lapply().

## apply() -> apply(matriz o dataframe, MARGIN, FUN) -> Aplica la función (FUN) al las filas o columnas (MARGIN) de la matriz
# MARGIN = 1 -> Se aplica a filas
# MARGIN = 2 -> Se aplica a columnas

mi_matriz <- matrix(1:9, nrow = 3)

# Calcular la suma de cada FILA (MARGIN = 1)
apply(mi_matriz, 1, sum)

# Calcular la suma de cada COLUMNA (MARGIN = 2)
apply(mi_matriz, 2, sum)

# Se puede aplicar cualquier función, incluyendo generadas por nosotros mismos

## sapply() -> sapply(vector o lista, FUN) -> Aplica una función (FUN) a un vector
sapply(1:4, sqrt)

# alternativa: definir una función en FUN:
sapply(1:4, function(x){ # se define la función de forma interna, no se crea, solo se utiliza
  sqrt(x)
})

## lapply() -> lapply(vector o lista, FUN) -> Aplica una función (FUN) a un vector

# Es exactamente igual a un sapply solo que devuelve el resultado en formato lista
lapply(1:4, sqrt)

# alternativa: definir una función en FUN:
lapply(1:4, function(x){ # se define la función de forma interna, no se crea, solo se utiliza
  sqrt(x)
})

# MiniReto

# 1. Datos de entrada
notas_clase <- list(
  Juan = c(5, 7, 8, 6),
  Maria = c(9, 10, 9, 8.5),
  Pedro = c(4, 5, 3, 6)
)

# 2. Tu misión: Usa la función adecuada (lapply o sapply) 
# para calcular la media (mean) de cada alumno.

# TU CÓDIGO AQUÍ:
# medias <- ...

# 3. Imprime el resultado
# print(medias)


### EJERCICIOS PRÁCTICOS: BUCLES EN R ###

# 1. Bucle FOR: Tabla de multiplicar
# Crea un bucle for que imprima la tabla de multiplicar del 7 (del 1 al 10)
# Formato: "7 x i = resultado"

# 2. Bucle FOR: Acumulador de texto
# Tienes una lista de ingredientes. Usa un bucle para "cocinar" un mensaje.
ingredientes <- c("Tomate", "Queso", "Orégano")
pizza <- "La pizza lleva:"

# Resultado final: "La pizza lleva: Tomate, Queso, Orégano

# 3. Bucle WHILE: El contador regresivo
# Haz un contador que empiece en 5 y baje hasta 0.
# En cada vuelta debe imprimir "Faltan X segundos".
segundos <- 5


# 4. Familia APPLY: Limpieza de datos
# Tienes una matriz con medidas. Usa apply() para encontrar 
# el valor mínimo de cada COLUMNA.
mediciones <- matrix(c(1.2, 5.4, 0.8, 2.2, 4.3, 1.1), nrow = 2)


# 5. Familia APPLY: Conversión masiva
# Usa sapply para elevar al cuadrado todos los números del 1 al 5.

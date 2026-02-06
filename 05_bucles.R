# Bucles ----
# Los bucles son estructuras de control que nos permiten ejecutar un mismo proceso varias veces de forma automática. 

## Bucle FOR ----
# Nos permite evitar tener que hacer esto:
vector_numeros <- c(10, 20, 30, 40)
sqrt(vector_numeros[1])
sqrt(vector_numeros[2])
sqrt(vector_numeros[3])
sqrt(vector_numeros[4])

## Estructura ##
# for (iteración entre paréntesis) {ejecuta bloque entre llaves en cada iteración}
for (num in vector_numeros){ # para cada elemento de vector_numeros
  print(sqrt(num)) # calcula la raíz cuadrada de num (que coge los valores de forma iterada) e imprime el resultado
}

# MINIRETO: Crea un bucle for que calcule el log10 de cada elemento de vector_numeros



# SOLUCIÓN:
for (num in vector_numeros){ # para cada elemento de vector_numeros
  print(log10(num)) # calcula la raíz cuadrada e imprime el resultado
}

# El bucle for se puede usar como contador
for (i in 1:10){ # para cada elemento del vector 1:10
  print(paste("Ronda",i)) # imprime este mensaje
}

# Podemos rellenar un vector vacío
sqrts <- c()
for (num in vector_numeros){ # para cada elemento de vector_numeros
  sqrts <- c(sqrts, sqrt(num)) # en cada iteración añadimos un elemento al vector vacío
}
sqrts

# Podemos modificar una variable externa
ahorros <- 100
for (i in 1:5){
  ahorros <- ahorros * 1.02 # incremento del 2%
}
ahorros

# Podemos incorporar un if dentro de un for (o viceversa)
for (num in vector_numeros){
  if (num > 20){
    print(paste(num,"es mayor que 20"))
  } else if (num < 20){
    print(paste(num,"es menor de 20"))
  } else{
    print("Número 20")
  }
}


## Bucles Anidados ##
# Al igual que los condicionales, podemos usar bucles dentro de bucles. Hasta que no se complete el bucle interno, no se pasa a la siguiente iteración del bucle externo
for (i in 1:4){
  # una vez i es 1, no pasará el siguiente valor hasta que concluya el bucle interior
  for (j in 5:6){
    print(paste("Coordenadas",i,j))
  }
}


# MINIRETO: Haz un bucle anidado que junte las letras c("p","b") (vector externo) a c("a","e","i","o","u") (vector interno)
consonantes <- c("p","b")
vocales <- c("a","e","i","o","u")


# SOLUCIÓN:
for (consonante in consonantes){
  for (vocal in vocales){
    print(paste0(consonante, vocal))
  }
}

### Bucles while ###
# La estructura de un bucle while consiste en: dar vueltas infinitas hasta que se cumpla una condición. 
# Con este bucle debemos tener cuidado ya que en caso de que lo configuremos mal, podría quedarse en bucle infinito.

## Estructura ##
# variable_control while(condición entre paréntesis){ bloque de código entre llaves; se debe actualizar la variable de control}

contador <- 0 # variable de control
while (contador < 10){ # mientras no se cumpla esta condición
  print("Otra vuelta, aún no se ha cumplido la condición") # se ejecuta esto
  contador <- contador + 1 # actualizamos la variable de control
}

# Evitar usarlo siempre que no sea necesario. Por lo general usaremos bucle for. 
# Este tipo de bucle está pensado para escenarios en los que no sabemos cuantas vueltas hay que dar: 
# por ejemplo - número de lanzamientos de un dado hasta que salga un número.

lanzamientos <- 0
numero_dado <- 0 # variable de control

while (numero_dado != 5){ # hasta que no salga un cinco vamos a estar lanzando el dado
  lanzamientos <- lanzamientos + 1
  numero_dado <- sample(1:6, 1)
  print(paste("En el lanzamiento número", lanzamientos, "se ha obtenido un", numero_dado))
}

# MINIRETO: Crea un bucle while en el cual, a partir de una hucha vacía, reciba valores aleatorios entre 5 y 10€ diarios
# Cuando llegues a 80€ sal del bucle.
hucha <- 0 # variable control
dias <- 0



# SOLUCIÓN:
while(hucha < 80){
  dias <- dias + 1
  ingreso <- round(runif(1, 5, 10), 2)
  hucha <- hucha + ingreso # actualización variable control
  print(paste("Hoy es día", dias,"y he ingresado",ingreso,"euros. Llevo ahorrado", hucha, "euros"))
}


### Bucles familia apply (apply(), lapply(), sapply()) ###

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

# Existen 4 funciones especiales para matrices que nos permiten calcular media y suma por fila y columna
# colSums(), rowSums(), colMeans(), rowMeans()
colSums(mi_matriz) # suma total de cada columna
rowMeans(mi_matriz) # media de cada fila

## sapply() -> sapply(vector o lista, FUN) -> Aplica una función (FUN) a un vector
sapply(1:4, sqrt)


## lapply() -> lapply(vector o lista, FUN) -> Aplica una función (FUN) a un vector

# Es exactamente igual a un sapply solo que devuelve el resultado en formato lista
lapply(1:4, sqrt)

# MINIRETO: Dados los siguientes datos de entrada, calcula la media de cada alumno
notas_clase <- list(
  Juan = c(5, 7, 8, 6),
  Maria = c(9, 10, 9, 8.5),
  Pedro = c(4, 5, 3, 6)
)


# SOLUCIÓN:
sapply(notas_clase, mean)


### Funciones Vectorizadas ###
# Hay algunas funciones, muchas de ellas ya las hemos estudiado. Una función vectorizada es aquella que se aplica tanto a un vector como a un solo elemento
# En este aspecto, indicaros que un elemento (un número, un texto, etc) realmente es un vector de 1 elemento
num <- c(4) # es igual que usar num <- 4

# La mayor parte de las funciones que hemos estudiado son vectorizadas; todas aquellas que no describan el vector
sqrt(vector_numeros)
log10(vector_numeros)
abs(vector_numeros)

# También las funciones de texto están vectorizadas
nchar(c("Hola", "Bonjour"))
strsplit(c("Hola Mundo", "Hello World"), split = " ")

# También ifelse() está vectorizado
ifelse(vector_numeros > 20, sqrt(vector_numeros), vector_numeros ^2)

# Caso especial de paste.
# Por defecto paste funciona como vectorizado
paste("Mi número favorito es", vector_numeros)

# Sin embargo, cuando se usa el argumento collapse pasa a no ser vectorizada
paste(vector_numeros, collapse = ", ")

# MINIRETO: Redonde a 3 decimales el siguiente vector
set.seed(123)
vector_norm <- rnorm(15)


# SOLUCIÓN:
round(vector_norm, 3)


# Las funciones vectorizadas están optimizadas para trabajar de forma más eficiente que un bucle.
vector_norm <- rnorm(10000)
resultado <- round(vector_norm, 2)

resultado <- c()
for (num in vector_norm){
  resultado <- c(resultado, round(vector_norm, 2))
}


# Usando estas funciones podremos evitar la mayoría de los bucles (sobretodo los for), sin embargo
# habrá ocasiones en las que necesitemos usar un bucle for: simulaciones (cuando quieres simular algo x veces),
# cuando uno de los valores se modifica dentro del for (el ejemplo del ahorro), cuando dentro del for hay un if/else/else if etc




### EJERCICIOS COMPLEMENTARIOS: BUCLES Y FUNCIONES VECTORIZADAS ###

# Contexto: Gestión de una tienda de deportes y análisis de datos de rendimiento.

# Ejercicio 1: Bucle for con condicionales
# Una tienda tiene el siguiente inventario de stock: 
inventario <- c(15, 3, 0, 8, 20, 1)
# Crea un bucle for que recorra el vector 'inventario'. 
# Si el stock es 0, debe imprimir "Producto agotado".
# Si el stock es menor de 5, debe imprimir "Stock crítico: [número] unidades".
# En cualquier otro caso, debe imprimir "Stock suficiente".






# Ejercicio 1: Bucle for con condicionales
inventario <- c(15, 3, 0, 8, 20, 1)
for (stock in inventario) {
  if (stock == 0) {
    print("Producto agotado")
  } else if (stock < 5) {
    print(paste("Stock crítico:", stock, "unidades"))
  } else {
    print("Stock suficiente")
  }
}


# Ejercicio 2: Rellenar un vector vacío
# Tienes una lista de precios en euros: 
precios_eur <- c(19.99, 45.50, 120.00, 5.95)
# Crea un vector vacío llamado 'precios_usd'.
# Utiliza un bucle for para convertir cada precio a dólares (asume 1 EUR = 1.08 USD)
# y guarda cada resultado en el nuevo vector 'precios_usd'.
# Al finalizar, muestra el contenido de 'precios_usd'.





# Ejercicio 2: Rellenar un vector vacío
precios_eur <- c(19.99, 45.50, 120.00, 5.95)
precios_usd <- c()

for (precio in precios_eur) {
  precios_usd <- c(precios_usd, precio * 1.08)
}
precios_usd


# Ejercicio 3: Bucles anidados
# Vas a organizar un torneo de pádel. Tienes dos grupos:
grupo_A <- c("Equipo 1", "Equipo 2")
grupo_B <- c("Equipo 3", "Equipo 4")
# Crea un bucle anidado que genere e imprima todos los emparejamientos posibles 
# entre los equipos del grupo A y los equipos del grupo B.





# Ejercicio 3: Bucles anidados
grupo_A <- c("Equipo 1", "Equipo 2")
grupo_B <- c("Equipo 3", "Equipo 4")

for (equipo_a in grupo_A) {
  for (equipo_b in grupo_B) {
    print(paste("Partido:", equipo_a, "vs", equipo_b))
  }
}


# Ejercicio 4: Bucle while (Simulación)
# Un corredor de maratón está entrenando. Empieza con una energía de 100 unidades.
# En cada kilómetro que corre, pierde una cantidad de energía aleatoria entre 5 y 15 unidades.
# Utiliza un bucle while para simular cuántos kilómetros puede recorrer hasta que su 
# energía sea menor que 10. 
# Imprime en cada paso la energía restante y, al final, el total de kilómetros recorridos.
# (Pista: usa runif(1, 5, 15) para la energía perdida).






# Ejercicio 4: Bucle while (Simulación)
energia <- 100
kilometros <- 0

while (energia >= 10) {
  kilometros <- kilometros + 1
  perdida <- runif(1, 5, 15)
  energia <- energia - perdida
  print(paste("Kilómetro:", kilometros, "| Energía restante:", round(energia, 2)))
}
print(paste("Total kilómetros recorridos:", kilometros))


# Ejercicio 5: Familia apply y matrices
# Dispones de una matriz con las ventas de 3 tiendas (filas) durante 4 días (columnas):
ventas_tiendas <- matrix(c(1200, 1500, 1100, 1800, 900, 850, 1000, 1100, 2100, 1900, 2300, 2000), nrow = 3, byrow = TRUE)
# A) Utiliza una función de la familia apply para calcular el total de ventas de cada tienda.
# B) Utiliza la función específica de matrices para calcular la media de ventas por cada día.






# Ejercicio 5: Familia apply y matrices
ventas_tiendas <- matrix(c(1200, 1500, 1100, 1800, 900, 850, 1000, 1100, 2100, 1900, 2300, 2000), nrow = 3, byrow = TRUE)

# A) Total de ventas de cada tienda (por filas)
apply(ventas_tiendas, 1, sum)

# B) Media de ventas por cada día (por columnas)
colMeans(ventas_tiendas)


# Ejercicio 6: Funciones vectorizadas vs sapply
# Tienes los nombres de varios empleados en minúsculas:
empleados <- c("alberto", "beatriz", "carlos", "diana")
# A) Utiliza sapply para calcular cuántas letras (nchar) tiene cada nombre.
# B) Realiza la misma operación pero aprovechando que nchar es una función vectorizada.
# C) Utiliza la función ifelse() para crear un nuevo vector que diga "Nombre largo" 
# si tiene más de 6 letras y "Nombre corto" si tiene 6 o menos.






# Ejercicio 6: Funciones vectorizadas vs sapply
empleados <- c("alberto", "beatriz", "carlos", "diana")

# A) Usando sapply
sapply(empleados, nchar)

# B) Usando la función vectorizada directamente
nchar(empleados)

# C) Usando ifelse vectorizado
resultado_nombres <- ifelse(nchar(empleados) > 6, "Nombre largo", "Nombre corto")
resultado_nombres

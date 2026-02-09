# Bucles ----
# Los bucles son estructuras de control que nos permiten ejecutar un mismo proceso varias veces de forma automática. 

## Bucle FOR ----
# Nos permite evitar tener que hacer esto:
vector_numeros <- c(10, 20, 30, 40)
sqrt(vector_numeros[1])
sqrt(vector_numeros[2])
sqrt(vector_numeros[3])
sqrt(vector_numeros[4])

### Estructura ----
# for (iteración entre paréntesis) {ejecuta bloque entre llaves en cada iteración}
for (num in vector_numeros){ # para cada elemento de vector_numeros
  print(sqrt(num)) # calcula la raíz cuadrada de num (que coge los valores de forma iterada) e imprime el resultado
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

### Añdir bucles FOR a otras estructuras
for (num in vector_numeros){
  if (num > 20){
    print(paste(num,"es mayor que 20"))
  } else if (num < 20){
    print(paste(num,"es menor de 20"))
  } else{
    print("Número 20")
  }
}


### Bucles anidados ----
# Al igual que los condicionales, podemos usar bucles dentro de bucles. Hasta que no se complete el bucle interno, no se pasa a la siguiente iteración del bucle externo
for (i in 1:4){
  # una vez i es 1, no pasará el siguiente valor hasta que concluya el bucle interior
  for (j in 5:6){
    print(paste("Coordenadas",i,j))
  }
}


## Bucles while ----
# Dar vueltas infinitas hasta que se cumpla una condición. 
# Con este bucle debemos tener cuidado ya que en caso de que lo configuremos mal, podría quedarse en bucle infinito.

### Estructura ----
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


## Bucles familia apply (apply(), lapply(), sapply()) ----

# Las funciones de la familia apply son una de las características más potentes de R. 
# Se utilizan para aplicar una función a los elementos de un objeto (como una lista, un vector o una matriz) 
# de forma eficiente, evitando escribir bucles for largos y complejos.

# La familia apply es un conjunto de funciones que actúan como sustitutos de los bucles. La idea es: "Tengo este conjunto de datos, aplícale esta función a cada parte". 
# Las más usadas son apply(), sapply() y lapply().

### apply() ----
# apply(matriz o dataframe, MARGIN, FUN) -> Aplica la función (FUN) al las filas o columnas (MARGIN) de la matriz
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

### sapply() ----
# sapply(vector o lista, FUN) -> Aplica una función (FUN) a un vector
sapply(1:4, sqrt)


## lapply() ----
# lapply(vector o lista, FUN) -> Aplica una función (FUN) a un vector

# Es exactamente igual a un sapply solo que devuelve el resultado en formato lista
lapply(1:4, sqrt)


## Funciones Vectorizadas ----
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


# EJERCICIO 1. BUCLES FOR: CRECIMIENTO POBLACIONAL CON CAPACIDAD DE CARGA
# Enunciado: Una población de linces (Lynx pardinus) comienza con 20 individuos. 
# Su tasa de crecimiento es del 5% anual, pero el ecosistema tiene una capacidad de carga (K) 
# de 50 individuos. Si la población supera K, el crecimiento se detiene (se vuelve 0). 
# Calcula mediante un bucle FOR la población proyectada para los próximos 15 años.


# SOLUCIÓN
poblacion <- 20
K <- 50
proyeccion <- c(poblacion)

for (año in 1:15) {
  if (poblacion < K) {
    poblacion <- poblacion * 1.05
  } else {
    poblacion <- K
  }
  proyeccion <- c(proyeccion, poblacion)
}
proyeccion


# EJERCICIO 2. BUCLES FOR ANIDADOS: MATRIZ DE INTERACCIÓN TRÓFICA
# Enunciado: Crea una matriz de 4x4 que represente la probabilidad de interacción 
# entre 4 especies de plantas (filas) y 4 de polinizadores (columnas). 
# Rellena la matriz usando bucles anidados de modo que la probabilidad sea 
# la suma de los índices (i+j) dividida por 10.



# SOLUCIÓN
red_interaccion <- matrix(nrow = 4, ncol = 4)

for (i in 1:4) {
  for (j in 1:4) {
    red_interaccion[i, j] <- (i + j) / 10
  }
}
red_interaccion


# EJERCICIO 3. BUCLE WHILE: DEGRADACIÓN DE UN CONTAMINANTE
# Enunciado: Un vertido de nitratos en una laguna tiene una concentración inicial de 
# 500 mg/L. Cada día, las bacterias biorremediadoras degradan un 15% de la concentración 
# presente. ¿Cuántos días deben pasar para que la concentración sea segura (menor a 25 mg/L)? 
# Usa un bucle WHILE para hallar la respuesta.

# SOLUCIÓN
concentracion <- 500
dias <- 0

while (concentracion >= 25) {
  concentracion <- concentracion * 0.85
  dias <- dias + 1
}
print(paste("Días necesarios:", dias))


# EJERCICIO 4. FAMILIA APPLY: BIOMASA POR PARCELAS
# Enunciado: Dispones de una matriz donde cada fila es una parcela (4 parcelas) y cada 
# columna es una medición de biomasa (3 réplicas por parcela). 
# Calcula la biomasa media de cada parcela y identifica aquellas que superan los 
# 15 kg/m2 usando apply().


# SOLUCION
biomasa_datos <- matrix(c(12, 14, 13, 20, 18, 22, 5, 7, 6, 15, 16, 14), nrow = 4, byrow = TRUE)
medias_parcela <- apply(biomasa_datos, 1, mean)
parcelas_productivas <- medias_parcela > 15

medias_parcela
parcelas_productivas


# EJERCICIO 5. FUNCIONES VECTORIZADAS: CLASIFICACIÓN DE SECUENCIAS
# Enunciado: Tienes un vector con longitudes de fragmentos de ADN (en pares de bases). 
# Utiliza la función vectorizada ifelse() para clasificar cada fragmento como 
# "Corto" (menor a 100 bp) o "Largo" (100 bp o más), y luego concatena el resultado 
# con el valor original usando paste().


# SOLUCIÓN
fragmentos_adn <- c(45, 120, 88, 250, 32)
clasificacion <- ifelse(fragmentos_adn < 100, "Corto", "Largo")
resultado_final <- paste(fragmentos_adn, "bp:", clasificacion)

resultado_final



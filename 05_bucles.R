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

#############################################################
# EJERCICIO 1
# Contexto:
# Un biólogo está monitorizando el crecimiento de una colonia bacteriana 
# en el laboratorio. Inicialmente hay 500 bacterias. Cada hora, la 
# población crece un 15% respecto a la hora anterior. Se quiere conocer 
# la evolución durante las primeras 8 horas.
#
# Enunciado:
# 1. Crea una variable 'poblacion' con el valor inicial de 500.
# 2. Utiliza un bucle for que recorra un contador del 1 al 8 (representando 
#    las horas).
# 3. En cada iteración, actualiza la variable 'poblacion' multiplicándola 
#    por 1.15 (incremento del 15%).
# 4. Dentro del bucle, imprime un mensaje que diga: "Hora [i]: [poblacion] bacterias". 
#    Usa round() para que el número de bacterias no tenga decimales.
#############################################################

# El estudiante debe completar a partir de aquí



# SOLUCIÓN
poblacion <- 500
for (i in 1:8){
  poblacion <- poblacion * 1.15
  print(paste0("Hora ",i,": ",round(poblacion)," bacterias"))
}


#############################################################
# EJERCICIO 2
# Contexto:
# Se han analizado los niveles de una proteína específica en 5 pacientes. 
# Los resultados se almacenan en un vector. El protocolo clínico indica 
# que si el nivel es superior a 30, la muestra debe marcarse como "Positivo", 
# de lo contrario, como "Negativo".
#
# Enunciado:
# 1. Dado el vector: niveles_proteina <- c(25, 40, 15, 32, 28).
# 2. Crea un vector vacío llamado 'diagnostico'.
# 3. Crea un bucle for que recorra cada elemento de 'niveles_proteina'.
# 4. Dentro del bucle, usa una estructura if/else:
#    - Si el nivel es > 30, añade el texto "Positivo" al vector 'diagnostico'.
#    - Si no, añade el texto "Negativo" al vector 'diagnostico'.
# 5. Al finalizar el bucle, muestra el vector 'diagnostico' resultante.
#############################################################

# El estudiante debe completar a partir de aquí

niveles_proteina <- c(25, 40, 15, 32, 28)


# SOLUCIÓN

niveles_proteina <- c(25, 40, 15, 32, 28)

diagnostico <- c()

for (nivel in niveles_proteina){
  if (nivel > 30){
    diagnostico <- c(diagnostico, "Positivo")
  } else{
    diagnostico <- c(diagnostico, "Negativo")
  }
}

diagnostico



#############################################################

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

#############################################################
# EJERCICIO 25
# Contexto:
# Un investigador está realizando un experimento de titulación en el que 
# añade gotas de una solución alcalina a una muestra ácida. El objetivo 
# es alcanzar un pH de 7.0 (o ligeramente superior) para neutralizar 
# la muestra. Se desconoce cuántas gotas serán necesarias exactamente.
#
# Enunciado:
# 1. Crea una variable 'ph_actual' con el valor inicial de 3.2.
# 2. Crea una variable 'gotas_anadidas' que actúe como contador, 
#    empezando en 0.
# 3. Utiliza un bucle while que se ejecute mientras 'ph_actual' sea 
#    estrictamente menor que 7.0.
# 4. Dentro del bucle:
#    - Suma 1 a 'gotas_anadidas'.
#    - Incrementa el 'ph_actual' sumándole un valor aleatorio entre 0.1 
#      y 0.8 (Usa la función runif(1, min = 0.1, max = 0.8)).
#    - Imprime un mensaje que diga: "Gota [gotas_anadidas]: pH actual = [ph_actual]". 
#      Usa round() para mostrar solo 2 decimales del pH.
# 5. Fuera del bucle, imprime el mensaje final: "Neutralización completada 
#    tras añadir [gotas_anadidas] gotas".
#############################################################

# El estudiante debe completar a partir de aquí:



# SOLUCIÓN
ph_actual <- 3.2
gotas_anadidas <- 0

while(ph_actual < 7){
  gotas_anadidas <- gotas_anadidas + 1
  ph_actual <- ph_actual + runif(1, min = 0.1, max = 0.8)
  print(paste0("Gota ", gotas_anadidas, ": pH actual ", round(ph_actual, 2)))
}

paste("Neutralización completada tras añadir", gotas_anadidas, "gotas")

#############################################################

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

#############################################################
# EJERCICIO 26
# Contexto:
# Un centro de investigación genómica ha analizado la expresión de 4 genes 
# en 3 tipos de tejidos diferentes. Los resultados se han organizado en 
# una matriz. Se requiere obtener estadísticas rápidas por gen y por tejido, 
# además de transformar los datos de una lista de identificadores.
#
# Enunciado:
# 1. Crea una matriz llamada 'expresion_genes' con los valores del 1 al 12, 
#    organizada en 4 filas (genes) y 3 columnas (tejidos).
# 2. Utiliza la función apply() para calcular el valor máximo (max) de 
#    expresión para cada GEN (filas).
# 3. Utiliza la función apply() para calcular la media (mean) de expresión 
#    para cada TEJIDO (columnas).
# 4. Dado el vector: ids <- c("gen_a", "gen_b", "gen_c").
#    - Usa sapply() para convertir todos los nombres a mayúsculas (toupper).
#    - Usa lapply() para hacer lo mismo y observa que el resultado es una lista.
#############################################################

# El estudiante debe completar a partir de aquí




# SOLUCIÓN

expresion_genes <- matrix(1:12, ncol = 3)

apply(expresion_genes, MARGIN = 1, max)

apply(expresion_genes, MARGIN = 2, mean)

ids <- c("gen_a", "gen_b", "gen_c")
sapply(ids, toupper)
lapply(ids, toupper)

#############################################################

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

#############################################################
# EJERCICIO 1
# Contexto:
# Un analista de datos hospitalarios recibe una lista de concentraciones
# de un reactivo en diferentes lotes. Los datos vienen con decimales
# excesivos y necesitan ser normalizados mediante el logaritmo 
# en base 10 antes de ser reportados.
#
# Enunciado:
# 1. Crea un vector 'concentraciones' con los valores: 10, 100, 1000, 50, 200.
# 2. Utiliza la propiedad de vectorización para calcular el logaritmo 
#    en base 10 (log10) de todo el vector en una sola línea.
# 3. Sobre el resultado anterior, aplica la función round() para 
#    redondear todos los valores a 2 decimales de forma vectorizada.
# 4. Compara mentalmente: ¿sería más eficiente hacer esto con un 
#    bucle for o directamente sobre el vector?
#############################################################

# El estudiante debe completar a partir de aquí




# SOLUCIÓN

concentraciones <- c(10, 100, 1000, 50, 200)

log10(concentraciones)

round(log10(concentraciones), 2)

# directamente sobre el vector (menos código y más optimizado)

#############################################################
# EJERCICIO 2
# Contexto:
# Estás preparando las etiquetas para un set de muestras de ADN. 
# Tienes los nombres de los genes y sus códigos de identificación 
# en vectores separados y necesitas unirlos de forma masiva.
#
# Enunciado:
# 1. Crea el vector 'genes' <- c("BRCA1", "TP53", "MYC").
# 2. Crea el vector 'ids' <- c(101, 102, 103).
# 3. Usa la función paste() de forma vectorizada para crear un nuevo 
#    vector llamado 'etiquetas' que combine ambos (ej: "BRCA1-101"). 
#    Usa el argumento 'sep = "-"'.
# 4. Ahora, utiliza paste() con el argumento 'collapse = " | "' para 
#    convertir todo el vector 'etiquetas' en una sola cadena de texto.
# 5. Observa cómo cambia el comportamiento de la función al usar 'collapse'.
#############################################################

# El estudiante debe completar a partir de aquí




# SOLUCIÓN

genes <- c("BRCA1", "TP53", "MYC")
ids <- c(101, 102, 103)

etiquetas <- paste(genes, ids, sep = "-")

paste(etiquetas, collapse = " | ")




############################################################
# EJERCICIO 1
# Contexto: 
# Un hospital tiene una base de datos de pacientes con su temperatura. 
# Debes categorizarlos automáticamente para identificar casos de fiebre.
#
# Enunciado:
# 1. Crea un DataFrame llamado 'hospital' con dos columnas: 
#    'ID' (del 1 al 10) y 'Temperatura' (10 valores aleatorios entre 
#    36.0 y 39.0 usando runif).
# 2. Utiliza la función vectorizada ifelse() para crear una nueva 
#    columna llamada 'Estado'.
#    - Si la temperatura es >= 37.5, el estado será "Fiebre".
#    - De lo contrario, será "Normal".
# 3. Usa un bucle FOR para recorrer el dataframe e imprimir (print) 
#    el ID de cada paciente que tenga "Fiebre".
#############################################################

# El estudiante debe completar a partir de aquí




# SOLUCIÓN
set.seed(123) # Para que los valores aleatorios sean reproducibles
hospital <- data.frame(
  ID = 1:10,
  Temperatura = runif(10, min = 36.0, max = 39.0)
)


hospital$Estado <- ifelse(hospital$Temperatura >= 37.5, "Fiebre", "Normal")

print("Pacientes con Fiebre:")
for (i in 1:nrow(hospital)) {
  if (hospital$Estado[i] == "Fiebre") {
    print(paste("El paciente con ID", hospital$ID[i], "tiene fiebre."))
  }
}



############################################################
# EJERCICIO 2
# Contexto: 
# Un laboratorio de genética mide la pureza de 5 muestras en 4 rondas. 
# Las muestras con una media de pureza baja deben ser gestionadas.
#
# Enunciado:
# 1. Crea una matriz de 5 filas y 4 columnas con valores aleatorios 
#    entre 0.8 y 1.0 (usa runif). Conviértela a DataFrame con as.data.frame().
# 2. Asigna nombres a las columnas: "Ronda1", "Ronda2", "Ronda3", "Ronda4".
# 3. Crea una nueva columna llamada 'Media_Pureza' usando la función 
#    apply() sobre las filas (margin 1) calculando el promedio (mean).
# 4. Utiliza ifelse() anidados para crear la columna 'Resultado':
#    - Si Media_Pureza > 0.95, "Apto".
#    - Si está entre 0.90 y 0.95, "Revisar".
#    - Si es menor a 0.90, "Descartar".
#############################################################

# El estudiante debe completar a partir de aquí




# SOLUCIÓN
set.seed(456)
matriz_pureza <- matrix(runif(20, min = 0.8, max = 1.0), nrow = 5)
laboratorio <- as.data.frame(matriz_pureza)

colnames(laboratorio) <- c("Ronda1", "Ronda2", "Ronda3", "Ronda4")

laboratorio$Media_Pureza <- apply(laboratorio, 1, mean)

laboratorio$Resultado <- ifelse(laboratorio$Media_Pureza > 0.95, "Apto",
                                ifelse(laboratorio$Media_Pureza >= 0.90, "Revisar", "Descartar"))

# Ver resultado
print(laboratorio)



############################################################
# EJERCICIO 3
# Contexto: 
# Tienes un DataFrame con el conteo inicial de células de 5 cultivos. 
# Debes limpiar los nombres y simular el crecimiento final.
#
# Enunciado:
# 1. Crea el DataFrame con:
#    - Muestra: c("  cultivo_A ", " cultivo_B", "CULTIVO_C  ", "Cultivo_D", " cultivo_e ")
#    - Conteo_Inicial: c(100, 150, 200, 50, 300)
# 2. Vectorización: Limpia la columna 'Muestra' eliminando espacios en blanco 
#    (trimws) y convirtiendo a mayúsculas (toupper).
# 3. Simulación: Crea la columna 'Conteo_Final'. Para simplificar, asume que 
#    tras 3 horas de duplicación, el valor es Conteo_Inicial * (2^3). 
#    Hazlo de forma vectorizada.
# 4. Usa sapply() sobre la columna 'Conteo_Final' para calcular la raíz 
#    cuadrada de cada valor y guárdalo en una nueva columna llamada 'Indice'.
#############################################################

# El estudiante debe completar a partir de aquí




# SOLUCIÓN

cultivos <- data.frame(
  Muestra = c("  cultivo_A ", " cultivo_B", "CULTIVO_C  ", "Cultivo_D", " cultivo_e "),
  Conteo_Inicial = c(100, 150, 200, 50, 300)
)

cultivos$Muestra <- trimws(cultivos$Muestra)
cultivos$Muestra <- toupper(cultivos$Muestra)

cultivos$Conteo_Final <- cultivos$Conteo_Inicial * (2^3)

cultivos$Indice <- sapply(cultivos$Conteo_Final, sqrt)

print(cultivos)

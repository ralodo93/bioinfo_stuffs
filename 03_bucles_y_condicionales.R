## Bucles
# Permiten repetir un bloque de código varias veces, iterando sobre elementos o hasta que se cumpla una condición.

### Bucle for básico - contador
# Usamos in para definir el rango de valores
for (i in 1:5){ # al entrar en el bucle, i toma el valor 1, al terminar el bloque de código, vuelve arriba y toma el valor 2
  print(paste("Estamos en la vuelta número", i))
}

# Recorrer un vector numérico
numeros <- c(5,8,9,10)
for(numero in numeros){ # al entrar en el bucle, coge el primer elemento del vector, ejecuta el bloque de código y pasa al segundo elemento
  doble <- numero * 2
  print(paste("El doble de",numero,"es",doble))
}

# Recorrer un vector de texto
especies <- c("Roble", "Pino", "Encina", "Haya")
for (arbol in especies) {
  print(paste("Analizando muestra de:", arbol))
}

# Bucles Anidados
df_clinico <- data.frame(
  ID = c("P1", "P2", "P3"),
  Colesterol = c(180, 240, 210),
  Tension = c(110, 145, 130)
)

for (i in 1:nrow(df_clinico)){
  print(paste("Fila",i))
  for (j in 1:ncol(df_clinico)){
    print(paste("Columna",j))
    print(df_clinico[i,j])
  }
}

# Bucle while
# Útil cuando no sabemos cuántas vueltas exactas daremos

contador <- 1
while (contador <= 5) {
  print(paste("El contador vale:", contador))
  # ¡IMPORTANTE! Tenemos que cambiar el valor para que el bucle termine
  contador <- contador + 1 
}

## El ejemplo definitivo de WHILE: Lanzar el dado
# Objetivo: Lanzar un dado hasta que salga un 6
resultado <- 0
lanzamientos <- 0

while (resultado != 6) {
  lanzamientos <- lanzamientos + 1
  # Generamos un número aleatorio entre 1 y 6
  resultado <- sample(1:6, size = 1)
  print(paste("Lanzamiento", lanzamientos, ": Ha salido un", resultado))
}
print(paste("¡POR FIN! Hemos necesitado", lanzamientos, "intentos para sacar un 6."))

## Familia apply
# Son una serie de funciones (apply, sapply, lapply) que nos permiten sustituir los bucles para aplicar funciones concretas a dataframes, listas y vectores

# apply se usa para hacer alguna operación en las filas o columnas de un dataframe
# uso -> apply(X, MARGIN, FUN, ...)
# Donde X es una matrix o dataframe
# MARGIN es un valor de 1 o 2 que se usa para indicar si se va a aplicar en filas (1) o columnas (2)
# FUN es una función que vamos a usar
# ... argumentos adicionales de la función que se use
# Ejemplo: Quiero calcular la media de expresión de todos los genes de la tabla `pacientes`

# Mediante un for se haría:
medias_genes <- c() # creamos vector vacío
for (j in 2:ncol(pacientes)){
  medias_genes <- c(medias_genes, mean(as.numeric(pacientes[,j])))
}
medias_genes

# Mediante apply: apply(dataframe, 2, mean) -> 2 porque lo calculamos por columnas, mean porque calculamos la media
medias_genes <- apply(pacientes[,2:ncol(pacientes)], 2, mean)
medias_genes

sd_genes <- apply(pacientes[,2:ncol(pacientes)], 2, sd) # ahora calculamos la desviacion estandar
sd_genes

# lapply se usa para hacer operaciones con listas o vectores. IMPORTANTE: Devuelve una lista
# uso -> lapply(X, FUN, ...)
# X puede ser un vector o una lista
# FUN es una función
# ... argumentos adicionales de la función que se use
x <- list(a = 1:10, beta = exp(-3:3), logic = c(TRUE,FALSE,FALSE,TRUE)) # tenemos una lista de elementos
# a es un vector numérico de 1 a 10, beta es un vector numérico que calcula exp de -3 a 3 y logic es un vector lógico
lapply(x, mean) # calcula la media de los tres vectores que hay dentro de la lista. devuelve una lista

# sapply se usa para hacer operaciones con listas o vectores. IMPORTANTE: Devuelve un vector
# uso -> sapply(X, FUN, ...)
# X puede ser un vector o una lista
# FUN es una función
# ... argumentos adicionales de la función que se use
x <- list(a = 1:10, beta = exp(-3:3), logic = c(TRUE,FALSE,FALSE,TRUE)) # tenemos una lista de elementos
# a es un vector numérico de 1 a 10, beta es un vector numérico que calcula exp de -3 a 3 y logic es un vector lógico
sapply(x, mean) # calcula la media de los tres vectores que hay dentro de la lista. devuelve un vector



### Condicionales
## ¿Qué son?
# Se usan para tomar decisiones en el código, ejecutando diferentes bloques de código según se cumplan o no ciertas condiciones.

## IF -> Estructura básica. Implica que en caso de que se cumpla una condición, se ejecuta un bloque de código
edad <- 30
if (edad > 18){ # usar las llaves para indicar cuando se abre if (ALT Gr + símbolo de llave hacia la derecha)
  print("Adulto") # imprime un mensaje
} # Usar las llaves para indicar que se cierra un if (ALT Gr + símbolo hacia la izquierda)
# El bloque de código puede ser tan grande y complejo como sea necesario

## ELSE -> Implica que, en caso de no cumplirse la condición de un IF, ejecute un bloque de código
if(edad > 18){ #  Evalúa el if
  print("Adulto")
} else { # Si el if es FALSE, ejecuta lo que haya en else
  print("Menor")
}

# Podemos crear una variable dentro de if/else
concentracion <- 50 #ng/uL
if (concentracion > 20){
  estado <- "Correcto"
  print("Muestra lista para procesar")
} else{
  estado <- "Rechazado"
  print("Concentración demasiado baja")
}
estado

## ELSE IF -> Implica que, si no se cumple la condición de un IF, evalúa otra condición diferente
# Puede haber tantos else if como necesitemos
temp <- 25
if (temp > 30) { # si temp es mayor de 30 ejecuta este bloque
  print("Hace calor")
} else if (temp >= 15) { # sino, evalúa si es mayor o igual a 15, si es así ejecuta este bloque
  print("Clima agradable")
} else { # sino, ejecuta este bloque
  print("Hace frío")
}

nota <- 8.5
if (nota >= 9) { # Si la nota es mayor o igual a 9, ejecuta este bloque
  print("Sobresaliente")
} else if (nota >= 7) { # Si no, evalúa si es mayor o igual a 7, si es así ejecuta este bloque
  print("Notable")
} else if (nota >= 5) { # Si no, evalúa si es mayor o igual a 5, si es así ejecuta este bloque
  print("Aprobado")
} else { # Si no, ejecuta este bloque
  print("Suspenso")
}

## Uso de Operadores Lógicos. Condiciones múltiples
edad <- 25
tiene_carnet <- TRUE

# anidar condiciones puede ser bastante mala idea, desde el punto de vista de diseño
if (edad >= 18){
  if (tiene_carnet == TRUE){
    print("puede conducir")
  }
} else{
  print("no puede conducir")
}

# AND: Ambas deben ser TRUE -> & se escribe con SHIFT + 6
if (edad >= 18 & tiene_carnet == TRUE) { # Si edad es mayor o igual a 18 Y tiene carnet, ejecuta el bloque
  print("puede conducir")
} else{
  print("no puede conducir")
}

# OR: Al menos una debe ser TRUE -> | se escribe con ALT + 1
dia <- "Sábado"
if (dia == "Sábado" | dia == "Domingo") { # Si es sábado O domingo, ejecuta el bloque
  print("Es fin de semana")
}

## Ejemplo Complejo: ¿es laborable hoy?
dia_semana <- "Lunes"
festivo <- FALSE

# Utilizamos %in% para comprobar si un valor está en un conjunto de valores
if (dia_semana %in% c("Lunes", "Martes", "Miércoles", "Jueves", "Viernes") & festivo == FALSE) {
  print("Día laborable")
} else if (dia_semana %in% c("Sábado", "Domingo") | festivo == TRUE) {
  print("Día no laborable")
} else {
  print("Día desconocido")
}

## Uso de ifelse
# ifelse es una función vectorizada que permite evaluar condiciones en vectores de forma más eficiente.
# uso: ifelse(condición, valor_si_TRUE, valor_si_FALSE)
edad <- 30
categoria <- ifelse(edad >= 18, "Adulto", "Menor")
categoria
# También podemos incluir varias condiciones anidadas
categoria <- ifelse(edad > 18, "Adulto", ifelse(edad > 12, "Adolescente", "Niño"))
categoria






################################################################################
#              EJERCICIOS DE R: CONDICIONALES Y BUCLES                         #
################################################################################

### --- BLOQUE 1: CONDICIONALES (IF, ELSE, ELSE IF) --- ###

temperatura <- 18
# 1. Escribe un IF que imprima "Encender calefacción" si la temperatura es menor a 20.

nota <- 67
# 2. Si es mayor o igual a 50, imprime "Aprobado", de lo contrario (ELSE), imprime "Suspenso".

ph <- 8.5
# 3. Usa ELSE IF para imprimir:
#    - "Ácido" si ph < 7
#    - "Neutro" si ph == 7
#    - "Básico" si ph > 7

glucosa <- 85
# 4. Usa ELSE IF: 
#    - Si es < 70: "Hipoglucemia"
#    - Si está entre 70 y 100 (inclusive): "Normal"
#    - Si está entre 101 y 125: "Prediabetes"
#    - Si es > 125: "Diabetes"


### --- BLOQUE 2: OPERADORES LÓGICOS (&, |, %in%) --- ###

edad <- 20
tiene_entrada <- FALSE
# 5. Escribe un IF que use el operador AND (&) para imprimir "Puede pasar" 
#    solo si es mayor de 18 Y tiene entrada.

fruta <- "Pera"
# 6. Usa el operador OR (|) para comprobar si la variable 'fruta' es "Manzana" 
#    O "Pera". Si es alguna de las dos, imprime "Fruta disponible".

meses_invierno <- c("Diciembre","Enero","Febrero","Marzo")
mes_actual <- "Enero"
# 7. Usa %in% para comprobar si la variable 'mes_actual <- "Enero"' está en ese vector.


### --- BLOQUE 3: LA FUNCIÓN ifelse() --- ###
alturas <- c(1.6, 1.85, 1.7, 1.9)
# 8. Crea un vector 'estatura_tipo' que use ifelse() para marcar como "Alto" 
#    a los que midan más de 1.75 y "Bajo" al resto.

puntos <- c(4, 7, 9)
# 9. Usa un ifelse() anidado para clasificar el vector 'puntos' 
#    en "Bajo" (si <5), "Medio" (5-8) y "Alto" (>8).


### --- BLOQUE 4: BUCLES (FOR y WHILE) --- ###

# 10. Escribe un bucle FOR que imprima los números del 10 al 15.

animales <- c("Perro", "Gato", "Caballo")
# 11. Dado el vector 'animales', usa un FOR 
#     para imprimir "Amo a mi: [animal]".

contador <- 10
# 12. Crea un bucle WHILE que tenga un contador que empiece en 10 y baje 
#     de uno en uno hasta 0. Imprime cada número.

contador <- 0
# 13. [RETO] Usa sample(1:10, 1) dentro de un WHILE para generar números 
#     aleatorios hasta que salga el número 7. Cuenta cuántos intentos hicieron falta.


### --- BLOQUE 5: ANÁLISIS DE DATOS (DATA FRAMES + BUCLES) --- ###

# 14. Tienes este Data Frame de pacientes:
df_clinico <- data.frame(
  ID = c("P1", "P2", "P3"),
  Colesterol = c(180, 240, 210),
  Tension = c(110, 145, 130)
)

# 15. Crea un bucle FOR que recorra las filas de 'df_clinico'.
#     Si el Colesterol es > 200, imprime: "Paciente [ID] tiene riesgo alto".
#     De lo contrario, imprime: "Paciente [ID] tiene riesgo normal".

# 16. [AVANZADO] Usa un bucle FOR anidado para recorrer todas las celdas 
#     numéricas del data frame 'df_clinico' (columnas 2 y 3) e imprimir 
#     el valor de cada celda junto a su nombre de columna.

### --- BLOQUE 6: LA FAMILIA APPLY (PROGRAMACIÓN FUNCIONAL) --- ###

# 17. Usa la función apply() sobre 'df_clinico' para calcular la MEDIA de 
#     las columnas 2 y 3 (Colesterol y Tension) en una sola línea.
#     Pista: MARGIN = 2 indica que quieres operar sobre las columnas.

# 18. Dada la siguiente lista de temperaturas:
temps_ciudades <- list(Madrid = c(22, 25, 20), Barcelona = c(21, 23, 22))
#     a) Usa lapply() para encontrar el valor máximo de cada ciudad.
#     b) Usa sapply() para hacer lo mismo y observa la diferencia en el resultado.

################################################################################
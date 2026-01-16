### Bucles
## ¿Qué es un bucle?
# Es una estructura de control que permite repetir un bloque de código 
# varias veces mientras se cumpla una condición o se recorra una lista de elementos.

# Tipos de bucle:
# 1. for: Se usa cuando sabemos de antemano cuántas veces queremos repetir algo.
# 2. while: Se usa cuando queremos repetir algo mientras una condición sea cierta.
# 3. apply: Es la forma "estilo R" de hacer bucles, aplicando una función a toda una estructura.

## Bucle For

# Estructura
# for (variable in secuencia) { (ALT Gr + llave abierta) 
#   código a ejecutar 
# } (ALT Gr + llave cerrada)

# Uso básico (contador)
for (i in 1:5) { # se asigna el valor 1 a la variable i
  print(paste("Iteración número:", i)) # ejecuta código
} # asigna el siguiente valor y repite el proceso

# Recorrer vectores (número y texto)
numeros <- c(8, 10, 9, 5, 14)
for (numero in numeros){ # se asigna el valor del primer elemento de numeros, se ejecuta el código y se le asigna el valor del segundo elemento
  print(paste("Sacamos el número", numero))
}

frutas <- c("Manzana", "Pera", "Plátano")
for (fruta in frutas) {
  print(paste("Hoy toca comer:", fruta))
}


# Bucles anidados (Un bucle dentro de otro)
for (i in 1:2) { # se asigna el valor de 1 a i, se ejecuta código
  for (j in c("A", "B")) { # se asigna el primer elemento del vector a j
    cat("Fila:", i, "Columna:", j, "\n")  # se ejecuta codigo
  } # se asigna el siguiente elemento del vector a j y se repite el proceso (de j)
} # se asigna el valor 2 a i, se repite el proceso (de i)

# Ejemplo práctico
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

# Guardar resultados en un vector vacío
resultados <- c() # Creamos vector vacío
numeros <- c(2, 4, 6)
for (n in numeros) {
  calculo <- n ^ 2 # calcula n al cuadrado
  resultados <- c(resultados, calculo) # Vamos "llenando" el vector resultados
}
resultados

## Bucle While

# Estructura
# while (condición) { 
#   código a ejecutar 
# }

# Uso básico
contador <- 1
while (contador <= 5) {
  print(paste("El contador vale:", contador))
  contador <- contador + 1 # Importante: actualizar la condición
}

# Cuidado! No entrar en bucle infinito!
# Si la condición (contador <= 5) nunca dejara de ser cierta, 
# R se quedaría colgado para siempre. Asegúrate de que la condición cambie.
# Si alguna vez os pasa, pulsar el botón de stop (consola) o pulsar ESC

# En que momento querríamos usar un bucle while?
# Lanzamiento de dados
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
# En R es preferible usar la familia apply en lugar de bucles for, 
# ya que suelen ser más rápidos y el código es más limpio.

# Uso de apply - apply(X, MARGIN, FUN)
# X es la matriz o el dataframe
# MARGIN indica si se va a operar con filas o columnas. MARGIN=1 (filas), MARGIN=2 (columnas)
# FUN indica la función que se va a aplicar
matriz_ejemplo <- matrix(1:9, nrow = 3)
apply(matriz_ejemplo, 2, sum) # Suma de cada columna
apply(matriz_ejemplo, 2, mean) # Media de cada columna

# ¿Y como se haría con un for?
medias <- c()
for (i in 1:ncol(matriz_ejemplo)){
  valores <- matriz_ejemplo[,i]
  medias <- c(medias, mean(valores))
}
medias

# Uso de lapply - lapply(X, FUN, ...)
# La "l" viene de List. Devuelve siempre una LISTA.
temperaturas_ciudades <- list(
  Madrid = c(20, 22, 25, 21),
  Barcelona = c(18, 19),
  Sevilla = c(30, 32, 31, 29, 30)
)
# Queremos saber la temperatura media de cada ciudad.
# lapply nos devolverá una LISTA. Es útil si queremos mantener la estructura de lista.
medias_lista <- lapply(temperaturas_ciudades, mean)
medias_lista

# Uso de sapply - sapply(X, FUN, ...)
# La "s" viene de Simple. Intenta "simplificar" el resultado a un vector.
# Queremos lo mismo que antes, pero para crear una tabla o un gráfico rápido.
# sapply "simplifica" y nos devuelve un VECTOR con nombres.
medias_vector <- sapply(temperaturas_ciudades, mean)
medias_vector

## ¿Cuándo usar cada uno?
# - Usa lapply si el resultado de tu función es complejo (por ejemplo, si la función 
#   devuelve un dataframe o un modelo entero).
# - Usa sapply si sabes que el resultado de la función es un solo número o un solo 
#   texto y quieres un vector limpio.


### EJERCICIOS: BUCLES

## -- SECCIÓN 1: BUCLES FOR Y WHILE --

# 1. Crea un bucle 'for' que recorra los números del 1 al 10 
# e imprima el cuadrado de cada número.


# 2. Crea un vector vacío llamado 'dobles'. 
# Usa un bucle 'for' para recorrer el vector c(1, 5, 10) y 
# guarda el doble de cada número en el vector 'dobles'.


# 3. Usa un bucle 'while' para simular tiradas de dados. Tienes dos dados de 6 caras. Cada vez
# lanzas los dos dados y sumas su valor hasta que el valor total sea mayor de 10



## -- SECCIÓN 2: FAMILIA APPLY --

# 4. Dada la siguiente matriz:
mi_matriz <- matrix(1:12, nrow = 4, ncol = 3)

# A) Usa apply() para calcular el valor máximo de cada FILA.
# B) Usa apply() para calcular la suma de cada COLUMNA.


# 5. Dada la siguiente lista de nombres:
empleados <- list(comercial = "ana", tecnico = "luis", gerencia = "pedro")

# A) Usa lapply() para poner todos los nombres en mayúsculas (toupper).
# B) Usa sapply() para hacer lo mismo. ¿Qué diferencia ves en el resultado?



## -- SECCIÓN 3: RETO COMBINADO --

# 6. Tienes este vector:
puntuaciones <- c(15, 8, 12, 19, 5)

# Crea un bucle 'for' que recorra 'puntuaciones'. 
# Si el número es mayor o igual a 10, imprime "Aprobado". 
# Si es menor, imprime "Suspenso".



### Condicionales
## ¿Qué son?
# Son estructuras que permiten al código tomar decisiones. 
# El código se ejecuta solo SI se cumple una condición lógica (TRUE).

## IF (Y si ocurre algo?)
# Evalúa una condición. Si es TRUE, ejecuta el código entre llaves {}.
# Si es FALSE, no hace nada y sigue adelante.
nota <- 8
if (nota >= 5) { # como esto es TRUE, entra en el código entre llaves y lo ejecuta
  print("¡Aprobado!")
}

nota <- 4
if (nota >= 5) { # como esto no es TRUE, lo ignora y salta el bloque de código
  print("¡Aprobado!")
}

# Operadores lógicos (Recordatorio)
# > (mayor), < (menor), >= (mayor o igual), <= (menor o igual)
# == (exactamente igual), != (diferente de)
# %in% (¿Está este elemento dentro de este grupo?)
fruta <- "Pera"
if (fruta %in% c("Manzana", "Pera", "Plátano")) {
  print("Tenemos esa fruta en stock")
}


## Operadores Booleanos (AND y OR)
# Se usan para combinar varias condiciones en un solo IF.
# & (AND): Ambas condiciones deben ser TRUE.
# | (OR): Al menos una condición debe ser TRUE.
edad <- 20
tiene_entrada <- TRUE

if (edad >= 18 & tiene_entrada == TRUE) { # Ya que ambas son TRUE, entra en las llaves
  print("Puedes entrar al concierto")
}

if (edad < 18 | tiene_entrada == TRUE) { # Ya que al menos una de ellas es TRUE, entra en las llaves
  print("Puedes entrar al concierto")
}

## ELSE (Y si no?)
# Se usa después de un IF para indicar qué hacer cuando la condición es FALSE.
nota <- 4
if (nota >= 5) {
  print("Aprobado")
} else {
  print("Suspenso")
}

## ELSE IF (múltiples condicionales)
# Permite encadenar varias condiciones en orden. Solo se ejecuta la primera que sea TRUE.
nota <- 7
if (nota >= 9) {
  print("Sobresaliente")
} else if (nota >= 7) {
  print("Notable")
} else if (nota >= 5){
  print("Aprobado")
} else{
  print("Suspenso")
}

### ifelse() 

# Es una función vectorizada (más rápida y compacta que el IF normal).
# Estructura: ifelse(condición, valor_si_true, valor_si_false)

## Aplicado a variables de un elemento
resultado <- ifelse(10 > 5, "Mayor", "Menor")
resultado

## Aplicado a vectores
# Muy útil para crear columnas nuevas en dataframes basadas en condiciones.
edades <- c(15, 20, 12, 30)
categoria <- ifelse(edades >= 18, "Adulto", "Menor")
categoria

## ifelse anidados
# Se usa para más de dos categorías dentro de la función.
puntos <- c(5, 15, 25)
resultado <- ifelse(puntos > 20, "Alto", 
                    ifelse(puntos > 10, "Medio", "Bajo"))
resultado

### EJERCICIOS: CONDICIONALES EN R (5 MINUTOS)

## -- SECCIÓN 1: IF / ELSE / ELSE IF --

# 1. Escribe un IF que imprima "Hace calor" si la temperatura es mayor a 30.
temperatura <- 32

# 2. Escribe un IF/ELSE que imprima "Es hora de comer" si la hora está entre 14 y 15 (inclusive), 
# y si no, que imprima "Aún no es hora".
hora <- 14


# 3. Mejora el sistema de notas:
# Si 'nota' es 10: "Matrícula"
# Si 'nota' es entre 9 y 9.9: "Sobresaliente"
# Si 'nota' es entre 7 y 8.9: "Notable"
# Si 'nota' es entre 5 y 6.9: "Aprobado
# Si 'nota' es menor a 5: "Suspenso"
nota <- 5.7



## -- SECCIÓN 2: OPERADORES BOOLEANOS (& y |) --

# 4. Escribe un IF que imprima "Acceso concedido" solo si el usuario 
# está registrado Y es mayor de 18 años. Si no, "Acceso denegado".
usuario_registrado <- TRUE
edad <- 16

# 5. Escribe un IF que imprima "¡A descansar!" si el día es "Sábado" O "Domingo".
dia <- "Sábado"


## -- SECCIÓN 3: FUNCIÓN IFELSE() --

# 6. Dado este vector de velocidades de coches:
velocidades <- c(40, 130, 90, 150, 50)

# A) Crea un vector 'multa' que diga "SI" si la velocidad es mayor a 120, y "NO" si no.


# B) Usa un ifelse() anidado para clasificar las velocidades:
# > 120: "Exceso"
# 80-120: "Normal"
# < 80: "Lento"


### Ejemplos Complejos: Bucles + Condicionales

## Ejemplo 1: Clasificación de datos en un bucle (Simple)
# Objetivo: Recorrer un vector de stock y avisar si hay que reponer.
inventario <- c(15, 3, 8, 0, 12)
for (item in inventario) {
  if (item == 0) {
    print("CRÍTICO: Agotado")
  } else if (item < 5) {
    print("AVISO: Stock bajo")
  } else {
    print("OK: Stock suficiente")
  }
}

# BONUS: Hazlo con un ifelse()

## Ejemplo 2: Filtrado y acumulación (Intermedio)
# Objetivo: Sumar solo los números positivos de una lista y contar cuántos hay.
valores <- c(10, -5, 20, -2, 30, -8)
suma_positivos <- 0
contador <- 0

for (v in valores) {
  if (v > 0) {
    suma_positivos <- suma_positivos + v
    contador <- contador + 1
  }
}
cat("Total positivos:", suma_positivos, " | Cantidad:", contador)

# Sin embargo esto no se puede hacer con ifelse, ni con apply (al menos aún no hemos aprendido a hacerlo)

## Ejemplo 3: Bucle While con lógica de parada (Avanzado)
# Objetivo: Simular una cuenta bancaria que va restando gastos aleatorios 
# hasta que el saldo baja de un límite.
saldo <- 100
transacciones <- 0

while (saldo > 20) {
  gasto <- sample(5:15, 1) # Gasto aleatorio entre 5 y 15
  saldo <- saldo - gasto
  transacciones <- transacciones + 1
  print(paste("Gasto de", gasto, "| Saldo restante:", saldo))
}
print(paste("Se han realizado", transacciones, "transacciones antes de llegar al límite."))

## Ejemplo 4: Bucle anidado con condicionales (Complejo)
# Objetivo: Analizar una matriz de calificaciones de alumnos y detectar quién ha suspendido.
# Filas = Alumnos, Columnas = Exámenes
notas_clase <- matrix(c(8, 4, 7, 3, 9, 2), nrow = 3, ncol = 2)
colnames(notas_clase) <- c("Examen_1", "Examen_2")

for (i in 1:nrow(notas_clase)) {
  for (j in 1:ncol(notas_clase)) {
    nota_actual <- notas_clase[i, j]
    if (nota_actual < 5) {
      cat("Alerta: El Alumno", i, "ha suspendido el", colnames(notas_clase)[j], "\n")
    }
  }
}


## -- EJERCICIO 1 (Basado en Ejemplo 1) --
#  Crea un bucle que recorra el vector edades e imprima:
# "Menor" si es < 18, "Adulto" si está entre 18 y 64, y "Jubilado" si es >= 65.
edades <- c(12, 18, 25, 65, 70, 15)


## -- EJERCICIO 2 (Basado en Ejemplo 2) --
# Calcula mediante un bucle la suma total de las ventas, pero solo de aquellas 
# que sean superiores a 150.
ventas <- c(100, 250, 50, 400, 120)

## -- EJERCICIO 3 (Basado en Ejemplo 3) --
# Simula un termómetro que empieza en 20 grados. 
# Mientras la temperatura sea menor a 30, suma un número aleatorio entre 1 y 3 
# (usa sample(1:3, 1)). Imprime la temperatura en cada paso.
temperatura <- 20


## -- EJERCICIO 4 (Basado en Ejemplo 4) --
# Usa un bucle anidado para imprimir: "Ciudad en fila [i] y columna [j] es [Nombre]".
ciudades <- matrix(c("Madrid", "Barcelona", "Sevilla", "Valencia"), nrow = 2)

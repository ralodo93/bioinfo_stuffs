# Condicionales ----
## IF / ELSE / ELSE IF ----
# Estructura formada por 3 Elementos. IF (SIEMPRE SE USA), ELSE y ELSE IF

### IF ----
# La estructura de control IF consiste en que, siempre que se cumpla una condición
# se ejecuta el código que hay entre las llaves
# Es la estructura que SIEMPRE se usa
# if (condición entre paréntesis) {bloque de código entre llaves}

edad <- 30
if (edad >= 18) { # si la edad es mayor o igual que 18 --> se ejecuta el código entre llaves; sino se cumple no hace nada
  print(paste("Tienes",edad,"años; puedes conducir.")) # cuando usamos una estructura de control y queremos obtener un mensaje debemos usar print
}


### ELSE ----
# La estructura else se utiliza para cuando queremos hacer algo cuando las condiciones que se plantean no se cumplen
# No siempre se debe usar, pero SIEMPRE debe ir acompañando a un if, un else solo da error
# if (condición entre paréntesis) {bloque de código entre llaves} else {bloque de código entre llaves}

edad <- 15
if (edad >= 18) { # solo se ejecuta cuando edad es mayor de 18
  print(paste("Tienes",edad,"años; puedes conducir."))
} else{ # sino se ejecuta esto
  print(paste("Tienes",edad,"años; no puedes conducir."))
}

### ELSE IF ----
# La estructura else if se utiliza para cuando queremos plantear condiciones alternativas al if, sin necesidad de caer en un else
# No siempre se debe usar, pero SIEMPRE debe ir acompañando a un if
# if (condición entre paréntesis) {bloque de código entre llaves} else if (condicion entre paréntesis) {bloque de código entre llaves}

edad <- 20
carnet <- FALSE
if (edad >= 18 & carnet == TRUE) { # solo se ejecuta cuando edad es mayor de 18 y carnet es TRUE
  print(paste("Tienes",edad,"años y carnet de conducir; puedes conducir."))
} else if (edad >= 18 & carnet == FALSE) { # si el IF es FALSE, evaúa este else if
  print(paste("Tienes",edad,"años pero no tienes carnet; no puedes conducir."))
} else { # sino se ejecuta esto
  print(paste("Tienes",edad,"años; no puedes conducir."))
}


### Anidación de Condicionales ----
# Podemos incluir estructuras IF / ELSE / ELSE IF dentro de una estructura IF / ELSE / ELSE IF. Es como un árbol de decisiones
# Si pasa el primer IF, y dentro de su bloque hay otro IF, también lo evaluará. De este modo podemos llegar a plantear condiciones
# muy específicas.

# EXTRA: con un IF/ELSE/ELSE IF podemos crear variables para darles un valor diferente dependiendo de las condiciones

tipo_envio <- "Nacional"
prioridad <- "Urgente"

if (tipo_envio == "Nacional") {
  # Primer nivel de anidación: Si es Nacional, ahora evalúa si es Urgente
  if (prioridad == "Urgente") {
    # creamos variable coste y entrega y le damos valores diferentes dependiendo de las condiciones
    coste <- 10 
    entrega <- 1
  } else {
    coste <- 5
    entrega <- 3
  }
} else {
  # Segundo nivel de anidación: Si es Internacional, ahora evalúa si es Urgente
  if (prioridad == "Urgente") {
    coste <- 30
    entrega <- 2
  } else {
    coste <- 20
    entrega <- 7
  }
}
paste("Coste:", coste,"euros (Entrega en", entrega, "días)")

############################################################
# EJERCICIO 1
# Contexto:
# Un laboratorio clínico automatiza el triaje de pacientes según su nivel 
# de glucosa en sangre (mg/dL). Se establecen tres categorías: Hipoglucemia 
# (menor a 70), Normal (70 a 100 inclusive) e Hiperglucemia (mayor a 100).
#
# Enunciado:
# 1. Crea una variable 'glucosa_paciente' con el valor 105.
# 2. Escribe una estructura if / else if / else que:
#    - Si la glucosa es menor a 70, imprima: "Alerta: Hipoglucemia".
#    - Si la glucosa está entre 70 y 100 (usa &), imprima: "Nivel Normal".
#    - Para cualquier otro caso (mayor a 100), imprima: "Alerta: Hiperglucemia".
############################################################

# El estudiante debe completar a partir de aquí:



# SOLUCIÓN

glucosa_paciente <- 105

if (glucosa_paciente < 70){
  print("ALERTA: Hipoglucemia")
} else if (glucosa_paciente > 70 & glucosa_paciente < 100){
  print("Normal")
} else{
  print("ALERTA: Hiperglucemia")
}


############################################################
# EJERCICIO 2
# Contexto:
# Un sistema de monitorización fetal evalúa la frecuencia cardíaca (latidos 
# por minuto) y el movimiento. Si la frecuencia es baja (menor a 110), 
# se considera bradicardia. Si además no hay movimiento, es una emergencia.
#
# Enunciado:
# 1. Define 'frecuencia' <- 105 y 'movimiento' <- FALSE.
# 2. Crea una estructura anidada:
#    - El primer nivel (if) debe comprobar si 'frecuencia' < 110.
#    - Dentro de ese bloque, usa otro if/else para evaluar 'movimiento'.
#    - Si movimiento es FALSE, imprime "EMERGENCIA: Bradicardia sin movimiento".
#    - Si movimiento es TRUE, imprime "Vigilancia: Bradicardia moderada".
#    - Si la frecuencia NO es menor a 110, el 'else' principal debe 
#      imprimir "Signos estables".
############################################################

# El estudiante debe completar a partir de aquí:



# SOLUCIÓN

frecuencia <- 105
movimiento <- FALSE

if (frecuencia < 110){
  if (movimiento == FALSE){
    print("EMERGENCIA: Bradicardia sin movimiento")
  } else{
    print("Vigilancia: Bradicardia moderada")
  }
} else{
  print("Signos Estables")
}


############################################################
# EJERCICIO 3
# Contexto:
# Estás procesando un lote de muestras de tejido. La variable 'muestra' 
# puede contener un código de texto, un valor NA (si se perdió) o ser NULL. 
# Debes crear una variable 'estado_procesamiento' que dependa de esto.
#
# Enunciado:
# 1. Crea la variable 'muestra' con el valor "BIO-99".
# 2. Escribe un condicional que use las funciones is.null() e is.na():
#    - Si la muestra es NULL, 'estado_procesamiento' será "Error: No existe".
#    - Si la muestra es NA, 'estado_procesamiento' será "Pendiente de recibir".
#    - Si la muestra es de tipo character (is.character), 'estado_procesamiento' 
#      será "Muestra lista para análisis".
# 3. Al final, imprime el valor de 'estado_procesamiento' usando print().
############################################################

# El estudiante debe completar a partir de aquí:



# SOLUCIÓN

muestra <- "BIO-99"
estado_procesamiendo <- ""

if (is.null(muestra)){
  estado_procesamiendo <- "Error: No existe"
} else if (is.na(muestra)){
  estado_procesamiendo <- "Pendiente de recibir"
} else if (is.character(muestra)){
  estado_procesamiendo <- "Muestra lista para el análisis"
}

print(estado_procesamiendo)

############################################################

## ifelse() ----
# La función ifelse se usa para evaluar de forma ágil y en una sola línea de código (por lo general) una estructura IF/ELSE

### Estructura ----

# ifelse(condición, resultado si se cumple (resultado1), resultado si no se cumple (resultado2))

# Simulemos el uso de la función abs()
num <- -5
ifelse(num < 0, -num, num) # si num es menor de 0, devuelve el resultado1, sino devuelve el resultado2

# La única limitación de ifelse con respecto a if/else/else if es que solo se puede devolver una variable


### Anidar ifelse() ----
# Podemos incoporar varios ifelse anidados, de forma que se comporte como un if/else/else if
edad <- 20
carnet <- FALSE
ifelse(edad >= 18 & carnet == TRUE, "Es mayor de edad y tiene carnet, puede conducir", # resultado1
       # en el resultado2 incorporamos un ifelse()
       ifelse(edad >= 18 & carnet == FALSE, "Es mayor de edad pero no tiene carnet, no puede conducir", #resultado2 -> resultado1 
              "No es mayor de edad, no puede conducir")) #resultado2 -> resultado2


############################################################
# EJERCICIO 1
# Contexto:
# Un software de bioestadística debe asignar etiquetas rápidas a una serie 
# de mediciones de pH obtenidas de muestras de suelo. El pH neutro es 7. 
# Valores por debajo de 7 son "Ácido", valores por encima son "Básico" 
# y exactamente 7 es "Neutro".
#
# Enunciado:
# 1. Crea una variable 'ph_medido' con el valor 7.
# 2. Utiliza una única estructura de funciones ifelse() anidadas para:
#    - Si 'ph_medido' es menor a 7, asignar el texto "Ácido".
#    - Si 'ph_medido' es mayor a 7, asignar el texto "Básico".
#    - Si no es ninguna de las anteriores (es decir, es 7), asignar "Neutro".
# 3. Guarda el resultado en una variable llamada 'clasificación' y 
#    muéstrala por consola.
############################################################

# El estudiante debe completar a partir de aquí:



# SOLUCIÓN

ph_medido <- 7

clasificacion <- ifelse(ph_medido < 7, "Ácido", 
                        ifelse(ph_medido > 7, "Básico", "Neutro"))

clasificacion

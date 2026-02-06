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


#==============================================================================#
# EJERCICIOS DE REPASO
#==============================================================================#

# EJERCICIO 1. Gestión de estrés térmico en corales.
# Contexto: Los arrecifes de coral sufren blanqueamiento cuando la temperatura 
# del agua supera un umbral crítico. Debes crear un sistema que evalúe la 
# temperatura superficial del mar (TSM) y una variable booleana de radiación 
# UV alta para determinar el riesgo de blanqueamiento.
# Requisitos:
# - Si TSM > 30°C y radiación es TRUE: "Riesgo extremo: Blanqueamiento inminente".
# - Si TSM > 30°C pero radiación es FALSE: "Riesgo alto: Monitorización diaria".
# - Si TSM está entre 27°C y 30°C (inclusive): "Riesgo moderado".
# - En cualquier otro caso: "Condiciones estables".


# SOLUCIÓN
tsm <- 30.5
uv_alta <- TRUE

if (tsm > 30 & uv_alta == TRUE) {
  print("Riesgo extremo: Blanqueamiento inminente")
} else if (tsm > 30 & uv_alta == FALSE) {
  print("Riesgo alto: Monitorización diaria")
} else if (tsm >= 27 & tsm <= 30) {
  print("Riesgo moderado")
} else {
  print("Condiciones estables")
}


# ------------------------------------------------------------------------------

# EJERCICIO 2. Clasificación de especies según Categorías de la UICN (Anidado).
# Contexto: Un equipo de botánica está evaluando el estado de una planta endémica.
# Se basa en el número de individuos maduros y el declive poblacional.
# Requisitos: 
# Usa estructuras anidadas (IF dentro de IF) para asignar el "Estatus":
# 1. Si el número de individuos es < 250:
#    - Si el declive es > 20%: Estatus = "En Peligro Crítico (CR)"
#    - Si el declive es <= 20%: Estatus = "En Peligro (EN)"
# 2. Si el número de individuos es >= 250:
#    - Si el declive es > 10%: Estatus = "Vulnerable (VU)"
#    - Si el declive es <= 10%: Estatus = "Preocupación Menor (LC)"


# SOLUCIÓN
individuos <- 180
declive <- 25
estatus <- ""

if (individuos < 250) {
  if (declive > 20) {
    estatus <- "En Peligro Crítico (CR)"
  } else {
    estatus <- "En Peligro (EN)"
  }
} else {
  if (declive > 10) {
    estatus <- "Vulnerable (VU)"
  } else {
    estatus <- "Preocupación Menor (LC)"
  }
}
paste("Resultado de la evaluación:", estatus)


# ------------------------------------------------------------------------------

# EJERCICIO 3. Análisis rápido de calidad del agua con ifelse().
# Contexto: Tienes un sensor que mide el oxígeno disuelto (OD) en un río (mg/L).
# Necesitas categorizar rápidamente la calidad del agua para un informe técnico.
# Requisitos:
# Utiliza funciones ifelse() anidadas para devolver una única cadena de texto:
# - OD < 2: "Anoxia/Hipoxia severa"
# - OD entre 2 y 5 (sin incluir 5): "Calidad pobre"
# - OD entre 5 y 8 (sin incluir 8): "Calidad aceptable"
# - OD >= 8: "Calidad excelente"


# SOLUCIÓN
oxigeno_disuelto <- 4.2

resultado_calidad <- ifelse(oxigeno_disuelto < 2, "Anoxia/Hipoxia severa",
                            ifelse(oxigeno_disuelto < 5, "Calidad pobre",
                                   ifelse(oxigeno_disuelto < 8, "Calidad aceptable", 
                                          "Calidad excelente")))

print(resultado_calidad)
# Los condicionales se usan para elegir que hacer en caso de que haya varias probabilidades. 
# Por ejemplo: si hace frío → no sales de casa; si has comida pizza → mañana haces deporte

# Son básicos a la hora de fabricar un script ya que no siempre vamos a ejecutar el mismo código, 
# va a depender de los datos de entrada que tengamos.

# Dentro de las estructuras control de condicionales, las más conocidas son los if/else/else if statement, 
# pero también usaremos una función llamada ifelse que puede ser muy eficaz

### IF / ELSE / ELSE IF

# La estructura básica de este condicional es solo usar IF.
# La estructura de un if consiste en que; siempre que se cumpla una condición
# se ejecuta el código que hay entre las llaves

edad <- 30
if (edad >= 18){ # solo se ejecuta cuando edad es mayor de 30
  print(paste("Tienes",edad,"años; puedes conducir."))
}

# Si queremos llevar a cabo otra operación en caso de que la condición no se cumpla, usaremos ELSE

edad <- 15
if (edad >= 18){ # solo se ejecuta cuando edad es mayor de 30
  print(paste("Tienes",edad,"años; puedes conducir."))
} else{ # sino se ejecuta esto
  print(paste("Tienes",edad,"años; no puedes conducir."))
}

# Si queremos añadir más condicionales usaremos ELSE IF

edad <- 17
if (edad >= 18){ # solo se ejecuta cuando edad es mayor de 30
  print(paste("Tienes",edad,"años; puedes conducir."))
} else if(edad == 17){ # sino se cumple el if, se evalúa el else if
  print(paste("Tienes",edad,"años; el año que viene podrás conducir"))
} else{ # sino se cumple ninguno de los dos, se ejecuta esto
  print(paste("Tienes",edad,"años; no puedes conducir."))
}


## Anidación de IF / ELSE

# Podemos incluir estructuras IF / ELSE / ELSE IF dentro de una estructura IF / ELSE / ELSE IF

edad <- 30
tiene_carnet <- FALSE

if (edad >= 18){ # solo se ejecuta cuando edad es mayor de 30
  if (tiene_carnet == TRUE){ # solo se ejecuta si tiene_carnet es TRUE
    print(paste("Tienes",edad,"años y tienes carnet; puedes conducir."))
  } else{ # sino, ejecuta esto
    print(paste("Tienes",edad,"años pero no tienes carnet; no puedes conducir."))
  }
} else if(edad == 17){ # sino se cumple el if, se evalúa el else if
  print(paste("Tienes",edad,"años; el año que viene podrás conducir"))
} else{ # sino se cumple ninguno de los dos, se ejecuta esto
  print(paste("Tienes",edad,"años; no puedes conducir."))
}

# Las condiciones de una estructura IF / ELSE / ELSE IF pueden ser tan complejas como sea necesario
# aplicando operadores lógicos como AND y OR como vimos anteriormente

edad <- 30
tiene_carnet <- TRUE
if (edad >= 18 & tiene_carnet == TRUE){
  print("Puede conducir")
} else{
  print("No puede conducir")
}

# Se pueden incorporar dentro de una función

puede_conducir <- function(edad, tiene_carnet){
  if (edad >= 18 & tiene_carnet == TRUE){
    resultado <- "Puede conducir"
  } else{
    resultado <- "No puede conducir"
  }
  return(resultado)
}

puede_conducir(25, TRUE)
puede_conducir(17, TRUE)

# MiniReto:

# 1. Crea una función llamada 'validar_acceso' que reciba: 'usuario', 'password' y 'tiene_permiso_admin'
validar_acceso <- function(usuario, password, tiene_permiso_admin) {
  
  # PASO A: Si el password es igual a "1234", imprimir "Password demasiado débil"
  # PASO B: Si el usuario es "admin" Y tiene_permiso_admin es TRUE, imprimir "Acceso total concedido"
  # PASO C: Si el usuario NO es "admin" pero el password es correcto (puedes inventar uno, ej: "R_Rocks"), imprimir "Acceso limitado concedido"
  # PASO D: En cualquier otro caso, imprimir "Acceso denegado"
  
  # Escribe aquí tu estructura IF / ELSE IF / ELSE
  # No es necesario un Return
  
}

# 2. Prueba tu función con estos casos:
validar_acceso("admin", "1234", TRUE)
validar_acceso("admin", "R_Rocks", TRUE)
validar_acceso("pepe", "R_Rocks", FALSE)
validar_acceso("hacker", "password123", FALSE)


### ifelse()

# En este caso se trata de una función de R base que funciona similar a la función IF de excel y otras herramientas de software similares.

#La estructura es la siguiente: ifelse(condicion, valor_verdadero, valor_falso)

#De tal forma que para establecer condiciones simples y no demasiado anidadas es ideal para tener un flujo de control en una sola línea de código.

# (condición, valor si la condición en TRUE, valor si la condición es FALSE)
edad <- 30
ifelse(edad < 18, "No puede conducir", "Puede conducir")

# Se puede aplicar a vectores
edades <- 15:20
ifelse(edades < 18, "No puede conducir", "Puede conducir")

# Se pueden usar condiciones compuestas
edad <- 30
tiene_carnet <- FALSE
ifelse(edad < 18 | tiene_carnet == FALSE, "No puede conducir", "Puede conducir")

# Podemos anidar varios ifelse()
edad <- 30
tiene_carnet <- FALSE
ifelse(edad >= 18, 
       ifelse(tiene_carnet == TRUE, "Puede conducir", "No tiene carnet"), # este ifelse estaría anidado
       "No tiene la edad")


# MiniReto
# Contexto: Tienes un listado de temperaturas de varios sensores en una fábrica. 
# Tu objetivo es categorizarlas rápidamente sin usar bucles for, solo ifelse().

# Datos de entrada:
temperaturas <- c(15, 22, 35, 10, 42, 28)

# 1. Crea un vector llamado 'estado_basico' que:
#    - Si la temperatura es mayor o igual a 30, devuelva "Caliente"
#    - De lo contrario, devuelva "Normal"
# Tu código aquí:



# 2. Crea un vector llamado 'alerta_critica' usando condiciones compuestas:
#    - Si la temperatura es menor de 15 O mayor de 40, devuelva "ALERTA"
#    - De lo contrario, devuelva "OK"
# Tu código aquí:


### EJERCICIOS PRÁCTICOS: CONDICIONALES EN R ###

# 1. IF / ELSE: Verificador de Temperatura
# Crea una variable 'temp'. Si es mayor a 30, imprime "Hace calor".
# Si es menor o igual a 30, imprime "Temperatura agradable".
temp <- 25
# Tu código aquí:



# 2. ELSE IF: Sistema de Calificaciones
# Crea una variable 'nota'. 
# - Si la nota es 9 o más, imprime "Sobresaliente"
# - Si la nota es entre 5 y 8.9, imprime "Aprobado"
# - Si es menor de 5, imprime "Suspenso"
nota <- 7.5
# Tu código aquí:



# 3. IF / ELSE ANIDADO: Control de Inventario
# Tienes dos variables: 'stock' (cantidad) y 'producto_activo' (TRUE/FALSE).
# - Si el producto está activo:
#     * Si hay stock > 0, imprime "Disponible para la venta"
#     * Si hay stock == 0, imprime "Agotado temporalmente"
# - Si NO está activo, imprime "Producto descatalogado"
stock <- 10
producto_activo <- TRUE
# Tu código aquí:



# 4. Función ifelse(): Clasificación de Velocidad (Vectorizada)
# Usa la función ifelse() para crear un nuevo vector llamado 'estado_trafico'
# basándote en el vector 'velocidades'.
# Si la velocidad es mayor a 120, el estado es "Multa", de lo contrario "OK".
velocidades <- c(100, 130, 115, 150, 90)
# Tu código aquí:



# 5. RETO COMBINADO: Función con Lógica Compleja
# Crea una función llamada 'evaluar_descuento' que reciba 'precio' y 'es_socio'.
# - Si es_socio es TRUE Y el precio es mayor de 100, el descuento es del 20%.
# - Si es_socio es TRUE pero el precio es 100 o menos, el descuento es del 10%.
# - Si es_socio es FALSE, el descuento es del 0%.
# La función debe imprimir: "Tu descuento es del X%"

evaluar_descuento <- function(precio, es_socio) {
  # Escribe tu lógica aquí
}

# Pruebas:
evaluar_descuento(150, TRUE)
evaluar_descuento(50, TRUE)
evaluar_descuento(200, FALSE)

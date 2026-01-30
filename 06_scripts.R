#### Scripts ####

# El último paso que tenemos que entender en el flujo de trabajo de un programa de R son las estructuras de control.
# Hemos aprendido a crear funciones y variables, pero no hemos establecido un script completo que aplique técnicas de automatización
# de lógica que lo haga totalmente funcional. Las estructuras de control son son construcciones sintácticas que permiten controlar el orden 
# en que se ejecutan las instrucciones de un programa. Se dividen principalmente en dos: condicionales (ejecutan código solo si se cumple una condición)
# y bucles o iteraciones (repiten un bloque de código varias veces).


### Condicionales ###

## Concepto ##
# Es una estructura de control que evalúa una condición (o varias) ejecutando un bloque de código siempre que se cumpla.
# De igual forma que un programa informático, nuestra vida está llena de condicionales: si llueva, coge un paragüas; si tienes hambre, come.

## IF / ELSE / ELSE IF ##
# La estructura condicional básica es el llamado IF / ELSE / ELSE IF statement. Veamos la estructura y como funciona cada elemento

# IF #
# Se trata del elemento necesario para este tipo de estructuras. Indica que, si se cumple una condición, se ejecuta un código que hay entre llaves
edad <- 25
if (edad > 18){
  print("Puede conducir")
}

# ELSE #
# Es el contrario al IF; dependiendo de la situación puede o no usarse, pero de usarse siempre va acompañando a un IF. 
# Indica que, si no se cumple todo lo anterior, ejecuta un bloque de código
edad <- 25
if (edad > 18){
  print("Puede conducir")
} else{
  print("No puede conducir")
}

# ELSE IF #
# Es el intermedio entre IF y ELSE; dependiendo de la situación puede usarse o no, pero de usarse siempre debe ir acompañado de un IF y un ELSE.
# Indica que si el IF no se cumple, propone otra condición, la cual si se cumple, se ejecuta el código
edad <- 25
tiene_carnet <- FALSE

if (edad >= 18 & tiene_carnet == TRUE){
  print("Puede conducir")
} else if (edad >= 18 & tiene_carnet == FALSE){
  print("Tiene que sacarse el carnet de conducir")
} else{
  print("No puede conducir")
}

# IMPORTANTE -> El uso de IF / ELSE / ELSE IF NO está vectorizado, la condición por la que entra o no debe tener una longitud de 1.
# El siguiente código da error, y si vemos el error que da, nos dice que "condition has length > 1"
edad <- c(20, 30)
if (edad > 15){
  print("Es mayor de 15")
}


# MINIRETO: 
# 1. Crea un IF en el que compruebe si el precio es menor de 50, si es así imprime un mensaje diciendo que comprarás el producto
# 2. Añade un ELSE en el que imprima por pantalla que no comprarás el producto
# 3. Añade un ELSE IF que compruebe que, si el precio es menor de 80, imprime un mensaje diciendo que tiene que ahorrar un poco más
# Aplícalo a esto precios: 10, 80, 65


# SOLUCION
precio <- 10
if (precio < 50){
  print("Lo compro")
} else if (precio < 80){
  print("Debo ahorrar un poco")
} else{
  print("No lo compro")
}

# Condicionales anidados #
# Dentro de una estructura IF / ELSE / ELSE IF, podemos incorporar otra estructura IF / ELSE / ELSE IF anidada

# Ejemplo: doble factor de autentificación
# Si no tienes una tarjeta, el sistema no te pide código
# Si tienes la tarjeta, el sistema te pide un código
# Si el código es correcto, entras, sino suena una alarma

tiene_tarjeta <- TRUE
codigo_ingresado <- 1234
codigo_correcto <- 5678

if (tiene_tarjeta) {
  # Este bloque solo existe si tienes la tarjeta
  print("Tarjeta aceptada. Verificando código...")
  
  if (codigo_ingresado == codigo_correcto) {
    print("Acceso concedido. Bienvenido.")
  } else {
    # El else de este IF anidado es una acción específica (Alarma)
    print("¡ERROR! Código incorrecto. Activando alarma de seguridad.")
  }
  
} else {
  # Este es el else del primer IF
  print("Acceso denegado. No se detectó tarjeta de identificación.")
}

# MINIRETO: En este escenario, un banco solo presta dinero si el cliente es mayor de edad. 
# Si lo es, entonces evaluamos su sueldo. Si el sueldo es bajo (menor de 1500), se le pide un avalista. Si lo tiene, se le concede con condiciones
edad_cliente <- 20
sueldo_mensual <- 800
tiene_avalista <- TRUE




# SOLUCIÓN
if (edad_cliente >= 18) {
  print("Etapa 1: Cliente mayor de edad. Evaluando ingresos...")
  
  if (sueldo_mensual >= 1500) {
    print("Préstamo aprobado automáticamente. Cliente solvente.")
  } else {
    # Aquí anidamos otra pregunta: si gana poco, ¿tiene quien le respalde?
    if (tiene_avalista) {
      print("Préstamo aprobado bajo condición de avalista.")
    } else {
      print("Préstamo denegado: Sueldo insuficiente y sin avalista.")
    }
  }
  
} else {
  print("Préstamo denegado: El cliente es menor de edad.")
}



# Condicionales en funciones #
# Podemos incorporar estas estructuras de control a nuestras funciones para controlar que código se utiliza en caso de que condiciones se den
# o para tratar de automatizar un proceso. Por ejemplo, en el MINIRETO anterior se pedía probar una serie de precios para determinar si lo compramos
# o no. La forma de solucionarlo ha sido ir variando el valor de la variable, pero esa forma no es correcta ni efectiva

comprar <- function(precio){ # inserto la estructura condicional en una función
  if (precio < 50){
    print("Lo compro")
  } else if (precio < 80){
    print("Debo ahorrar un poco")
  } else{
    print("No lo compro")
  }
}

comprar(10)
comprar(80)
comprar(65)

# También nos sirve para determinar como funciona la función. Creamos una función que evalúa un valor. Si es menor de 0 saca un mensaje y si es mayor hace una operación
logaritmo <- function(value){
  if (value <= 0){
    print("No es posible calcular el logaritmo de un valor negativo.")
    return(NA) # No se pueden aplicar logaritmos a un valor negativo. en caso de entrar en este if, devuelve NA
  } 
  # Si no entra en el IF anterior, sigue ejecutando el resto de la función
  resultado <- paste("El logaritmo natural de", value, "es", round(log(value), 2))
  return(resultado)
}

logaritmo(-10)
logaritmo(5)


# MINIRETO: Imagina que estás procesando datos de un sensor de tráfico. 
# Queremos una función que nos diga si un vehículo va a una velocidad segura, si merece una multa leve o una multa grave.
# Velocidad adecuada <= 50; exceso de velocidad leve <= 90, exceso velocidad grave > 90




# SOLUCIÓN
evaluar_velocidad <- function(velocidad) {
  # 1. Validación de error: ¿La velocidad puede ser negativa?
  if (velocidad < 0) {
    return("Error: La velocidad no puede ser negativa.") # Devuelve un dato si entra en este bucle - sale de la función
  }
  
  # 2. Lógica de control
  if (velocidad <= 50) {
    res <- "Velocidad adecuada para ciudad."
  } else if (velocidad <= 90) {
    res <- "Exceso de velocidad: Multa leve (100€)."
  } else {
    res <- "Exceso de velocidad: Multa GRAVE (600€ + puntos)."
  }
  
  return(res)
}

# Probando la función
print(evaluar_velocidad(40))
print(evaluar_velocidad(120))
print(evaluar_velocidad(-5))


## IFELSE ##
# La alternativa para aplicar condicionales es IFELSE, que, al contrario que la estructura anterior si que está vectorizado
# La estructura de ifelse es la siguiente: ifelse(condición, si se cumple saca esto, si no se cumple saca esto)
# Veámoslo con un ejemplo
edad <- 25
ifelse(edad < 30, "Tiene menos de 30 años", "Tiene más de 30 años") # si se cumple, devuelve el segundo argumento, sino, devuelve el tercero

# Dentro de ifelse podemos añadir condiciones tan complejas como sea necesario
edad <- 30
tiene_carnet <- FALSE
ifelse(edad < 18 | tiene_carnet == FALSE, "No puede conducir", "Puede conducir")


# Como hemos dicho esta función está vectorizada, por lo que se puede aplicar a un vector de datos
edad <- c(20, 40, 25)
ifelse(edad < 30, "Tiene menos de 30 años", "Tiene más de 30 años") # si se cumple devuelve el segundo argumento, sino devuelve el tercero


# IFELSE Anidados #
# Al igual que el resto de estructuras, también podemos anidar un IFELSE dentro de otro, si bien puede resultar un poco más caótico
edad <- c(20, 40, 25, 80)
ifelse(edad < 30, "Tiene menos de 30 años", # si se cumple devuelve el segundo argumento, sino el tercer argumento es otro ifelse()
       ifelse(edad < 50, "Tiene menos de 50 años", "Tiene más de 50 años")) # si se cumple, devuelve el segundo argumento, sino, devuelve el tercero


# MINIRETO: Tienes un listado de temperaturas de varios sensores en una fábrica. 
# Tu objetivo es categorizarlas usando ifelse(). Categorías: ALERTA (temperatura < 15 O > 40), CALIENTE (temperatura > 30), NORMAL (resto)
temperaturas <- c(15, 22, 35, 10, 42, 28)


# SOLUCIÓN
ifelse(temperaturas < 15 | temperaturas > 40, "ALERTA", 
       ifelse(temperaturas > 30, "CALIENTE", "NORMAL"))



### Bucles ###

## Concepto ##
# Se utilizan cuando queremos llevar a cabo un mismo proceso varias veces sobre datos diferentes (aunque no necesariamente). Imaginad que tenemos
# un vector de números sobre los que queremos calcular la raíz cuadrada. Ahora vosotros sabéis que esto podemos hacerlo directamente porque sqrt() es 
# una función vectorizada. Pero imaginad por un momento que eso no lo sabéis, ¿cual sería el enfoque con el cual resolveríais el tener que calcular la
# raíz cuadrada de 5 números?

vector_numeros <- c(10, 20, 30, 40, 50)
sqrt(vector_numeros[1])
sqrt(vector_numeros[2])
sqrt(vector_numeros[3])
# etc

# Para evitar hacer esto manualmente, podemos usar bucles o iteraciones, es decir, con un único bloque de código hacemos todas las operaciones de
# forma automática. Los bucles más conocidos en R son los bucles FOR, aunque también se utilizan los bucles WHILE y se aplican funciones específicas
# de la famila APPLY


## Bucle FOR ##
# Un bucle FOR consiste en iterar un set de datos de forma secuencial, por ejemplo, iterar un vector consiste en coger de forma secuencial cada
# uno de los elementos de dicho vector y ejecutar un bloque de código para cada elemento. Veamos la estructura del bucle FOR con el ejemplo del
# cálculo de sqrt de un vector de números

for (num in vector_numeros){ # en cada iteración, se asigna el valor de cada elemento a la variable num
  resultado <- sqrt(num) # para cada valor de num se aplica la operación entre las llaves
  print(paste("La raíz cuadrada de", num, "es", resultado))
}

# Si quisiéramos guardar los resultados en un vector para después analizarlo, creamos un vector vacío y en cada iteración lo vamos rellenando
resultados <- c() # creamos un vector vacío
for (num in vector_numeros){ # en cada iteración, se asigna el valor de cada elemento a la variable num
  resultado <- sqrt(num) # para cada valor de num se aplica la operación entre las llaves
  resultados <- c(resultados, resultado) # añadimos cada nuevo resultado al vector resultados
  print(paste("La raíz cuadrada de", num, "es", resultado))
}

# MINIRETO: Crea un bucle FOR que haga 7 iteraciones y en cada una saque un mensaje como: "Estoy en la ronda [x]". x será un valor de 1 a 7


# SOLUCIÓN:
for (x in 1:7){
  print(paste("Estoy en la ronda", x))
}


# Bucles FOR Anidados #
# Al igual que otras estructuras, podemos introducir un bucle FOR dentro de otro, de modo que en cada iteración del FOR exterior
# se lleven a cabo las iteraciones del FOR interior
for (x in 1:5){ # bucle exterior- para pasar a la siguiente iteración primero debe hacer todo el bucle interior completo
  for (y in 6:10){ # bucle interior
    print(paste("Coordenadas:", x, y))
  }
}

# MINIRETO: Crea una estructura de bucles anidados que simule las horas y los minutos de un reloj. 
# El bucle exterior debe recorrer las horas (de 0 a 3) y el interior los minutos (de 0 a 59).
# Imprime el mensaje: "Son las [hora] horas y [minuto] minutos".





# SOLUCIÓN:
for (hora in 0:3) { # Bucle exterior
  for (minuto in 0:59) { # Bucle interior: da una vuelta completa por cada hora
    print(paste("Son las", hora, "horas y", minuto, "minutos"))
  }
}



# Usos del Bucle FOR #
# Como vimos en la primera sección, realmente no tiene sentido aplicar un bucle FOR en según que casos. El caso de calcular raíces cuadradas de un
# vector numérico es uno de esos que carecen de sentido. En primer lugar porque ocupa más espacio el bucle simplemente escribir:
resultados <- sqrt(vector_numeros)

# Pero además, y más importante, la función vectorizada está mucho más optimizada que los bucles. Veamos un ejemplo con un número masivo de números
set.seed(1234)
vector_gigante <- runif(100000)
resultados <- sqrt(vector_gigante) # ¿cuanto tarda?

# bucle for
resultados <- c()
for (num in vector_gigante){ # cuanto tarda?
  resultados <- c(resultados, sqrt(num))
}

# Pero y entonces... ¿que usos tiene un bucle FOR?

# 1. Dependencia recursiva. Cuando el valor de la iteración (i) depende del valor de la iteración anterior (i - 1).
# Ejemplos: modelos de crecimiento de poblaciones y modelos financieros
# Ejemplo: Mi banco me ofrece un interés del 5% con el dinero que tengo ingresado
capital_actual <- 1000
interes <- 0.05
for (anio in 1:5){
  ingresos <- capital_actual * interes
  print(paste("Este año he ingresado", ingresos))
  capital_actual <- capital_actual + ingresos
  print(paste("Mi capital es de", capital_actual))
}

# 2. Usar funciones no vectorizadas sobre conjuntos de datos
# Ejemplo: calcula la media de 3 grupos de pacientes
set.seed(1245)
grupo1 <- runif(10, 10, 20)
grupo2 <- runif(10, 10, 30)
grupo3 <- runif(10, 10, 40)
grupos <- list(grupo1, grupo2, grupo3) # creamos una lista

for (grupo in grupos){ # recorremos la lista
  print(mean(grupo))
}

# 3. Bucles anidados. Cuando queremos recorrer dos vectores y aplicar cualquier operación con todas las combinaciones no es posible
# hacerlo con funciones vectorizadas. Lo vimos en el ejemplo de antes:
for (x in 1:5){ # bucle exterior- para pasar a la siguiente iteración primero debe hacer todo el bucle interior completo
  for (y in 6:10){ # bucle interior
    print(paste("Coordenadas:", x, y))
  }
}

paste("Coordenadas", 1:5, 6:10) # El resultado no es el mismo, la función vectorizada lo hace elemento a elemento

# 4. Incluir estructuras de control. Cuando queremos iterar sobre un vector y aplicar una estructura IF / ELSE / ELSE IF, no es posible
# hacerlo con funciones vectorizadas.
# Ejemplo: Imagina que estás procesando una lista de mediciones de temperatura y, según el valor, quieres hacer cosas muy distintas: 
# si es un error avisar, si es extremo registrarlo y si es normal solo clasificarlo.

temperaturas <- c(22, 15, 999, 38, -50, 25) # 999 y -50 son errores de sensor
for (temp in temperaturas) {
  if (temp > 50 || temp < -30) {
    # Si el dato es erróneo, lanzamos un aviso (Acción de sistema)
    message(paste("ALERTA: Sensor fallando. Valor detectado:", temp)) # message es una función para sacar un mensaje por pantalla
  } else if (temp > 30) {
    # Si es calor extremo, aplicamos una fórmula de ajuste
    calor_ajustado <- temp * 0.95
    print(paste("Temperatura alta. Ajustada a:", calor_ajustado))
  } else {
    # Para el resto, una clasificación estándar
    print(paste("Temperatura normal:", temp))
  }
}

# Lo anterior podría hacerse con un ifelse, pero sería bastante complejo, y además no nos permitiría sacar mensajes o errores
resultado <- ifelse(temperaturas > 50 | temperaturas < -30,
                    "ALERTA: Error de sensor",
                    ifelse(temperaturas > 30,
                           paste("Calor ajustado:", temperaturas * 0.95),
                           paste("Normal:", temperaturas)
                    )
)

print(resultado)

# Bucles FOR en funciones #
# Cuando metemos un bucle for dentro de una función, lo que buscamos es crear una máquina de procesar datos. 
# La función define qué hacer, y el bucle permite que se haga automáticamente sobre todos los elementos que le pasemos.

# Imagina que quieres una función que analice los resultados de un equipo de fútbol ("V", "V", "D", "V") 
# y te diga cuántas victorias seguidas lleva en ese preciso momento.

# Función para calcular la racha actual de victorias
calcular_racha <- function(resultados) {
  racha <- 0
  
  for (partido in resultados) {
    if (partido == "Victoria") {
      racha <- racha + 1  # Si gana, sumamos 1 a lo que ya llevábamos
    } else {
      racha <- 0          # Si pierde o empata, la racha se corta y vuelve a 0
    }
  }
  
  return(racha)
}

# Probamos la función, evaluando el set de datos de cada equipo
partidos_equipo_A <- c("Victoria", "Victoria", "Derrota", "Victoria")
partidos_equipo_B <- c("Victoria", "Victoria", "Victoria", "Victoria")
calcular_racha(partidos_equipo_A) # Resultado: 1 (porque perdió el tercero)
calcular_racha(partidos_equipo_B) # Resultado: 4 (lleva pleno)


# MINIRETO: Crea una función llamada 'contar_parados' que reciba un vector de estados de un motor 
# (ej. c("Encendido", "Apagado", "Encendido", "Apagado", "Apagado")). 
# La función debe devolver cuántas veces el motor estuvo en estado "Apagado".
# Pista: Necesitarás un contador que empiece en 0 y sume 1 cada vez que encuentre un "Apagado".






# SOLUCIÓN:
contar_parados <- function(estados) {
  contador <- 0 # Inicializamos el acumulador
  
  for (estado in estados) {
    if (estado == "Apagado") {
      contador <- contador + 1 # Sumamos uno solo si se cumple la condición
    }
  }
  
  return(contador) # Devolvemos el total final
}

# Prueba la función:
test_motor <- c("Encendido", "Apagado", "Encendido", "Apagado", "Apagado")
resultado_test <- contar_parados(test_motor) 
paste("El motor se ha parado", resultado_test, "veces")


### Bucles WHILE ###
# ATENCIÓN: Aunque son eficaces debemos tener cuidado antes de declarar un bucle WHILE. Al contrario que el bucle FOR,
# en el cual sabemos las iteraciones que va a hacer, el bucle WHILE parte de la premisa de que va a hacer iteraciones
# hasta que se cumpla una condición. Debemos estar seguros de que controlamos que dicha condición se va a dar en cualquier
# momento. De lo contrario se quedará como un bucle infinito. Los bucles WHILE siempre van acompañados de un iniciador externo
# que es el que se incorpora a la condición.

# Ejemplo: Simulamos tirar un dado de 6 caras. Lanzaremos ese dado tantas veces como sea necesario hasta que salga un 1.
valor_dado <- 0 # iniciador externo

while(valor_dado != 1){ # mientras que el valor del dado sea distinto de 1, va a seguir lanzando el dado (iteraciones)
  valor_dado <- sample(1:6, 1) # actualizamos la variable externa!
  print(paste("LANZANDO DADO!... Ha salido un", valor_dado))
}

# Del mismo modo que bucles FOR y demás estructuras de control, podemos anidar bucles WHILE e incluirlos en funciones.

# MINIRETO: Crea un bucle WHILE que simule una "Hucha de Ahorro". 
# Partimos de una hucha vacia (0 euros). En cada iteración, mete en la hucha 
# una cantidad aleatoria entre 1 y 5 euros (usa sample(1:5, 1)).
# El bucle debe detenerse en el momento en que la hucha tenga 20 euros o más.
# En cada ronda, imprime cuánto dinero hay en la hucha.

# SOLUCIÓN:
hucha <- 0 # Iniciador externo: empezamos con 0 euros

while (hucha < 20) { # Condición: mientras no lleguemos al objetivo de 20
  ahorro_nuevo <- sample(1:5, 1) # Cantidad aleatoria a meter
  hucha <- hucha + ahorro_nuevo # Sumamos al total que ya teníamos
  print(paste("Has metido", ahorro_nuevo, "euros. Ahora tienes:", hucha))
}

print("¡Objetivo cumplido! Ya puedes romper la hucha.")


### Familia APPLY ###

## Concepto ##
# La familia APPLY es la alternativa eficiente y "estilo R" a los bucles FOR. 
# Sirven para aplicar una función sobre un conjunto de datos (vectores, listas, matrices o dataframes) 
# de una sola vez. La principal ventaja es que el código es más corto, más legible y rápido.

# Los tres miembros más usados son:
# 1. APPLY: Se usa en matrices o dataframes (tablas). Permite elegir si aplicar la función por filas o por columnas.
# 2. LAPPLY: "L" de List. Aplica una función a cada elemento y SIEMPRE devuelve una LISTA.
# 3. SAPPLY: "S" de Simple. Es igual que lapply, pero intenta "simplificar" el resultado a un vector.


## 1. APPLY ##
# Estructura: apply(X, MARGIN, FUN)
# X: la matriz o dataframe
# MARGIN: 1 para aplicar por FILAS, 2 para aplicar por COLUMNAS

matriz_datos <- matrix(1:9, nrow = 3)
# 1 4 7
# 2 5 8
# 3 6 9

# Sumamos por columnas (MARGIN = 2) Similar a la función colSums
apply(matriz_datos, 2, sum)

# Calculamos el valor máximo por filas (MARGIN = 1)
apply(matriz_datos, 1, max)

# MINIRETO: Tienes un dataframe con las notas de 3 alumnos en 3 exámenes. 
# Usa apply() para calcular la nota mínima de cada alumno (por fila).
notas <- data.frame(examen1 = c(7, 5, 9), examen2 = c(8, 4, 10), examen3 = c(6, 6, 8))

# SOLUCIÓN:
apply(notas, 1, min)


## 2. LAPPLY ##
# Se usa mucho con listas. No importa lo que le des, siempre te devolverá una LISTA.
ciudades <- c("madrid", "barcelona", "sevilla")

# Queremos poner todas en mayúsculas usando toupper()
lista_mayus <- lapply(ciudades, toupper)
print(lista_mayus) # El resultado es una lista con [[1]], [[2]], etc.

# MINIRETO: Tienes una lista con los precios de tres carritos de la compra.
# Usa lapply para calcular el total (sum) de cada carrito.
carritos <- list(compra1 = c(10, 5, 2), compra2 = c(100, 20), compra3 = c(5, 5, 5, 5))

# SOLUCIÓN:
lapply(carritos, sum)


## 3. SAPPLY ##
# Es el hermano "inteligente" de lapply. Intenta devolver un vector o matriz si es posible.
# Comparamos resultados:
resultado_lapply <- lapply(ciudades, toupper) # Devuelve lista
resultado_sapply <- sapply(ciudades, toupper) # Devuelve vector

print(resultado_sapply)

# MINIRETO: Usa el vector 'temperaturas' de abajo. 
# Usa sapply para calcular el cuadrado (x^2) de cada temperatura.
temperaturas <- c(15, 22, 35, 10)

# SOLUCIÓN:
sapply(temperaturas, function(x) x^2) 


## RESUMEN FINAL: ¿CUÁL ELEGIR? ##

# - apply:  Cuando trabajes con tablas (filas vs columnas).
# - lapply: Cuando necesites el resultado estructurado como lista.
# - sapply: Cuando quieras un vector limpio como resultado.
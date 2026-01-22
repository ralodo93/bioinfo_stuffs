# Hemos aprendido a usar funciones preinstaladas en R y también a como instalar funciones desarrolladas 
# por la comunidad, pero... ¿Qué pasaría si quiero hacer una función propia que haga algo específico?.

# Para ello debemos crear nosotros mismos la función que queramos. Las funciones tienen varios elementos: 
# nombre, argumentos, cuerpo y return. El nombre se define como una variable (mismas reglas), 
# los argumentos se incorporan usando la función function(), el cuerpo va entre llaves y el return 
# es lo que devuelve la función.

nombre_funcion <- function(arg1, arg2){ # parámetros arg1 y arg2
  suma <- arg1 + arg2
  texto <- paste("La suma de", arg1, "y", arg2, "es:", suma)
  return(texto)
}

nombre_funcion(5, 6) # la podemos usar para un solo par de valores
nombre_funcion(c(4,5,6), c(7,8,9)) # o para un par de vectores

### Forma de pensar

# Antes de crear una función debéis pensar: ¿esa función ya existe? porque si existe puedo usarla directamente,
# por ejemplo no tiene sentido hacer una función que calcule la media porque ya existe, sin embargo, si podemos usarla como base

# Por ejemplo, vimos que para usar la media existe un parámetro un poco tedioso que era na.rm. Es muy probable que alguna vez se te olvide
# usarlo y después de lanzar un código enorme que tarde 2 min, recibas un NA o algún error raro por ese motivo

# Podrías crear una función que intente evitar esto. Por ejemplo: podrías crear una función mean_na.rm que use a la función mean() pero que por defecto siempre use na.rm = TRUE

mean_na.rm <- function(x){ # parámetro x
  return(mean(x, na.rm = TRUE))
}

mean_na.rm(c(4,8,1,2,6,NA)) # esta función no necesita indicar el na.rm porque lo hace por defecto
mean_na.rm(c(4,10,NA,-5,6,NA)) # si utilizo un vector distinto, no tengo que definir de nuevo na.rm

# Pero es más, vimos que hay muchas funciones que tienen el parámetro na.rm (median, max, min, range, sd etc)
# podemos crear una función cuyo input sea un vector x y una función

function_na.rm <- function(x, func){ # parametros x y func(funcion)
  return(func(x, na.rm = TRUE))
}

vector_numero <- c(4,8,5,6,9,NA,10)
function_na.rm(vector_numeros, mean) # calcula la media
function_na.rm(vector_numeros, median) # calcula la mediana
function_na.rm(vector_numeros, max) # calcula el maximo

### Valores por defecto

# En muchas ocasiones querremos establecer valores por defecto en nuestras funciones, de modo que
# en la mayoría de las ocasiones se use ese valor

# Por ejemplo vamos a suponer que vamos a hacer una función que tire un dado y genere un texto
# En la mayoría de los casos los dados tienen 6 caras, pero hay dados de 10, 12, 20 etc

tirada_dados <- function(n_caras = 6){
  resultado <- sample(1:n_caras, 1)
  texto <- paste("Te ha salido un",resultado)
  return(texto)
}

tirada_dados() # por defecto será un dado de 6 caras
tirada_dados(n_cara = 12) # pero podemos usar otro dado distinto

### Ámbito de las funciones Scope

# Cuando creamos parámetros dentro de una función no se almacenan en el entorno, sino que se almacenan en la memoria de dicha función

mi_funcion <- function(x) {
  variable_interna <- 10  # Solo existe aquí dentro
  return(x + variable_interna)
}

mi_funcion(5)
# si intento mostrar la variable interna me dirá que esa variable no existe


### Funciones anidadas

# Hemos visto que dentro de nuestras funciones usamos funciones de base (como paste()).
# Lógicamente también podemos usar nuestras propias funciones, de forma que se compartimentalice mucho más el código
# De hecho es lo que se recomienda, todo lo que se pueda compartimentalizar, se debe crear una función

# Vamos a crear una función que devuelva un dataframe indicando la media, la mediana y el sd de un vector de entrada.
# Usaremos la función que creamos antes function_na.rm dentro de dicha función

resumen_vector <- function(vector_numeros){
  df <- data.frame(media = function_na.rm(vector_numeros, mean),
                   mediana = function_na.rm(vector_numeros, median),
                   sd = function_na.rm(vector_numeros, sd))
  return(df)
}

resumen_vector(c(1,4,5,8,5,8,NA, NA, 10, 25))


### Ejemplos

# Calcular IVA: Función que coge el argumento precio y a dicho precio se le debe aplicar el IVA (por defecto es 21%)
calcular_iva <- function(precio, iva = 1.21){
  return(precio * iva)
}

calcular_iva(100) # iva al 21%
calcular_iva(100, 1.04) # iva al 4%
calcular_iva(c(100, 25, 45)) # se aplica también a vectores

# Describir persona: Función que coge argumento nombre, apellidos y edad y genera un texto
describir_persona <- function(nombre, apellido, edad){
  texto <- paste("Soy",nombre,apellido,"y tengo",edad,"años.")
  return(texto)
}

describir_persona("Juan","García",25)
describir_persona(c("Juan","María"), c("García", "Robles"), c(25, 65))

# Crea una función es_par que reciba un número y determine si es par o no. Pista: usar %%
es_par <- function(numero){
  resultado <- numero %% 2
  return(resultado == 0)
}

es_par(6)
es_par(c(4,7,9,5,4))

# Convertir de Celsius a Fahrenheit
# F = (C * 9/5) + 32

celsius2farenheit <- function(celsius){
  farenheit <- (celsius * 9/5) + 32
  return(farenheit)
}

celsius2farenheit(0)
celsius2farenheit(seq(1, 20, 5))


### EJERCICIOS PRÁCTICOS: FUNCIONES EN R ###

# 1. Crea una función llamada 'area_rectangulo' que reciba 'base' y 'altura'.
# El valor por defecto de la altura debe ser 5. Debe devolver el área.


# 2. Crea una función 'saludo_personalizado' que reciba 'nombre' y 'hora'.
# Si hora es < 12, debe devolver "Hola [nombre], son las [hora]"


# 3. Crea una función 'calculadora_basica' que reciba 'a', 'b' y 'operacion'.
# El argumento 'operacion' debe aceptar las funciones sum, mean o max.
# Pista: Usa el esquema de la función 'function_na.rm' de tu código.


# 4. Función de Conversión: Crea 'km_a_millas'. 
# (Factor de conversión: 1 km = 0.621371 millas). Pruébala con un vector de 10, 20 y 50 km.


# 5. Función Anidada: Crea una función 'analisis_completo' que reciba un vector.
# Dentro de ella, debe llamar a 'es_par' (la que ya tienes) para filtrar solo 
# los números pares del vector y luego devolver la media de esos números.

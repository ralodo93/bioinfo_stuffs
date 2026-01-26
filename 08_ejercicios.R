### ======================================================================== ###
###                         CONTROL ESPACIAL                                 ###
### ======================================================================== ###

#### Utilizando la base de datos de Starwars ####
library(tidyverse)
data("starwars")

# 1. Obtener información acerca de:

# 1.1. ¿Número de filas? ¿Número de columnas?.

# 1.2. ¿Cuales son los nombres de las columnas?.

# 1.3. ¿Podrías mostrar las primeras 10 filas?.

# 2. Filtra la tabla para quedarnos con las filas que: 
# Tengan en la columna "species" el valor "Human" Y no tengan un NA en la columna "mass"
# Guarda la tabla en una variable llamada: "starwars_human"


# 3. Selecciona tan solo algunas columnas de la tabla anterior. Modifica la variable "starwars_human" para que contenga tan solo
# las columnas: "name", "mass", "species", "sex", "homeworld"

# 4. Crea una nueva variable en la tabla "starwars_human" llamada "capital" que transfrome a mayúscula todas las letras de la variable "name"

# 5. ¿Podrías calcular la media, mediana, máxima y mínima global de la columna la masa "mass"?

# 6. ¿Podrías calcular la media, mediana, máxima y mínima por cada "homework" de la columna la masa "mass"?

# 7. ¿Podrías calcular la media, mediana, máxima y mínima por cada "homework" y cada "sex" de la columna la masa "mass"?



### ======================================================================== ###
###           PROYECTO FINAL: SIMULADOR DE EVOLUCIÓN EN RATONES              ###
### ======================================================================== ###

# CONTEXTO: Estudiamos ratones de campo. 
# Genotipos: Alelo 'N' (Dominante) y Alelo 'c' (Recesivo).
# Fenotipos: Negro (Genotipos: NN o Nc) o Canela (Genotipo: cc)
set.seed(1258) # fijamos semilla de aleatoriedad

# Parámetros
n_inicial <- 100 # la población inicial es de 100 ratones
# Los ratones negros se camuflan mejor en la tierra oscura.
tasa_supervivencia_N <- 0.8 # Tasa supervivencia fenotipo Negro
tasa_supervivencia_c <- 0.6 # Tasa supervivencia fenotipo Canela
n_hijos_por_pareja <- 1:4 # cada pareja tiene entre 1 y 4 hijos

# 1. Generar población inicial: id (1:n_inicial), genotipo (al azar), fenotipo (en base a genotipo), sexo (al azar)

# id <- 1:n_inicial
# genotipo <-  # Opciones NN, Nc o cc (al azar)
# fenotipo <- (usando genotipo) Opciones: Negro o Canela
# sexo <- (al azar)

# p0 <- dataframe(id = id, genotipo = genotipo, fenotipo = fenotipo, sexo = sexo)


# 2. Crear una función llamada chequear vida, que use un número aleatorio entre 0 y 1. 
# Si el número es mayor a la tasa de superviviencia del fenotipo de un ratón, ese ratón muere

# chequear_vida <- function(fenotipo){
# escribe tu código. recuerda incluir el valor aleatorio entre 0 y 1
# usa las variables externas tasa_supervivencia_N y tasa_supervivencia_c
# }

# comprueba el uso:
chequear_vida("Negro")
chequear_vida("Canela")

# 3. Aplica la función a p0, creando una columna nueva llamado "estado", que indique si el ratón sobrevive o no
# Filtra el dataframe p0, creando una nueva tabla llamada supervivientes

# p0$estado <- # hazlo con una función de bucles (familia apply)
# supervivientes <- # filtrar p0 en base a estado

# 4. A partir de la tabla supervivientes, genera un listado de machos y hembras para establecer las parejas
# n_parejas <- # como podríamos calcular el número de parejas
# vector_machos <- # valores id de machos random (número = número de parejas)
# vector_hembras <- # valores id de hembras random (número = número de parejas)

# parejas <- list() # lista vacía para rellenar en un for

# 5. Simular la siguiente generación (usar leyes de mendel). Cada pareja de ratones puede tener un número diferente de hijos
# Crea una función que usando el genotipo de padre y genotipo de madre, genere una tabla con sus hijos
# Antes, vamos a crear una función que genere la información de un hijo
# generar_hijo <- function(genotipo_padre, genotipo_madre){
# escribe tu código
# genera un alelo al azar de genotipo_padre
# genera un alelo al azar de genotipo_madre
# junta ambos alelos
# genera el fenotipo
# genera el sexo (al azar)
# exporta el resultado
#}


# generar_descendencia <- function(genotipo_padre, genotipo_madre){
# escribe tu código aquí. primero define el número de hijos que tendrán (número al azar)
# para cada hijo, aplica la función generar_hijo
# une todo en un dataframe
# exporta el dataframe
#}

# Aplica la función generar_descendencia a cada pareja

# Unir todos los dataframes en p1

# 6. ¿Podrías simular la población dentro de 10 generaciones?

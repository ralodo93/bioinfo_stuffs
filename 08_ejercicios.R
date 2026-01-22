### ======================================================================== ###
###           INVENTARIO DE UNA VETERINARIO                                  ###
### ======================================================================== ###

# Parámetros de entrada:

# Vectores de datos para el ejercicio de la Veterinaria (Longitud 20)

nombres <- c("Thor", "Luna", "Simba", "Pelusa", "Coco", 
             "Bella", "Max", "Kira", "Milo", "Nala", 
             "Toby", "Bimba", "Leo", "Lola", "Bruno", 
             "Mia", "Rocco", "Zoe", "Pipo", "Dante")

especies <- c("Perro", "Gato", "Perro", "Gato", "Perro", 
             "Gato", "Perro", "Perro", "Gato", "Perro", 
             "Hámster", "Perro", "Gato", "Perro", "Perro", 
             "Hámster", "Perro", "Gato", "Hámster", "Perro")

# Pesos realistas en kg (Perros: 5-30, Gatos: 3-6, Hámsters: 0.1-0.2)
peso_kg <- c(25.4, 4.2, 12.8, 3.5, 28.1, 
             5.0, 18.2, 7.5, 4.8, 22.3, 
             0.15, 9.2, 3.9, 14.5, 32.0, 
             0.12, 11.4, 4.5, 0.18, 19.7)

estado <- c("Grave", "Leve", "Estable", "Leve", "Grave", 
            "Estable", "Leve", "Leve", "Estable", "Grave", 
            "Leve", "Estable", "Leve", "Grave", "Estable", 
            "Leve", "Leve", "Grave", "Estable", "Leve")

# 1. Crear dataframe pacientes

# 2. Añadir una columna prioridad que indique el orden en que serán atendidos
unique(estado) # grave es más prioritario que leve y leve es prioritario a estable
# Pista: recuerda como crear un FACTOR y como ORDENAR un vector (o más bien, coger las posiciones)


# 3. Crea una función llamada calcular dosis que reciba peso_kg:

# Si el peso es menor de 5kg; la dosis es peso_kg * 2. 
# Si el peso es entre 5 y 15kg; la dosis es peso_kg * 1.5. 
# Si el peso es mayor de 15kg; la dosis es peso_kg * 1. 

# La función devuelve el valor de la dosis


# Aplicar a estos ejemplos:
calcular_dosis(14)
calcular_dosis(0.3)
calcular_dosis(7)

# 4. Añade una nueva columna llamada "tasa_nocturna", que, si la especie es perro sea de 20 y sino sea de 10

# 5. Usa un bucle for en el cual, en orden de prioridad, se genere un mensaje tal que:
# "Revisando a [nombre]... Peso: [peso_kg]kg. Tasa aplicada: [tasa_nocturna]€."
orden <- 1:nrow(pacientes) # Posibles valores de prioridad





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

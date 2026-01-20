### ANATOMÍA DEL PIPE (TIDYVERSE)

## Hasta ahora hemos trabajado las tablas (los datos) usando un enfoque tradicional
# En R Base, las operaciones se anidan: funcion2(funcion1(datos)) o se crean pasos intermedios.
# En tidyverse las funciones se concatenan: datos %>% function1() %>% function2()

## tidyverse nos permite usar un enfoque más moderno e intuitivo
# instalar y cargar librería
# install.packages("tidyverse") 
library(tidyverse)

## ¿qué es tidyverse?
# Es una colección de paquetes (dplyr, ggplot2, readr, etc.) que comparten 
# una misma filosofía y estructura de datos "tidy" (ordenados). Los podríamos llamar como registros.
# Cada variable está contenida en una columna
# Cada observación se encuentra en una fila
# Cada valor (observación/variable) corresponde a una celda

# Gen Paciente Valor
# Gen1 Paciente1 ValorGen1Paciente1
# Gen1 Paciente2 ValorGen1Paciente2
# Gen2 Paciente1 ValorGen2Paciente1
# Gen2 Paciente2 ValorGen2Paciente2

## Librerías de tidyverse
# readr - facilita la importación de datos
# tibble - crea variaciones de los dataframes estándar de R
# tidyr - reordenamiento de datos
# dplyr - modificación de dataframes
# purr - programación funcional
# ggplot2 - visualización 

## Uso del pipe ( %>% ) o el nuevo pipe de R nativo ( |> )

# En lugar de trabajar con data.frames, tidyverse trabaja con una estructura de datos
# llamada tibble, que es exactamente igual que un dataframe pero con mejoras que permiten
# ser manejados de forma más sencilla

# El pipe significa "Y LUEGO...". Pasa el resultado de la izquierda 
# como primer argumento de la función de la derecha.
# Ejemplo: datos %>% funcion() # incorporamos los datos y luego ejecutamos la función
head(starwars) # r base
starwars %>% head() # pipe

# También funcionan con otras estructuras de datos
sample(1:100, size = 7) %>%  # Elegimos 7 números al azar entre 1 y 100, Y LUEGO
  mean() # obtenemos la media


## ¿R Base o tidyverse?
# Tienen las mismas funcionalidades, si bien es posible que para muchos procesos tidyverse esté más optimizado.
# Se usa sobre todo porque el código se hace más legible y fácil de entender.
# También nos permite ahorrar líneas de código.

### 4 Pilares de tidyverse (dplyr)

## select() -> Para elegir o descartar COLUMNAS
# anatomía pipe: datos %>% select(columna1, columna2, ...)
starwars %>%     # cargo la tabla de starwars, Y DESPUÉS
  select(name, mass) %>%     # selecciono las columnas name y mass, Y DESPUÉS
  head()    # aplico la función head()

# R Base vs Tidy
head(starwars[,c("name", "mass")])

# USOS
# 1. Seleccionar o descartar columnas
# 1.1. Indicando las que queremos
starwars %>%
  select(name, mass) %>% # sería igual que usar c(name, mass)
  head()

# 1.2. Indicando las que no queremos (usando -)
starwars %>%
  select(-name, -mass) %>% # sería igual que usar -c(name, mass)
  head()

# 1.3. Seleccionar todas las columnas restantes (everything())
starwars %>%
  select(everything()) %>% # se eligen todas las columnas restantes
  head()

# 1.4. Seleccionar las columnas en base a un vector externo (any_of() y all_of())
mis_columnas <- c("name", "sex")
starwars %>%
  select(any_of(mis_columnas)) %>% # any_of() solo selecciona las que están
  head()

starwars %>%
  select(all_of(mis_columnas)) %>% # all_of() selecciona todas, si alguna falla da error
  head()

mis_columnas <- c("name","sexo")
starwars %>%
  select(all_of(mis_columnas)) %>% # all_of() selecciona todas, si alguna falla da error
  head()

mis_columnas <- c("name","sex")
starwars %>%
  select(-any_of(mis_columnas)) %>% # seleccionamos todas menos las columnas de la variable mis_columnas
  head()


# 2. Renombrar columnas
# 2.1 Seleccionamos la columna que hemos renombrado
starwars %>%
  select(personaje = name) %>% # seleccionamos la columna name pero además le cambiamos el nombre
  head()

# 2.2 Seleccionamos la columna que hemos renombrado y las demás (everything())
starwars %>%
  select(personaje = name, everything()) %>% # con everything() seleccionamos todas las columnas, incluida la renombrada
  head()

# Ejemplo: 
# 1) renombrar la columna name a personaje
# 2) mostrar el resto de columnas
# 3) usar una variable mis_columnas para descartar las columnas: films, vehicles, starships
mis_columnas <- c("films", "vehicles", "starships")
starwars %>%
  select(personaje = name, # renombrar
         everything(), # seleccionar todas las columnas
         -any_of(mis_columnas)) # eliminar las columnas del vector mis_columnas


## filter() -> Para elegir o descartar FILAS (según condiciones)
# anatomía pipe: datos %>% filter(condición1, condición2, ...)
starwars %>%     # cargo la tabla de starwars, Y DESPUÉS
  filter(eye_color == "blue") %>%     # filtro los personajes con ojos azules, Y DESPUÉS
  head()    # aplico la función head()

# R Base vs Tidy
# head(starwars[starwars$eye_color == "blue", ])

# USOS
# 1. Filtros con operadores lógicos básicos
# 1.1. Igualdad (==) y Diferencia (!=)
starwars %>%
  filter(species == "Droid") %>% # Solo los que son Droids
  head()

starwars %>%
  filter(species != "Human") %>% # Todos los que NO son humanos
  head()

# 1.2. Comparaciones numéricas (>, >=, <, <=)
starwars %>%
  filter(height >= 200) %>% # Personajes con altura mayor o igual a 200
  head()

# 2. Combinar múltiples condiciones (AND / OR)
# 2.1. AND: Se cumplen todas las condiciones (usando coma o &)
starwars %>%
  filter(species == "Human", height > 190) %>%  # Humanos y más altos de 190
  head()

starwars %>%
  filter(species == "Human" & height > 190) %>% 
  head()

# 2.2. OR: Se cumple al menos una condición (usando |)
starwars %>%
  filter(eye_color == "blue" | eye_color == "red") %>% # Ojos azules O rojos
  head()

# 3. Filtrar en base a un vector externo (%in%)
mis_especies <- c("Droid", "Wookiee", "Ewok")

# 3.1. Incluir los que están en el vector
starwars %>%
  filter(species %in% mis_especies) %>% 
  head()

# 3.2. Excluir los que están en el vector (usando ! antes de la condición)
starwars %>%
  filter(!species %in% mis_especies) %>% 
  head()

# 4. Filtros específicos para valores vacíos (NA)
# 4.1. Eliminar filas con NA en una columna
starwars %>%
  filter(!is.na(hair_color)) %>% # Dame los que tienen un color de pelo definido
  head()

# 5. Funciones auxiliares útiles
# 5.1. Rango de valores (between())
starwars %>%
  filter(between(height, 150, 200)) %>% # Alturas entre 150 y 200 inclusive
  head()

# 5.2. Coincidencias de texto (grepl())
starwars %>%
  filter(grepl("Skywalker", name)) %>% # Personajes cuyo nombre contiene "Skywalker"
  head()

# Ejemplo:
# 1) Filtrar personajes de especie Humana o Droid
# 2) Que tengan una masa superior a 70
# 3) Que NO tengan color de ojos "unknown"
mis_especies <- c("Human", "Droid")
starwars %>%
  filter(species %in% mis_especies,
         mass > 70,
         eye_color != "unknown")



## filter() -> Para elegir FILAS según condiciones
# anatomía: filter(datos, condicion1, condicion2...)
# anatomía pipe: datos %>% filter(condición1, condición2...), la coma implica un &
iris %>%    # cargo la tabla de iris Y DESPUÉS
  filter(Species == "setosa", Sepal.Length > 5) %>%    # aplico filtrado, Y DESPUÉS
  head()   # aplico head()

# alternativa
iris %>%    # cargo la tabla de iris Y DESPUÉS
  filter(Species == "setosa" & Sepal.Length > 5) %>%    # aplico filtrado, Y DESPUÉS
  head()   # aplico head()

# R Base vs tidy
head(iris[iris$Species == "setosa" & iris$Sepal.Length > 5])

# Podemos usar todos los operadores lógicos que hemos visto
especies_interes <- c("setosa", "versicolor")
iris %>% 
  filter(Species %in% especies_interes & (Sepal.Length > 5 | Petal.Length > 1.5)) %>%
  head()

# Además, al igual que todas las demás funciones, se pueden combinar con otras
iris %>% 
  filter(Species == "setosa") %>% 
  select(-Species) %>% 
  head()


## mutate() -> Para CREAR o MODIFICAR columnas
# anatomía: mutate(datos, nombre_nueva_col = operacion)
# anatomia pipe: datos %>% mutate(nueva_columna = operacion)
iris %>% 
  mutate(Ratio.Petal = Petal.Length / Petal.Width) %>%  # crea una nueva columna Ratio.Petal
  head()

# R Base vs tidyverse:
iris$Ratio.Petal <- iris$Petal.Length / iris$Petal.Width
head(iris)

# Podemos crear varias columnas a la vez
iris %>% 
  mutate(Ratio.Petal = Petal.Length / Petal.Width,   # crea una nueva columna Ratio.Petal
         Ratio.Sepal = Sepal.Length / Sepal.Width) %>%  # crea una nueva columna Ratio.Sepal
  head()

# Podemos usar funciones para crear estas variables, también podemos modificar una variable existente
iris %>% 
  mutate(
    Tamano = ifelse(Sepal.Length > 5, "Grande", "Pequeño"), # crea una variable que determina si es Grande o Pequeño
    Area_Sepal = Sepal.Length * Sepal.Width, # crea una variable de cálculo
    Species = toupper(Species) # Modificamos una existente aplicando una función
  ) %>%
  head()


## summarize() / summarise() -> Para RESUMIR datos (colapsar en una fila)
# anatomía: summarize(datos, resultado = funcion(columna))
# anatomía pipe: datos %>% summarise(resultado = funcion(columna))
iris %>% summarise(Mean.Sepal.Length = mean(Sepal.Length), # calcula la media de sepal.length
                   Mean.Sepal.Width = mean(Sepal.Width)) # calcula la media de sepal.width

# R Base vs tidyverse:
data.frame(Mean.Sepal.Length = mean(iris$Sepal.Length),
           Mean.Sepal.Width = mean(iris$Sepal.Width))

# Uso conjunto con group_by() -> La verdadera potencia
# group_by() agrupa los datos internamente, summarize calcula por grupo.
# anatomía pipe: datos %>% group_by(columna_categorias) %>% summarise(resultado = funcion(columna_interés))
iris %>% summarize(media_sepal = mean(Sepal.Length))

# ¿Y si quisiera calcular la media de cada Specie?
iris %>% 
  group_by(Species) %>%    # se agrupan por la columna Species
  summarise(media_sepal = mean(Sepal.Length))

# R Base vs tidyverse
medias <- c()
for (specie in unique(iris$Species)){
  values <- iris[iris$Species == specie,"Sepal.Length"]
  media <- mean(values)
  medias <- c(medias, media)
}

data.frame(Species = unique(iris$Species),
           media_sepal = medias)

# Funciones asociadas

# count() - contar cuantas filas hay
iris %>% count()
iris %>% group_by(Species) %>% count() # cuantas flores hay de cada especie
# alternativa summarise()
iris %>% group_by(Species) %>% summarise(n = n()) # la función n() es la que cuenta las filas


### EJEMPLO INTEGRADO: DATASET STARWARS
# El dataset 'starwars' contiene información sobre personajes de la saga.
library(tidyverse)
starwars

# Objetivo: Queremos un informe de las especies Human y Droid

starwars %>%
  # 1. Seleccionamos solo las columnas necesarias
  select(name, height, mass, species, homeworld) %>%
  
  # 2. Filtramos para quedarnos con Humanos y Droids que tengan datos de altura/peso
  filter(species %in% c("Human", "Droid")) %>%
  filter(!is.na(height), !is.na(mass)) %>%
  
  # 3. Calculamos el IMC (Peso / Altura en metros al cuadrado)
  # Nota: height está en cm, dividimos por 100
  mutate(IMC = mass / (height/100)^2) %>%
  
  # 4. Agrupamos por especie para ver promedios
  group_by(species) %>%
  summarise(
    n_personajes = n(),
    altura_media = mean(height),
    imc_medio = mean(IMC)
  )



### ======================================================================== ###
###              BLOQUE DE EJERCICIOS: DOMINANDO EL TIDYVERSE                ###
### ======================================================================== ###

# Instrucciones: Usa el dataset 'starwars' para resolver los siguientes retos
# intentando usar siempre el pipe ( %>% ).

## -- EJERCICIO 1: SELECCIÓN Y LIMPIEZA --
# 1. Crea un dataframe llamado 'apariencia' que contenga:
#    - El nombre del personaje.
#    - Todas las columnas que contengan la palabra "color".


# ------------------------------


## -- EJERCICIO 2: FILTRADO Y CÁLCULO --
# 2. Encuentra a los personajes que:
#    - Tengan ojos azules ("blue").
#    - Midan más de 180 cm.
#    - Crea una columna nueva llamada 'estatura_m' que sea la altura en metros.


# ------------------------------


## -- EJERCICIO 3: AGRUPACIÓN Y RESUMEN --
# 3. ¿Cuál es el peso (mass) máximo, mínimo y medio para cada género (gender)?
#    - Pista: usa group_by(gender) y recuerda usar na.rm = TRUE en las funciones o elimina los NA antes


# ------------------------------


## -- EJERCICIO 4: EL RETO FINAL (Combinado) --
# 4. Queremos saber qué planetas (homeworld) tienen a los personajes más pesados:
#    - Filtra los personajes cuyo homeworld no sea NA.
#    - Agrupa por homeworld.
#    - Calcula la masa media.
#    - Filtra los resultados para mostrar solo planetas con masa media > 80.



# ------------------------------


### -- EJERCICIO 5: TIDYVERSE VS R BASE --
# 5. Traduce este código de R Base a Tidyverse usando pipes:
# data_base <- starwars[starwars$eye_color == "yellow", c("name", "eye_color")]



# ------------------------------


### Organizar Datos

## arrange()

# anatomía

# uso de desc()

## slice_max() y slice_min()

# anatomia

## sample_n()

# anatomia


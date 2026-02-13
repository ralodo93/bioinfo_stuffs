library(tidyverse)
data("storms")

storms %>%
  select(name, year, month, wind) %>% # seleccionamos las columnas
  filter(year > 1980) %>% # filtramos por año
  arrange(wind) %>% # ordenamos de menor a mayor por wind
  mutate(kmh = wind * 1.852) %>% # creamos una nueva variable
  pull(kmh) # generamos un vector


# Funciones esenciales para trabajar con tablas ----

## select(). Seleccionar columnas ----

### Seleccionar Columnas ----

# Podemos usar select() tanto indicando las columnas que queremos como las que no queremos
storms %>% select(name, year) # quiero las columnas name y year
storms %>% select(-name, -year) # quiero todas las columnas salvo name y year

# Podemos usar un vector externo junto a las funciones all_of o any_of
columnas <- c("name", "year", "month")
storms %>% select(all_of(columnas)) # all_of da error si alguna columna no existe
storms %>% select(any_of(columnas)) # any_of no da error, solo filtra las que estén

# Podemos usar cualquier filtro
storms %>% select(where(is.numeric)) # filtrar columnas numéricas
storms %>% select(starts_with("nam")) # columnas que empiecen con "nam"

### Cambiar Nombre a Columnas ----
storms %>%
  select(Nombre = name, Viento = wind) # Devuelve las columnas a las que se ha cambiado el nombre 
# (nuevo nombre = nombre antiguo)

# Junto a la función everything() podemos obtener la tabla completa
storms %>%
  select(Nombre = name, Viento = wind, everything()) # Devuelve todas las columnas 

## filter(). Filtrar filas ----

### Filtros con operadores lógicos ----
# Uso estándar
storms %>% filter(wind > 40)

# Filtrar usando vector externo
nombre_tormentas <- c("Amy", "Blanche")
storms %>% filter(name %in% nombre_tormentas)
storms %>% filter(!name %in% nombre_tormentas)

# Filtrar valores faltantes
storms %>% filter(!is.na(category))

### Filtros con varias condicones (AND y OR) ----
# AND se puede indicar mediante el operador & o con ,
storms %>% filter(wind > 40, name %in% nombre_tormentas)
storms %>% filter(wind > 40 & !name %in% nombre_tormentas)
# OR se indica con el operador |
storms %>% filter(wind > 40 | name %in% nombre_tormentas)

### distinct() ----
# Es una variante de filter(), que nos permite eliminar filas duplicadas
storms %>%
  distinct(name, year, month, day)

# Usando .keep_all =TRUE, no elimina el resto de columnas, devuelve la primera combinación única
storms %>%
  distinct(name, year, month, day, .keep_all = TRUE)

### slice() ----

#### slice(). filtrar filas por posición
storms %>% slice(c(1, 5, 8)) # filas 1, 5 y 8

#### slice_head() slice_tail()
storms %>% slice_head(n = 10) # 10 primeras filas

#### slice_sample()
storms %>% slice_sample(n = 10) # 10 filas al azar

## arrange(). Ordenar la tabla ----

### Por defecto: de menor a mayor
storms %>%
  arrange(wind)

# Podemos incorporar más columnas por las que ordenar, de forma que, en caso de empate en la primera columna
# use la segunda
storms %>%
  arrange(wind, year) # si hay empate de wind, usa year para ordenar


### Orden descendente ----
storms %>%
  arrange(desc(wind)) # de mayor a menor

# Podemos combinar variables para ordenar
storms %>%
  arrange(desc(wind), year) # ordena de mayor a menor por tiempo, en caso de empate, ordena de menor a mayor los años

## mutate(). Crear nuevas variables ----
storms %>%
  mutate(NAME = toupper(name), # crear nueva columna
         kmh = wind * 1.852, # crear nueva columna
         name = factor(name)) %>% # formatear columna existente
  select(name, NAME, wind, kmh)

## pull(). Obtener un vector ----
storms %>% pull(name) 


#############################################################
# EJERCICIO 1
# Contexto:
# En el estudio de la biodiversidad de la Antártida, es crucial identificar 
# ejemplares con medidas morfológicas atípicas. Se desea analizar a los 
# pingüinos de la especie "Gentoo" que presentan un pico especialmente largo.
#
# Enunciado:
# Usando la tabla 'penguins' del paquete 'palmerpenguins', realiza los 
# siguientes pasos:
# 1. Filtra las filas para quedarte solo con la especie "Gentoo" y donde 
#    la longitud del pico ('bill_length_mm') no sea un valor faltante.
# 2. Selecciona las columnas 'species', 'island' y 'bill_length_mm'.
# 3. Ordena la tabla de mayor a menor según la longitud del pico.
# 4. Extrae los 5 registros con los picos más largos.
#############################################################

# El estudiante debe completar a partir de aquí
library(palmerpenguins)
data("penguins")



# SOLUCIÓN

penguins %>%
  filter(species == "Gentoo", !is.na(bill_length_mm)) %>%
  select(species, island, bill_length_mm) %>%
  arrange(desc(bill_length_mm)) %>%
  slice_head(n = 5)


#############################################################
# EJERCICIO 2
# Contexto:
# Un equipo de botánica está revisando la base de datos clásica 'iris'. 
# Para un nuevo análisis computacional, necesitan estandarizar los nombres 
# de las variables y filtrar las muestras de la especie "virginica" que 
# cumplen ciertos criterios de tamaño de pétalo.
#
# Enunciado:
# 1. Selecciona todas las columnas de 'iris' pero renombra 'Species' a 'especie' 
#    y 'Petal.Length' a 'longitud_petalo'.
# 2. Filtra los registros que sean de la especie "virginica" Y tengan una 
#    'longitud_petalo' mayor a 5.5.
# 3. Crea una nueva columna llamada 'proporcion_petalo' que sea el resultado 
#    de dividir 'longitud_petalo' entre 'Petal.Width'.
#############################################################

# El estudiante debe completar a partir de aquí
data("iris")



# SOLUCIÓN

iris %>%
  select(especie = Species, longitud_petalo = Petal.Length, everything()) %>%
  filter(especie == "virginica", longitud_petalo > 5.5) %>%
  mutate(proporcion_petalo = longitud_petalo / Petal.Width)


#############################################################
# EJERCICIO 3
# Contexto:
# Se están analizando los resultados de un experimento sobre el crecimiento 
# dental en cobayas (dataset 'ToothGrowth'). Los investigadores quieren 
# aislar las mediciones de dosis altas para un análisis de varianza.
#
# Enunciado:
# 1. Utiliza el dataset 'ToothGrowth'.
# 2. Filtra las filas donde la dosis ('dose') sea igual a 2.0.
# 3. Extrae los valores resultantes como un vector numérico.
#############################################################

# El estudiante debe completar a partir de aquí
data("ToothGrowth")



# SOLUCIÓN

ToothGrowth %>%
  filter(dose == 2.0) %>%
  pull(len)


#############################################################
# EJERCICIO 4
# Contexto:
# El dataset 'msleep' contiene información sobre los hábitos de sueño de 
# diferentes mamíferos. Un veterinario está interesado en comparar el sueño 
# rem y el peso corporal de ciertos animales para un estudio metabólico.
#
# Enunciado:
# 1. De la tabla 'msleep', selecciona las columnas 'name', 'genus', 
#    'sleep_rem' y 'bodywt'.
# 2. Filtra para eliminar las filas donde el sueño rem ('sleep_rem') sea NA.
# 3. Crea una nueva variable llamada 'peso_log' que sea el logaritmo natural
#    del peso corporal 'bodywt'.
# 4. Selecciona una muestra aleatoria de 5 animales de esta lista filtrada.
# 5. Ordena la tabla de forma descendente por 'sleep_rem'.
#############################################################

# El estudiante debe completar a partir de aquí
data("msleep")



# SOLUCIÓN

msleep %>%
  select(name, genus, sleep_rem, bodywt) %>%
  filter(!is.na(sleep_rem)) %>%
  mutate(peso_log = log(bodywt)) %>%
  slice_sample(n = 5) %>%
  arrange(desc(sleep_rem))


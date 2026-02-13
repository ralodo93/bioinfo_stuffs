library(tidyverse)
data("storms")

storms %>%
  group_by(status) %>%
  summarise(max_wind = max(wind))

storms %>%
  group_by(status) %>%
  summarise(across(wind,
                   list(media = ~ mean(.),
                        maximo = ~ max(.),
                        minimo = ~ min(.))))


# Agrupar y Calcular ----

## summarize() o summarise() ----

# Se utiliza para resumir una columna aplicando cálculos en los valores de la misma
storms %>%
  summarise(media = mean(wind), # media global de wind
            primer_nombre_alfabetico = min(name)) # primer nombre en orden alfabético

## group_by() / ungroup() ----
# Sin embargo, summarise() se suele utilizar acompañado de group_by()
# Por si solo, group_by() no hace nada, tan solo señala los grupos
storms %>%
  group_by(name) # indica que hay 268 grupos en name

# Junto a summarise(), nos permite realizar cálculos por categorías o grupos
storms %>%
  group_by(status) %>%
  summarise(media_wind = mean(wind),
            sd_wind = sd(wind))

# podemos agrupar por más de una variable
storms %>%
  group_by(status, year) %>%
  summarise(media_wind = mean(wind),
            sd_wind = sd(wind))

# aunque no siempre es necesario, se recomienda que una vez se hagan los cálculos
# se desagrupen las columnas con ungroup()

storms %>%
  group_by(status, year) %>%
  summarise(media_wind = mean(wind),
            sd_wind = sd(wind)) %>%
  ungroup()

### group_by() y mutate() ----

# Aunque se use en raras ocasiones, podemos usar group_by y mutate para crear una nueva columna
# cuyo valor esté agregado por otra varible. Por ejemplo: calcular zscore de wind por name
storms %>%
  group_by(name) %>%
  mutate(zscore = (wind - mean(wind) / sd(wind))) %>%
  select(name, wind, zscore) %>%
  ungroup()

### count() ----
# Usamos count() para contar casos (filas)
storms %>%
  count() # número de filas, columna n() por defecto

storms %>%
  group_by(status) %>%
  count() # número de filas por status, la columna se llama n

# De forma alternativa podemos usar summarise con la función n(), de este modo podemos llamar a la columna
# como queramos
storms %>%
  group_by(status) %>%
  summarise(conteo = n())


## across() ----
# La función definita es across, nos permite realizar tantas operaciones sobre las columnas que se indiquen como queramos
# Antes de ver como funciona, vamos a calcular la media y la sd de las columnas: wind, year, day (agrupando por status)

# aunque resulkta mucho más breve que hacerlo con R base, es bastante tedioso
storms %>%
  group_by(status) %>%
  summarise(wind_media = mean(wind),
            wind_sd = sd(wind),
            year_media = mean(year),
            year_sd = sd(year),
            day_media = mean(day),
            day_sd = sd(day)) %>%
  ungroup()

# con accross se haría así:
storms %>%
  group_by(status) %>%
  summarise(
    across(c(wind, year, day), # definimos las columnas sobre las que se van a realizar los cálculos
           list(media = ~ mean(.), sd = ~ sd(.))) # se indican las operaciones que se van a hacer, usamos ~
  ) %>%
  ungroup()

# si quisiéramos aplicar una misma operación a todos los datos de un mismo tipo (por ejemplo a todas
# las variables numéricas, usamos where

storms %>%
  group_by(status) %>%
  summarise(
    across(where(is.numeric), # definimos las columnas sobre las que se van a realizar los cálculos (todas las numéricas)
           list(media = ~ mean(.), sd = ~ sd(.))) # se indican las operaciones que se van a hacer, usamos ~
  ) %>%
  ungroup()

# Para cambiar los nombres de las variables que se crean usamos el parámetro .names
storms %>%
  group_by(status) %>%
  summarise(
    across(c(wind), # definimos las columnas sobre las que se van a realizar los cálculos
           list(media = ~ mean(.), sd = ~ sd(.)),
           .names = "{.fn}_{.col}") # ahora las columnas se llamaran función_columna (media_wind)
  ) %>%
  ungroup()



#############################################################
# EJERCICIO 1
# Contexto:
# Un equipo de ornitología está estudiando el dimorfismo sexual en los 
# pingüinos de la Antártida. Necesitan conocer el peso promedio de cada 
# especie para determinar si existen diferencias significativas según el sexo.
#
# Enunciado:
# Utilizando la tabla 'penguins' del paquete 'palmerpenguins':
# 1. Elimina los NA de la columna "sex"
# 2. Agrupa los datos por las columnas 'species' y 'sex'.
# 3. Calcula la media de la masa corporal ('body_mass_g') bajo el nombre 'media_peso'.
# 4. Utiliza la función adecuada para contar cuántos pingüinos hay en cada grupo.
# 5. Asegúrate de desagrupar la tabla al final.
#############################################################

# El estudiante debe completar a partir de aquí
library(palmerpenguins)
data("penguins")



# SOLUCIÓN

penguins %>%
  filter(!is.na(sex)) %>%
  group_by(species, sex) %>%
  summarise(media_peso = mean(body_mass_g),
            n_pinguinos = n()) %>%
  ungroup()


#############################################################
# EJERCICIO 2
# Contexto:
# En botánica, la variabilidad de las medidas florales es un indicador de la 
# diversidad genética. Se requiere un resumen estadístico rápido de todas las 
# variables numéricas de la flor 'iris' para cada una de las especies.
#
# Enunciado:
# 1. Carga el dataset 'iris'.
# 2. Cambia los nombres de las variables a castellano
# 3. Agrupa la tabla por la columna 'Species'.
# 4. Utiliza 'across()' para calcular simultáneamente la media (mean) y la 
#    desviación típica (sd) de todas las columnas numéricas.
# 5. Los resultados deben aparecer con los sufijos "Media_columna" y "SD_columna".
#############################################################

# El estudiante debe completar a partir de aquí
data("iris")



# SOLUCIÓN

iris %>%
  select(Especies = Species,
         Longitud_Petalo = Petal.Length,
         Longitud_Sepalo = Sepal.Length,
         Ancho_Petalo = Petal.Width,
         Ancho_Sepañp = Sepal.Width) %>%
  group_by(Especies) %>%
  summarise(across(where(is.numeric), 
                   list(Media = ~ mean(.), SD = ~ sd(.)),
                   .names = "{.fn}_{.col}")) %>%
  ungroup()


#############################################################
# EJERCICIO 3
# Contexto:
# Un laboratorio está probando la eficacia de la vitamina C en el crecimiento 
# dental de cobayas. Para normalizar los datos, quieren comparar cada 
# medición individual con el promedio de su propio grupo de tratamiento.
#
# Enunciado:
# 1. Utiliza el dataset 'ToothGrowth'.
# 2. Agrupa los datos por el tipo de suplemento ('supp').
# 3. Crea una nueva columna llamada 'media_suplemento' que contenga la media 
#    de la longitud del diente ('len') de su respectivo grupo.
# 4. Crea otra columna llamada 'diferencia' que sea la resta entre 'len' y 
#    la media del grupo.
# 5. Desagrupa y selecciona solo las columnas 'supp', 'len' y 'diferencia'.
#############################################################

# El estudiante debe completar a partir de aquí
data("ToothGrowth")



# SOLUCIÓN

ToothGrowth %>%
  group_by(supp) %>%
  mutate(media_suplemento = mean(len),
         diferencia = len - media_suplemento) %>%
  ungroup() %>%
  select(supp, len, diferencia)


#############################################################
# EJERCICIO 4
# Contexto:
# Un estudio sobre ecología evolutiva analiza los patrones de sueño en mamíferos 
# según su dieta (vore). El investigador necesita un informe final que 
# resuma las horas de sueño total y el peso cerebral.
#
# Enunciado:
# 1. Utiliza el dataset 'msleep'.
# 2. Filtra la tabla para eliminar las filas donde 'vore' sea NA.
# 3. Agrupa por la categoría de dieta ('vore').
# 4. Calcula la media y el valor máximo de las columnas 'sleep_total' y 'brainwt'.
# 5. Usa 'across()' para realizar estos cálculos en una sola instrucción.
# 6. Cuenta cuántas especies pertenecen a cada categoría de dieta.
#############################################################

# El estudiante debe completar a partir de aquí
data("msleep")



# SOLUCIÓN

msleep %>%
  filter(!is.na(vore)) %>%
  group_by(vore) %>%
  summarise(across(c(sleep_total, brainwt), 
                   list(media = ~ mean(., na.rm = TRUE), 
                        maximo = ~ max(., na.rm = TRUE))),
            n_especies = n()) %>%
  ungroup()




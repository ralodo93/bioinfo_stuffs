## Cargar librerías del tidyverse
library(tidyverse)

## ¿Que es el pipe?. Sirve para encadenar funciones y operaciones de manera más legible (%>%)

# Ejemplo sin tidyverse
datos <- mtcars
head(datos)
datos_filtrados <- datos[datos$mpg > 20, ] # filtrar filas con mpg > 20
datos_seleccionados <- datos_filtrados[, c("mpg", "cyl", "hp")] # seleccionar columnas mpg, cyl y hp
head(datos_seleccionados)

# Podemos ponerlo en una sola línea? Si, pero...
head(mtcars[mtcars$mpg > 20, c("mpg", "cyl", "hp")])

# Ejemplo con pipe
# El operador %>% se lee como "y después"
# El resultado de una línea pasa a ser el primer argumento de la siguiente función de forma automática.
datos_seleccionados_pipe <- mtcars %>% # lee los datos de mtcars, y después
  filter(mpg > 20) %>% # filtra las filas con mpg > 20, y después # importante! las columnas no usan comillas
  select(mpg, cyl, hp) %>% # selecciona las columnas mpg, cyl y hp, y después
  head() # muestra las primeras filas

# Podemos ponerlo en una sola línea? Si, además sigue siendo legible
datos_seleccionados_pipe <- mtcars %>% filter(mpg > 20) %>% select(mpg, cyl, hp) %>% head()


# El input siempre es un data.frame, si tenemos una matriz, debemos transformarla
matriz <- matrix(1:9, nrow=3)
df <- as.data.frame(matriz)
df_pipe <- df %>% # toma el data.frame df y después
  filter(V1 > 3) # filtra las filas donde la columna V1 es mayor que 3

# Podemos hacer todo el flujo mediante pipes, incluso la carga de datos
df_pipe <- matrix(1:9, nrow=3) %>% # crea una matrix y después
  as.data.frame() %>% # conviértela a data.frame y después
  filter(V1 > 3) # filtra las filas donde la columna V1 es mayor que 3

iris %>% head() # iris es un set de datos de tamaño de petalos y sepalos de diferentes especies de flores

### filter y select
## filter() sirve para filtrar filas según condiciones lógicas
iris %>% filter(Sepal.Width > 4) %>% head()
iris %>% filter(Sepal.Width > 4 | Petal.Length > 2) %>% head()
iris %>% filter(Species == "versicolor") %>% head()
iris %>% filter(Species %in% c("setosa","versicolor"))


## select() sirve para seleccionar columnas por nombre o posición
iris %>% select(Petal.Width) %>% head()
iris %>% select(Species, Petal.Width) %>% head()
iris %>% select(-Species) %>% head()
iris %>% select(-c(Petal.Length, Sepal.Length)) %>% head()

# Funciones útiles con select()
iris %>% select(contains("Sepal")) # contains filtra aquellas columnas que tienen la palabra "Sepal"
iris %>% select(starts_with("Petal")) # starts_with filtra las columnas que empiezan por la palabra "Petal"
iris %>% select(ends_with("width")) # ends_with filtra las columnas que terminan por la palabra "width"


# Ejemplo de filter y select con pipe
mtcars %>% # toma los datos de mtcars y después
  filter(cyl == 6 & mpg > 20) %>% # filtra las filas con cyl igual a 6 y mpg mayor que 20, y después
  select(mpg, cyl, hp) # selecciona las columnas mpg, cyl y hp


### mutate
# mutate() sirve para crear nuevas columnas o modificar existentes
# Ejemplo de mutate con pipe
datos_mutados_pipe <- mtcars %>% # toma los datos de mtcars y después
  mutate(rendimiento = mpg / hp) %>% # crea una nueva columna rendimiento como mpg dividido por hp, y después
  select(mpg, hp, rendimiento) # selecciona las columnas mpg, hp y rendimiento
datos_mutados_pipe

### summarize
# summarize() sirve para calcular estadísticas resumen de los datos
# Ejemplo de summarize con pipe
datos_resumen_pipe <- mtcars %>% # toma los datos de mtcars y después
  summarize(media_mpg = mean(mpg), max_hp = max(hp), min_cyl = min(cyl)) # calcula la media de mpg, el máximo de hp y el mínimo
datos_resumen_pipe

# Sinergia con group_by()
# group_by() sirve para agrupar los datos por una o más columnas antes de resumir
# Ejemplo de group_by y summarize con pipe
datos_resumen_grupo_pipe <- mtcars %>% # toma los datos de mtcars y después
  group_by(cyl) %>% # agrupa los datos por la columna cyl, y después
  summarize(media_mpg = mean(mpg), max_hp = max(hp)) # calcula la media de mpg y el máximo de hp por cada grupo de cyl
datos_resumen_grupo_pipe

# Agrupar por varias columnas
datos_resumen_multigrupo_pipe <- mtcars %>% # toma los datos de mtcars, y después
  group_by(cyl, gear) %>% # agrupa los datos por las columnas cyl y gear, y después
  summarize(media_mpg = mean(mpg), max_hp = max(hp)) # calcula la media de mpg y el máximo de hp por cada grupo de cyl y gear
datos_resumen_multigrupo_pipe

# summarize especial: count()
# count() sirve para contar el número de filas por grupo
# Ejemplo de count con pipe
conteo_cyl_pipe <- mtcars %>% # toma los datos de mtcars y después
  count(cyl) # cuenta el número de filas por cada valor único de cyl

# mismo resultados usando group_by() y summarize()
conteo_cyl_pipe2 <- mtcars %>% # toma los datos de mtcars y
  group_by(cyl) %>% # agrupa los datos por la columna cyl, y después
  summarize(n = n()) # cuenta el número de filas por cada grupo (n() devuleve el número de filas)


################################################################################
#              EJERCICIOS DE MANIPULACIÓN DE DATOS CON DPLYR                   #
################################################################################

# IMPORTANTE: Asegúrate de cargar la librería antes de empezar
library(dplyr)

### --- BLOQUE 1: FILTER Y SELECT --- ###

# 1. Filtra los coches que tengan una potencia (hp) mayor a 150 y que sean automáticos (am == 0).
#    Selecciona solo las columnas 'mpg', 'hp' y 'am'.

# 2. Encuentra los coches que tienen 4 cilindros (cyl) o que pesan menos de 2 toneladas (wt < 2).
#    Muestra todas las columnas excepto 'qsec' (puedes usar select(-qsec)).

# 3. Crea una nueva tabla llamada 'deportivos' que contenga los coches con más de 6 cilindros
#    y más de 4 carburadores (carb). Selecciona solo los nombres de los coches (filas) y su hp.


### --- BLOQUE 2: MUTATE (CREACIÓN DE COLUMNAS) --- ###

# 4. El peso 'wt' está en miles de libras. Crea una nueva columna llamada 'peso_kg'
#    que convierta el peso a kilogramos (multiplica wt por 453.5). 
#    Selecciona al final 'wt' y 'peso_kg'.

# 5. Crea una columna llamada 'potencia_relativa' que sea el resultado de dividir hp entre cyl.
#    Filtra los coches cuya potencia_relativa sea mayor a 30.


### --- BLOQUE 3: SUMMARIZE Y GROUP_BY --- ###

# 6. Calcula la media del peso (wt) y la desviación estándar de la potencia (hp) de todo el dataset.
#    Usa summarize(media_peso = mean(wt), sd_potencia = sd(hp)).

# 7. Agrupa los coches por el número de marchas (gear) y calcula el consumo medio (mpg) 
#    y el número de coches en cada grupo (n()).

# 8. [RETO] Agrupa por 'am' (transmisión) y 'cyl'. Calcula:
#    - El promedio de hp.
#    - El valor máximo de mpg.
#    - Guarda el resultado en un dataframe llamado 'analisis_motores'.


### --- BLOQUE 4: CONTEO --- ###

# 9. Usa la función count() para saber cuántos coches hay según el tipo de carburador (carb).

# 10. Realiza el mismo conteo que el ejercicio anterior, pero esta vez usa group_by()
#     y summarize(n = n()). Comprueba que el resultado sea idéntico.


### --- EJERCICIO FINAL COMBINADO --- ###

# 11. Realiza las siguientes operaciones encadenadas con pipes (%>%):
#     - Toma mtcars.
#     - Crea una columna llamada 'eficiencia' que sea mpg / wt.
#     - Filtra los coches con más de 4 marchas (gear > 4).
#     - Agrupa por el tipo de transmisión (am).
#     - Resume calculando la eficiencia media y el hp máximo.
#     - Ordena el resultado de mayor a menor eficiencia (usa arrange(desc(eficiencia_media))).

################################################################################
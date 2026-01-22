### ANATOMÍA DEL PIPE (TIDYVERSE)

## Hasta ahora hemos trabajado las tablas (los datos) usando un enfoque tradicional
# En R Base, las operaciones se anidan: funcion2(funcion1(datos)) o se crean pasos intermedios.
# En tidyverse las funciones se concatenan: datos %>% function1() %>% function2()

## tidyverse nos permite usar un enfoque más moderno e intuitivo
# instalar y cargar librería
# install.packages("tidyverse") 
library(tidyverse)
data("starwars")

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

### Funciones Esenciales

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
  filter(species %in% mis_especies &
         mass > 70 &
         eye_color != "unknown")

# MINIRETO: filter() -> "El Detective"
# OBJETIVO: Encuentra personajes con estas condiciones:
# 1. Que sean de la especie "Droid"
# 2. Que tengan una masa superior a 30 kg.




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

# MINIRETO: select() -> "El Limpiador"
# OBJETIVO: Quédate solo con el nombre, el color de ojos y el color de piel.
# Pero hazlo de dos formas distintas:
# ========================================================

# A) Seleccionando las columnas por su nombre


# B) Seleccionando TODAS menos 'birth_year' y 'sex'


## arrange() -> Para ORDENAR filas (según valores de columnas)
# anatomía pipe: datos %>% arrange(columna1, columna2, ...)
starwars %>%     # cargo la tabla de starwars, Y DESPUÉS
  arrange(height) %>%     # ordeno por altura (por defecto: menor a mayor), Y DESPUÉS
  head()    # aplico la función head()

# R Base vs Tidy
# head(starwars[order(starwars$height), ])

# USOS
# 1. Orden ascendente (por defecto: de menor a mayor / A-Z)
starwars %>%
  select(name, height) %>%
  arrange(height) %>% # Personajes ordenados del más bajito al más alto
  head()

# 2. Orden descendente (usando desc())
starwars %>%
  select(name, mass) %>%
  arrange(desc(mass)) %>% # Del más pesado al más ligero
  head()

# 3. Ordenar por múltiples columnas
# Si hay un empate en la primera columna, usa la segunda para desempatar
starwars %>%
  select(name, eye_color, birth_year) %>%
  arrange(eye_color, desc(birth_year)) %>% # Ordena por color de ojos y luego por edad (más viejo a más joven)
  head()

# 4. Comportamiento de los valores vacíos (NA)
# Los NA siempre se colocan al final, independientemente de si el orden es asc o desc
starwars %>%
  select(name, height) %>%
  arrange(desc(height)) %>% 
  tail() # Usamos tail() para ver los últimos registros (donde suelen estar los NA)

# 5. Ordenar dentro de grupos (arrange + group_by)
# Nota: Para que respete los grupos, se debe usar el argumento .by_group = TRUE
starwars %>%
  group_by(species) %>%
  arrange(mass, .by_group = TRUE) %>% # Ordena por masa de menor a mayor DENTRO de cada especie
  select(name, species, mass) %>% 
  head()

# MINIRETO: arrange() -> "El Clasificador"
# OBJETIVO: Muestra los 5 personajes más jóvenes (menor birth_year) 
# de la especie "Human".



## mutate() -> Para CREAR o MODIFICAR columnas
# anatomía pipe: datos %>% mutate(nueva_columna = operacion_sobre_columnas)
starwars %>%
  mutate(height_m = height / 100) %>% # Creamos height_m dividiendo la original
  head()

# USOS
# 1. Crear una columna nueva (ej. pasar altura de cm a metros)
starwars %>%
  select(name, height) %>%
  mutate(height_m = height / 100) %>% # Creamos height_m dividiendo la original
  head()

# 2. Crear múltiples columnas y usarlas al momento
starwars %>%
  select(name, mass, height) %>%
  mutate(
    height_m = height / 100,
    imc = mass / (height_m^2) # Usamos height_m que acabamos de definir arriba
  ) %>%
  head()

# 3. Modificar una columna existente
starwars %>%
  mutate(name = toupper(name)) %>% # Convertimos los nombres a mayúsculas
  head()

# 4. Transformaciones condicionales (case_when)
# Ideal para crear categorías basadas en rangos
starwars %>%
  select(name, height) %>%
  mutate(rango_estatura = case_when(
    height > 200 ~ "Muy alto",
    height > 150 ~ "Normal",
    is.na(height) ~ "Sin datos",
    TRUE ~ "Bajo" # Para todo lo demás
  )) %>%
  head()

# 5. mutate() + group_by()
# Sirve para hacer cálculos grupales sin colapsar el dataframe (mantiene todas las filas)
starwars %>%
  group_by(species) %>%
  mutate(media_especie = mean(mass, na.rm = TRUE)) %>% 
  select(name, species, mass, media_especie) %>%
  head()

# MINIRETO: mutate() -> "El Inventor"
# OBJETIVO: Crea una columna llamada "es_alto".
# Si el personaje mide más de 180 cm debe decir "SÍ", 
# de lo contrario debe decir "NO".


## summarize() -> Para RESUMIR datos (Estadísticos)
# anatomía pipe: datos %>% summarize(nombre_metrica = funcion(columna))
# Nota: summarize() reduce muchas filas a una sola fila de resumen.
starwars %>%
  summarize(peso_medio = mean(mass, na.rm = TRUE))

# USOS
# 1. Resumen global
starwars %>%
  summarize(
    peso_medio = mean(mass, na.rm = TRUE),
    n_total = n() # n() cuenta cuántas filas hay
  )

# 2. summarize() + group_by() -> EL COMBO MÁS USADO
# Crea una tabla resumen con una fila por cada grupo
starwars %>%
  group_by(species) %>%
  summarize(
    conteo = n(), # n() devuelve el número de filas
    masa_promedio = mean(mass, na.rm = TRUE)
  ) %>%
  head()

# Consejo: Si el proceso acaba después del summarize() no es necesario hacer nada más
# Pero si el proceso va a añadir más pasos, os recomiendo usar la función ungroup() para evitar que
# en pasos posteriores se siga agrupando
starwars %>%
  group_by(species) %>%
  summarize(
    conteo = n(), # n() devuelve el número de filas
    masa_promedio = mean(mass, na.rm = TRUE)
  ) %>%
  ungroup() %>%
  head()

# 3. Filtrar grupos en el resumen
# Por ejemplo, especies con más de un individuo y su altura máxima
starwars %>%
  group_by(species) %>%
  summarize(
    cantidad = n(),
    altura_max = max(height, na.rm = TRUE)
  ) %>%
  filter(cantidad > 1) %>% # Solo vemos especies comunes 
  na.omit()

# 4. n_distinct() para contar elementos únicos
starwars %>%
  group_by(homeworld) %>%
  summarize(especies_distintas = n_distinct(species)) %>%
  head()


# MINIRETO: summarize() + group_by() -> "El Contador"
# OBJETIVO: Queremos saber cuántos personajes hay por cada tipo 
# de género (gender) y cuál es su altura promedio.




### ========================================================
### Ejercicio
### ========================================================

# CONTEXTO: La Alianza Rebelde necesita un informe sobre las 
# especies que tienen personajes con una altura media superior a 100 cm.
# Pero solo quieren considerar a personajes que pesen más de 40 kg 
# y que no sean robots (Droid).

# TU OBJETIVO:
# 1. Filtra los datos: excluye la especie "Droid" y quédate con los que pesan más de 40. 
# Elimina los personajes que tengan NA en masa o altura

# 2. Crea una columna: calcula el IMC (masa / (altura/100)^2).

# 3. Agrupa y Resume: por especie, calcula la altura promedio y el IMC promedio.

# 4. Filtra el resumen: solo especies con altura promedio mayor a 100.

# 5. Ordena: de mayor a menor altura promedio.

# 6. Selecciona: solo las columnas de especie y los dos promedios calculados.

# 7. Guardar el resultado en una variable llamada informe

# 8. Escribe un fichero excel con dicha tabla (informe_starwars.xlsx)

# [Escribe tu código aquí abajo]



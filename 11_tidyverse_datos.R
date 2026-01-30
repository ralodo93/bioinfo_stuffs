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
# Las funciones de tidyverse para manipular datos se dividen en 5 grupos:
# 1. selección y filtro, 2. agrupación, 3. manipulación, 4. resumen y 5. combinación

# Para escenificar los ejemplos vamos a crear dos dataframes simulados de un experimento de expresión génica

set.seed(123456789)
expresion <- matrix(rnorm(120000), ncol = 100, nrow = 1200)
colnames(expresion) <- paste("Individuo", 1:100, sep = "_")
rownames(expresion) <- paste("Gen", 1:1200, sep = "_")
expresion <- as.data.frame(expresion)

metadata <- as_tibble(data.frame(ID = paste("Individuo", 1:100, sep = "_"),
                       Grupo = sample(c("Caso_1", "Caso_2","Control"), size = 100, replace = TRUE),
                       Peso = sample(60:100, size = 100, replace = TRUE),
                       Altura = round(runif(100, min = 160, max = 190)),
                       Genero = sample(c("Hombre","Mujer"), size = 100, replace = TRUE)))


#### Funciones de selección y filtro

### Selección

## select() -> Para elegir o descartar COLUMNAS
# anatomía pipe: datos %>% select(columna1, columna2, ...)
starwars %>%     # cargo la tabla de starwars, Y DESPUÉS
  select(name, mass) # selecciono las columnas name y mass

# USOS
# 1. Seleccionar o descartar columnas
# 1.1. Indicando las que queremos
metadata %>%
  select(Genero, Altura) # también podríamos usar c(Genero, Altura)


# 1.2. Seleccionar las columnas que descartamos
# Usamos el signo menos (-) o el operador de negación (!) para indicar qué NO queremos.
metadata %>%
  select(-Peso, -Altura) # Esto nos devuelve todas las columnas excepto Peso y Altura

# También puedes descartar un rango de columnas seguidas
metadata %>%
  select(-(ID:Grupo)) # Elimina desde ID hasta Grupo (ambas incluidas)


# 1.3. Seleccionar las columnas en base a un vector (any_of(), all_of())
# Útil cuando los nombres de las columnas están guardados en una variable externa.
mis_columnas <- tree <- c("ID", "Grupo", "Edad_Ficticia") 

# all_of(): Da error si alguna columna del vector NO existe en el dataframe. Es más estricto.
# metadata %>% select(all_of(mis_columnas)) # Esto daría error porque "Edad_Ficticia" no existe.

# any_of(): Selecciona las que encuentre; si alguna no existe, simplemente la ignora. Es más seguro.
metadata %>%
  select(any_of(mis_columnas)) # Solo seleccionará ID y Grupo


# 2. Renombrar columnas
# Aunque existe la función rename(), select() permite renombrar mientras seleccionas.

# 2.1. Seleccionar la columna que hemos renombrado (Solo nos quedamos con esa)
# Sintaxis: nuevo_nombre = nombre_antiguo
metadata %>%
  select(Sexo = Genero, Body_Mass = Peso) # Devuelve un tibble con solo esas dos columnas renombradas


# 2.2. Seleccionar todas las columnas incluyendo la renombrada
# Si queremos mantener todo pero cambiar un nombre, combinamos con everything()
metadata %>%
  select(Paciente_ID = ID, everything()) # Pone Paciente_ID al principio y luego el resto


# 3. Ejemplo final combinado
# Vamos a hacer una selección compleja: 
# Queremos el ID, el Género renombrado, y cualquier columna que contenga medidas físicas.

metadata_limpio <- metadata %>%
  select(
    ID, 
    Sexo = Genero, 
    starts_with("Alt"), # Selecciona columnas que empiezan por "Alt" (Altura)
    ends_with("so")      # Selecciona columnas que terminan en "so" (Peso)
  )

# Visualizamos el resultado
head(metadata_limpio)

# MINI-RETO SELECT:
# 1. Crea un nuevo objeto llamado 'metadata_reducido'.
# 2. Renombra la columna 'ID' a 'Codigo_Muestra'.
# 3. Selecciona todas las columnas EXCEPTO 'Peso' y 'Altura'.
# 4. Asegúrate de que 'Genero' aparezca justo después de 'Codigo_Muestra' (usando everything()).


## filter() -> Para elegir o descartar FILAS (según condiciones)
# anatomía pipe: datos %>% filter(condición1, condición2, ...)
starwars %>%     # cargo la tabla de starwars, Y DESPUÉS
  filter(eye_color == "blue") %>%     # filtro los personajes con ojos azules, Y DESPUÉS
  head()    # aplico la función head()

## USOS
# 1. Filtro con operadores lógicos
# Los operadores básicos son: > (mayor), < (menor), >= (mayor o igual), <=, == (igualdad), != (distinto)

# Filtrar individuos que pesen exactamente 80 kilos
metadata %>%
  filter(Peso == 80)

# Filtrar individuos con una altura superior a 175 cm
metadata %>%
  filter(Altura > 175)


# 2. Filtro con varias condiciones (AND y OR)
# AND se representa con una coma (,) o con el símbolo &. Ambas condiciones deben cumplirse.
# OR se representa con la barra vertical |. Al menos una condición debe cumplirse.

# AND: Mujeres que están en el grupo Control
metadata %>%
  filter(Genero == "Mujer", Grupo == "Control")

# OR: Individuos que pesen menos de 65 kg O que midan más de 185 cm
metadata %>%
  filter(Peso < 65 | Altura > 185)


# 3. Filtrar usando un vector externo (%in%)
# Muy útil cuando tienes una lista de IDs de interés. El operador %in% busca coincidencias.
grupos_interes <- c("Caso_1", "Caso_2")

metadata %>%
  filter(Grupo %in% grupos_interes)

# También puedes negar el vector con ! para obtener los que NO están en la lista
metadata %>%
  filter(!Grupo %in% c("Control")) # Esto nos daría todos los Casos


# 4. Filtrar valores faltantes (is.na)
# En R, los valores vacíos se marcan como NA. No se pueden filtrar con == NA, se usa is.na().

# Para este ejemplo, imaginemos que filtramos filas donde NO haya NAs en Altura
metadata$Altura[c(1, 10, 15)] <- NA
metadata %>%
  filter(!is.na(Altura))

# Si quisiéramos ver solo los que tienen datos perdidos (si los hubiera):
# metadata %>% filter(is.na(Altura))


# 5. Ejemplo final combinado
# Vamos a buscar individuos que sean "Hombre", de los grupos de "Caso", 
# con un peso entre 70 y 90 kg, y finalmente seleccionamos solo su ID y su Grupo.

metadata_analisis <- metadata %>%
  filter(
    Genero == "Hombre",
    Grupo %in% c("Caso_1", "Caso_2"),
    Peso >= 70 & Peso <= 90
  ) %>%
  select(ID, Grupo)

# Mostramos los primeros resultados
head(metadata_analisis)

# MINI-RETO FILTER:
# 1. Crea un objeto llamado 'casos_especificos'.
# 2. Filtra los individuos que pertenezcan a "Caso_1" o "Control".
# 3. PERO solo aquellos que midan 175 cm o más.
# 4. Y que NO tengan valores faltantes (NA) en la columna Altura.
# 5. Finalmente, quédate solo con las columnas ID y Altura.

## distinct() -> Para eliminar filas duplicadas o ver valores únicos
# anatomía: datos %>% distinct(columna1, .keep_all = TRUE)
starwars %>%
  distinct(homeworld)

# 1. Ver qué valores únicos existen en una columna
metadata %>% 
  distinct(Grupo) # Nos muestra las 3 categorías: Caso_1, Caso_2 y Control

# 2. Eliminar duplicados manteniendo el resto de columnas
# Por defecto, distinct() solo devuelve las columnas que mencionas. 
# Usa .keep_all = TRUE para no perder el resto de la información.
metadata %>% 
  distinct(Genero, Grupo, .keep_all = TRUE) # Primera combinación única de Género/Grupo que encuentra


### slice() -> Para seleccionar filas por su posición
# anatomía: datos %>% slice(posiciones)
starwars %>%
  slice(1:10)

# 1. Selección por índice
metadata %>% 
  slice(1:5) # Selecciona las primeras 5 filas

# 2. slice_head() y slice_tail()
metadata %>% slice_head(n = 3) # Las 3 primeras
metadata %>% slice_tail(n = 3) # Las 3 últimas

# 3. slice_sample() -> Selección aleatoria (muy útil para submuestreo)
metadata %>% 
  slice_sample(n = 10) # Elige 10 individuos al azar
# slice_sample(prop = 0.1) # Elige el 10% de la muestra al azar

# 4. slice_max() y slice_min() -> Seleccionar los valores extremos
metadata %>% 
  slice_max(order_by = Altura, n = 5) # Los 5 individuos más altos


### arrange() -> Para ordenar las filas según el valor de una columna
# anatomía: datos %>% arrange(columna)

# 1. Orden ascendente (por defecto)
metadata %>% 
  arrange(Peso) # De menor a mayor peso

# 2. Orden descendente
metadata %>% 
  arrange(desc(Altura)) # De mayor a menor altura

# 3. Orden jerárquico (múltiples columnas)
metadata %>% 
  arrange(Grupo, desc(Peso)) # Ordena por Grupo A-Z y, dentro de cada grupo, por peso mayor a menor


### 4. Ejemplo final combinado
# Queremos los 3 individuos más pesados de los grupos "Caso", ordenados por altura.
metadata_top <- metadata %>%
  filter(Grupo %in% c("Caso_1", "Caso_2")) %>% # Filtramos grupos que contienen la palabra "Caso"
  slice_max(order_by = Peso, n = 3) %>% 
  arrange(desc(Altura))

# Visualizamos
print(metadata_top)


# MiniReto:
# 1. Del dataframe 'metadata', obtén una muestra aleatoria de 15 individuos.
# 2. De esos 15, quédate solo con los que son "Mujer".
# 3. Ordena el resultado final por Altura de forma descendente.
# 4. Si hubiera alguna mujer con la misma altura, elimina los duplicados de altura (distinct).


#### Funciones de agrupación

### group_by() y ungroup()

## group_by() -> Para agrupar los datos por una o más variables
# anatomía: datos %>% group_by(columna1, columna2, ...)
# Al ejecutarlo, verás que arriba del tibble pone "Groups: Columna [N]"
starwars %>%
  group_by(gender)


# 1. Agrupación simple
# Agrupamos por el tipo de Caso/Control
metadata %>%
  group_by(Grupo) 
# Nota: Verás que el dataframe parece igual, pero en la cabecera indica los grupos.


# 2. Agrupación múltiple
# Podemos agrupar por varias categorías a la vez (ej. Grupo y Genero)
metadata %>%
  group_by(Grupo, Genero)


## ungroup() -> Para eliminar la agrupación y volver al dataframe original
# Es una buena práctica usarlo siempre después de terminar una operación por grupos
# para evitar errores en cálculos posteriores.

# 3. Ejemplo de flujo de agrupación
metadata_agrupado <- metadata %>%
  group_by(Grupo)

# ... aquí irían operaciones como sumarizar o transformar ...

metadata_desagrupado <- metadata_agrupado %>%
  ungroup()


# 4. Ejemplo conceptual
# Imagina que queremos "aislar" virtualmente a los individuos por su Género
# para que cualquier operación posterior se haga comparando hombres con hombres 
# y mujeres con mujeres.

metadata %>%
  group_by(Genero) %>%
  # (Aquí es donde vendrían las funciones de cálculo que verás más adelante)
  ungroup()


# MiniReto:
# 1. Agrupa el dataframe 'metadata' simultáneamente por 'Grupo' y por 'Genero'.
# 2. Utiliza la función 'groups()' (sin pipe o con él) para verificar que el 
#    objeto realmente está agrupado.
# 3. Aplica 'ungroup()' y vuelve a verificar con 'groups()' que la agrupación ha desaparecido.


#### Funciones de manipulación de datos

### mutate() -> Para crear nuevas columnas o transformar las existentes
# anatomía: datos %>% mutate(nombre_nueva_columna = operación)
starwars %>%
  mutate(species_mayuscula = toupper(species))

# 1. Uso básico: Crear una columna de Altura en metros (está en cm)
metadata %>%
  mutate(Altura_m = Altura / 100)

# 2. Usando varias columnas: Calcular el Índice de Masa Corporal (IMC)
# Fórmula: peso / (altura^2)
metadata %>%
  mutate(IMC = Peso / (Altura/100)^2)

# 3. Modificar el valor de una columna existente: Modificar la altura a metros
metadata %>%
  mutate(Altura = round(Altura / 100, 2))

# Modificar la columna Genero para que sea un factor
metadata %>%
  mutate(Genero = factor(Genero))

# 4. mutate() con agrupaciones (group_by)
# Muy útil para comparar a un individuo con la media de su grupo
metadata %>%
  group_by(Grupo) %>%
  mutate(Media_Peso_Grupo = mean(Peso),
         Diferencia_Media = Peso - Media_Peso_Grupo) %>%
  ungroup()


# MINI-RETO MUTATE:
# 1. Crea una columna llamada 'Peso_Libras' (Peso * 2.204).
# 2. Crea otra columna llamada 'Situacion' que diga "Alto" si miden más de 180 y "Normal" si no (usa ifelse).
# 3. Calcula la altura media POR GÉNERO y guárdala en una columna llamada 'Media_Altura_Genero'.


### pivot_longer() -> De formato ANCHO a formato LARGO
# Útil cuando tienes muchas columnas de datos (como los genes) y quieres apilarlas.
# anatomía: datos %>% pivot_longer(cols, names_to, values_to)

# Vamos a usar el dataframe 'expresion' que creaste al principio.
# Pasaremos los individuos de columnas a una sola columna de "Muestra"
individuos <- colnames(expresion)
expresion_larga <- expresion %>%
  rownames_to_column(var = "Gen") %>% # Convertimos los nombres de filas en una columna
  pivot_longer(cols = all_of(individuos), # Pasamos a formato largo las columnas indicadas
               names_to = "Muestra", # le damos nombre a dicha columna
               values_to = "Expresion_Valor") # le damos nombre a los valores

head(expresion_larga)

# MINI-RETO PIVOT_LONGER:
# 1. Del dataframe 'metadata', pasa las columnas 'Peso' y 'Altura' a formato largo.
# 2. La columna de nombres debe llamarse 'Metrica' y la de valores 'Valor'.



### pivot_wider() -> De formato LARGO a formato ANCHO
# Es la operación inversa. Útil para crear matrices o tablas de resumen.
# anatomía: datos %>% pivot_wider(names_from, values_from)

# Volvemos a ensanchar el objeto que creamos antes
expresion_ancha <- expresion_larga %>%
  pivot_wider(names_from = Muestra, 
              values_from = Expresion_Valor)

# MINI-RETO PIVOT_WIDER:
# Haz la operación inversa del anterior MiniReto


#### Funciones de resumen

### 1. summarise() (o summarize()) -> Para crear resúmenes estadísticos
# Reduce múltiples filas a un solo valor (media, mediana, desviación típica, etc.)
# Anatomía: datos %>% summarize(nueva_variable = operación agregada)

# 1. Sin agrupación: Resumen global de toda la tabla
metadata %>%
  summarise(Peso_Medio = mean(Peso),
            Altura_Max = max(Altura),
            n_total = n()) # n() cuenta el número de filas

# 2. Con agrupación (group_by): Resumen por categorías
# Este es el uso más común en análisis de datos
metadata %>%
  group_by(Grupo) %>%
  summarise(Media_Peso = mean(Peso),
            SD_Peso = sd(Peso),
            Muestras = n()) %>%
  ungroup()

metadata %>%
  group_by(Grupo, Genero) %>%
  summarise(Media_Peso = mean(Peso),
            SD_Peso = sd(Peso),
            Muestras = n()) %>%
  ungroup()

# MINI-RETO SUMMARISE:
# 1. Calcula la mediana (median) del Peso y de la Altura de toda la tabla.
# 2. Ponle nombres claros a las columnas resultantes: "Mediana_P" y "Mediana_A".


### across() -> Para aplicar la misma función a múltiples columnas a la vez
# Se usa dentro de summarise() o mutate()
# anatomía: across(columnas, función)

# Calcular la media de todas las columnas numéricas por Género
# sin usar across
metadata %>%
  group_by(Genero) %>%
  summarise(
    # altura
    altura_mean = mean(Altura, na.rm = TRUE),
    altura_max = max(Altura, na.rm = TRUE),
    altura_min = min(Altura, na.rm = TRUE),
    
    # peso
    peso_mean = mean(Peso, na.rm = TRUE),
    peso_max = max(Peso, na.rm = TRUE),
    peso_min = min(Peso, na.rm = TRUE),
  )

# usando across
metadata %>%
  group_by(Genero) %>%
  summarise(across(
    c(Altura, Peso), # Variables a calcular
    list(  # funciones a aplicar
      media = ~mean(., na.rm = TRUE), # indicar los parámetros de cada función
      maximo = ~max(., na.rm = TRUE), 
      minimo = ~min(., na.rm = TRUE)
    )
  ))

# MINI-RETO ACROSS:
# 1. Agrupa por 'Grupo'.
# 2. Utiliza across() para calcular la desviación típica (sd) de Altura y Peso


### count() -> Atajo para contar observaciones por grupo
# Es equivalente a group_by(columna) %>% summarise(n = n())

# ¿Cuántos individuos hay en cada combinación de Grupo y Género?
metadata %>%
  count(Grupo, Genero)

# También puedes pedir que lo ordene automáticamente
metadata %>%
  count(Grupo, sort = TRUE)

# MINI-RETO COUNT:
# 1. Cuenta cuántos individuos hay según su 'Genero'.
# 2. Utiliza el argumento 'name = "Total_Pacientes"' dentro de count para renombrar la columna de conteo.


#### Funciones de combinación de datos

### Unión por filas y columnas (Binding)
# Estas funciones se usan cuando las tablas tienen la misma estructura o el mismo orden.

# 1.1. bind_rows() -> Pega una tabla debajo de otra
# Útil si tienes datos de pacientes nuevos y quieres añadirlos al final.
nuevos_individuos <- tibble(
  ID = c("Individuo_101", "Individuo_102"),
  Grupo = c("Caso_1", "Control"),
  Peso = c(75, 82),
  Altura = c(170, 185),
  Genero = c("Mujer", "Hombre")
)

bind_rows(metadata, nuevos_individuos) %>% slice_tail(n = 10)

# 1.2. bind_cols() -> Pega una tabla al lado de otra
# ¡CUIDADO! Solo úsalo si estás 100% seguro de que las filas están en el mismo orden.
datos_extras <- tibble(
  Ciudad = rep("Sevilla", 100),
  Fumador = sample(c("Sí", "No"), 100, replace = TRUE)
)

bind_cols(metadata, datos_extras)

# MINI-RETO BINDING:
# 1. Crea dos tibbles pequeños (2 filas cada uno) con las mismas columnas que 'metadata'.
# 2. Únelos en una sola tabla de 4 filas usando bind_rows().



### Uniones por clave (Joins)
# Son funciones inteligentes: buscan una columna común (ID) y alinean los datos.

# 2.1. left_join(x, y) -> Mantiene todo lo de la izquierda (x) y añade lo que encuentre en la derecha (y).
# Es el más usado. Si no hay coincidencia, rellena con NA.
dieta_info <- tibble(
  ID = c("Individuo_1", "Individuo_2", "Individuo_3"),
  Dieta = c("Keto", "Mediterránea", "Vegana")
)

metadata %>% 
  left_join(dieta_info, by = "ID")

# 2.2. inner_join(x, y) -> Solo mantiene las filas que tienen coincidencia en AMBAS tablas.
metadata %>% 
  inner_join(dieta_info, by = "ID") # Solo devolvería 3 filas

# 2.3. full_join(x, y) -> Mantiene TODAS las filas de ambas tablas, coincidan o no.
metadata %>% 
  full_join(dieta_info, by = "ID")

# 2.4. anti_join(x, y) -> Filtra y te da lo que NO está en la segunda tabla.
# Útil para ver qué pacientes NO tienen datos de dieta.
metadata %>% 
  anti_join(dieta_info, by = "ID")


# 3. Ejemplo final combinado
# Vamos a unir la expresión del Gen_1 con los metadatos de los pacientes.
expresion_gen1 <- expresion %>%
  rownames_to_column(var = "Gen") %>%
  filter(Gen == "Gen_1") %>%
  pivot_longer(-Gen, names_to = "ID", values_to = "Nivel")

data_final <- metadata %>%
  inner_join(expresion_gen1, by = "ID") %>%
  select(ID, Grupo, Nivel) %>%
  arrange(desc(Nivel))


# MINI-RETO JOINS:
# 1. Crea un tibble llamado 'bioquimica' con dos columnas: 'ID' (usa 5 IDs de metadata) 
#    y 'Glucosa' (valores aleatorios).
# 2. Haz un left_join de 'metadata' con 'bioquimica'.
# 3. ¿Cuántos NAs aparecen en la columna Glucosa? (Usa summarise y is.na)


#### EJERCICIO FINAL ####

# 1. Preparación de Metadatos:
#    - Calcula el IMC: Peso / (Altura/100)^2.
#    - Filtra: Solo individuos de "Caso_1" y "Caso_2".
#    - Selecciona: Solo ID, Grupo, Genero e IMC.
#    - Guárdalo en una tabla llamada metadata_clean

# 2. Transformación de Expresión:
#    - Pasa la matriz 'expresion' a formato largo (Gen, ID, Valor).
#    - Llama a la tabla expresion_tidy

# 3. Integración y Análisis:
#    - Une ambas tablas por 'ID'.
#    - Crea una columna 'Estatus_IMC' que diga "Alto" si IMC > 25 y "Bajo" si no.
#    - Agrupa por Gen, Grupo y Estatus_IMC.
#    - Resume: Calcula la media del Nivel de expresión y cuenta cuántos hay (n).
#    - Ordena: Por Gen ascendentemente y por la Media descendentemente.




library(palmerpenguins)
library(tidyverse)
data("penguins")

# Capas DATA y AESTHETIC GGPLOT2 ----

## DATA ----
# Hace referencia a los datos que se incuyen. Deben estar en tidydata.

### Métodos de Entrada ----
# Aunque el método más normal para introducir DATA es en la función ggplot(data = DATA)
ggplot(data = penguins, aes(x = bill_depth_mm, y = bill_length_mm))+
  geom_point()

# Se pueden introducir también en las funciones de geometrías usando esta estructura
ggplot()+ # siempre es necesario
  geom_point(data = penguins, aes(x = bill_depth_mm, y = bill_length_mm))

# Usaremos este segundo método en los casos en los que vayamos a añadir varios DATA en un mismo gráfico
ggplot()+ # siempre es necesario
  geom_point(data = penguins, aes(x = bill_depth_mm, y = bill_length_mm)) +
  geom_text(data = penguins %>% slice_head(n = 1), aes(x = bill_depth_mm, y = bill_length_mm, label = species))

# También podemos incorporar DATA usando dplyr
penguins %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm)) +
  geom_point()
  

## AESTHETIC  ----
# Hace referencia a las características estéticas que describen cómo queremos los datos que se vean en el gráfico.
# Las principales caracterísitcas estéticas que usaremos son: posición en los ejes, color exterior, color de relleno (fill),
# forma de los puntos (shape), opacidad (alpha), tipo de línea (linetype), grosor de línea (linewidth) y tamaño (size).
# No todos los objetos geométricos tienen los mismos aesthetic: por ejemplo un gráfico de barras no tendrá shape, pero si color
# de relleno.

# Podemos diferenciar las estéticas según si son valores fijos o están mapeadas con alguna variable

### AESTHETIC FIJOS ----

# Características estéticas fijas, como por ejemplo poner todos los puntos del mismo color

# No se declaran en la función aes()
ggplot(data = penguins, aes(x = bill_depth_mm, y = bill_length_mm))+
  geom_point(color = "turquoise", alpha = 0.7)

# Los colores se pueden declarar usando los nombres de algunos colores predefinidos
# https://sape.inf.usi.ch/quick-reference/ggplot2/colour
# O usando el código hexadecimal: "#54EBE4", "#54C1EB"

ggplot(data = penguins, aes(x = bill_depth_mm, y = bill_length_mm))+
  geom_point(color = "#54EBE4", alpha = 0.7)

### AESTHETIC MAPEADOS ----

# Características estéticas dinámicas que se asocian a una variable, como por ejemplo colorear cada grupo de un color
ggplot(data = penguins, aes(x = bill_depth_mm, y = bill_length_mm, color = species))+ # se especifica en aes()
  geom_point(alpha = 0.7)

# De forma recomendada, para evitar problemas futuros, definiremos la estética de cada geometría en su función
# salvo x e y
ggplot(data = penguins, aes(x = bill_depth_mm, y = bill_length_mm))+ # se especifica en aes()
  geom_point(alpha = 0.7, aes(color = species))

# Se pueden añadir varias estéticas
ggplot(data = penguins, aes(x = bill_depth_mm, y = bill_length_mm))+ # se especifica en aes()
  geom_point(alpha = 0.7, aes(color = species, shape = island))

### Variables Categóricas en los AESTHETIC ----

# Como se ha podido apreciar, los AESTHETIC transforman las variables de texto a factores.
# Por defecto, el orden de los factores se realiza por defecto (alfabético) pero como vimos
# podemos modificar este comportamiento

penguins %>%
  mutate(species = factor(species, levels = c("Gentoo", "Adelie", "Chinstrap"))) %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm, color = species)) + 
  geom_point(alpha = 0.7)

# Lo mismo ocurre cuando queremos usar cualquier variable categórica como eje
penguins %>%
  ggplot(aes(x = species, y = bill_length_mm, color = species)) + 
  geom_point(alpha = 0.7)

# Si queremos cambiar el orden, tan solo modificad el factor
penguins %>%
  mutate(species = factor(species, levels = c("Gentoo", "Adelie", "Chinstrap"))) %>%
  ggplot(aes(x = species, y = bill_length_mm, color = species)) + 
  geom_point(alpha = 0.7)


#############################################################
# EJERCICIO 1
# Contexto:
# Evaluar el tamaño del cerebro y el cuerpo de las especies del dataset msleep
#
# Enunciado:
# 1. Carga el dataset msleep
# 2. Genera gráfico simple de puntos con bodywt en eje X y brainwt en eje Y. Añade un alpha de 0.7 y
# pinta los puntos de color "orange"
# 3. Genera gráfico simple de puntos con bodywt en eje X y brainwt en eje Y. Añade un alpha de 0.7 y
# pinta los puntos según la columna "vore"
#############################################################

# El estudiante debe completar a partir de aquí
data("msleep")



# SOLUCIÓN

msleep %>%
  ggplot(aes(x = bodywt, y = brainwt))+
  geom_point(alpha = 0.7, color = "orange")

msleep %>%
  filter(!is.na(vore)) %>%
  ggplot(aes(x = bodywt, y = brainwt))+
  geom_point(alpha = 0.7, aes(color = vore))


#############################################################
# EJERCICIO 2
# Contexto:
# Evaluar el tiempo despierto y el peso del cerebro de la base de datos msleep
#
# Enunciado:
# 1. Carga el dataset msleep
# 2. Genera gráfico simple de puntos con awake en eje Y y brainwt en eje X. La forma de los puntos depende
# de el estado de conservación (conservation)
# 3. Genera el gráfico anterior, añade el nombre (name) de los dos animales con mayor valor de brainwt
#############################################################

# El estudiante debe completar a partir de aquí
data("msleep")



# SOLUCIÓN

msleep %>%
  filter(!is.na(conservation)) %>%
  ggplot(aes(y = awake, x = brainwt))+
  geom_point(aes(shape = conservation))

msleep %>%
  filter(!is.na(conservation)) %>%
  ggplot(aes(y = awake, x = brainwt))+
  geom_point(aes(shape = conservation))+
  geom_text(data = msleep %>% filter(!is.na(conservation)) %>% arrange(desc(brainwt)) %>% head(2),
            aes(y = awake, x = brainwt, label = name))

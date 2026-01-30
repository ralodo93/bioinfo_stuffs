#### Librería ggplot2 ####

# Se trata de una librería especializada en la generación de gráficos, utilizando como entrada datos en formato tidy.
# Durante esta clase aprenderemos los principios básicos de ggplot2, entender la estructura y generar gráficos simples.

# La semana que viene entraremos mucho más en profundidad en la generación de gráficos específicos de bioinformática.

# Explicación de los datos:
# Vamos a usar el dataset "penguins" del paquete palmerpenguins. 
# Este dataset contiene medidas biométricas de tres especies de pingüinos en el Archipiélago Palmer (Antártida).

library(tidyverse) # la librería ggplot2 está incluida en tidyverse
library(palmerpenguins) # la librería palmerpenguins contiene datos de ~350 pingüinos
data("penguins")

# Exploración de variables: 
# "species": Especie (Adelie, Chinstrap, Gentoo)
# "island": Isla (Biscoe, Dream, Torgersen)
# "bill_length_mm": Longitud del pico (mm)
# "bill_depth_mm": Grosor del pico (mm)
# "flipper_length_mm": Longitud de la aleta (mm)
# "body_mass_g": Masa corporal (g)
# "sex": Sexo
# "year": Año de estudio

### Estructura ggplot2 ###

# La estructura de ggplot2 se caracteriza por su disposición en capas. Más adelante veremos cada capa de forma individual, pero las
# capas esenciales son: data, aesthetic y geometry.

# DATA: Hace referencia a los datos que se quieren visualizar. Deben introducirse en formato tidy.
# AESTHETIC: Se trata de las diferentes variables de DATA que se utilizan para mostrar los datos (por ejemplo: eje X, eje Y, tamaño, colores etc)
# GEOMETRY: Se utiliza para definir que tipo de gráfico se muestra (puntos, líneas, barras etc)

#  ggplot(data = <DATA>) + 
# <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

## El Primer Plot ##

# Vamos a generar el primer plot de ggplot2 utilizando la estructura básica

ggplot(
  # Se utiliza la función ggplot
  data = penguins,
  # Utilizamos como DATA el dataset penguins
) + # para unir elementos de ggplot() se usa +
  geom_point(
    # Utilizamos como GEOMETRY puntos (función geom_point())
    aes(
      # Utilizamos como AESTHETIC (función aes())
      x = bill_depth_mm,
      # la variable que mostramos en el eje X
      y = bill_length_mm # la variable que mostramos en el eje Y
    )
  )

# Alternativa 1, podemos incluir la capa DATA usando el pipe de tidyverse

penguins %>% # Utilizamos como DATA el dataset penguins
  ggplot() + # Se utiliza la función ggplot, # para unir elementos de ggplot() se usa +
  geom_point(
    # Utilizamos como GEOMETRY puntos (función geom_point())
    aes(
      #  Utilizamos como AESTHETIC (función aes())
      x = bill_depth_mm,
      # la variable que mostramos en el eje X
      y = bill_length_mm # la variable que mostramos en el eje Y
    )
  )


# Alternativa 2, podemos incoporar el aes a ggplot(), siempre y cuando todas las geometrías que se usen tengan esos valores (que será la mayoría de los casos)
penguins %>%
  ggplot(
    # Se utiliza la función ggplot
    aes(
      #  Utilizamos como AESTHETIC (función aes())
      x = bill_depth_mm,
      # la variable que mostramos en el eje X
      y = bill_length_mm # la variable que mostramos en el eje Y
    )
  ) + # para unir elementos de ggplot() se usa +
  geom_point() # Utilizamos como GEOMETRY puntos (función geom_point())


# De estas alternativas, la más usada es la 2 (siempre que se pueda), que además de forma limpia sin tantos espacios ni comentarios queda así
penguins %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm))+
  geom_point()

# MINIRETO: Genera un gráfico de puntos en el que el eje X sea "species" y el eje y sea "body_mass_g".
# Escribe el código aquí:




# SOLUCIÓN
penguins %>%
  ggplot(aes(x = species, y = body_mass_g))+
  geom_point()

# ¿Has visto alguna diferencia con respecto a la gráfica anterior?
# ggplot2 controla de forma diferente las variables numéricas y las variables de texto.
# Las variables de texto las transforma en factores (y por esto hemos aprendido los factores)
# Cómo vimos, los factores por defecto se ordenan alfabéticamente, por ello en la gráfica
# las especies se disponen como "Adelie", "Chinstrap" y "Gentoo".

# Si quisiéramos modificar este comportamiento, debemos asegurarnos que el orden de los factores es
# el que nosotros queremos

penguins %>%
  # Modificar la variable species para definir los factores
  mutate(species = factor(species, levels = c("Gentoo", "Adelie", "Chinstrap"))) %>% 
  ggplot(aes(x = species, y = body_mass_g))+
  geom_point()

# También debemos tener en cuenta cuando queremos generar gráficos que usan valores numéricos que pueden ser asumidos como factores
# En este mismo ejemplo tenemos un columna "year" que define el año en que se tomó la medida, si hacemos el gráfico tal cual se vería:
penguins %>%
  ggplot(aes(x = year, y = body_mass_g))+
  geom_point()

# Pero no es eso lo que queremos, queremos mostrar solo los años que se usan. La forma más simple es convertir esa columna a factor
penguins %>%
  # Modificar la variable species para definir los factores
  mutate(year = factor(year)) %>% 
  ggplot(aes(x = year, y = body_mass_g))+
  geom_point()



## DATA ##
# Cómo hemos comentado, la capa DATA hace referencia a los datos que se quieren visualizar.
# Debemos tener en cuenta que el formato de entrada es en tidy data.
# En caso de querer incluir alguna variable modificada, se debe aplicar la modificación antes 
# de servir como entrada en ggplot(). Lo más estándar es introducir DATA mediente pipes, pero
# también podemos incluirlo dentro de la función, en el argumento DATA.

# Habrá algunas ocasiones en las que DATA se incorporará directamente en la función de geometrías
# por ejemplo, cuando queremos mostrar dos geometrías y cada una usa datos diferentes

# Creamos una nueva tabla con los valores máximos de body_mass_g + 100 por especie
maximos_especie <- penguins %>%
  group_by(species) %>%
  summarise(body_mass_g = max(body_mass_g, na.rm = TRUE) + 100)

# Queremos incorporar un texto con el nombre de la especie en el valor máximo de body_mass_g + 100

# Cómo los datos de cada geometría son diferentes, deben introducirse de forma manual a cada una
ggplot() +
  geom_point(data = penguins, aes(x = species, y = body_mass_g)) + # DATA para POINT
  geom_text(data = maximos_especie, aes(x = species, y = body_mass_g, label = species)) # DATA para TEXT


# MINIRETO
# 1. Crea una nueva tabla llamada máximos isla, con el máximo de bill_lenght_mm + 5
# 2. Genera el siguiente gráfico: eje X: island, eje Y: bill_length_mm, puntos + texto
# Escribe el código aquí:




# SOLUCIÓN
maximos_isla <- penguins %>% group_by(island) %>% summarise(bill_length_mm = max(bill_length_mm, na.rm = TRUE) + 5)
ggplot()+
  geom_point(data = penguins, aes(x = island, y = bill_length_mm))+
  geom_text(data = maximos_isla, aes(x = island, y = bill_length_mm, label = island))


## AESTHETIC
# La capa AESTHETIC define lo que queremos representar en un gráfico. Hemos visto como definir las variables que definen
# los ejes X e Y. Podemos decir que, en la mayoría de los casos, son las dos AESTHETIC necesarias para generar un gráfico (veremos que no siempre).
# Otras AESTHETIC que podemos usar son: color, fill, shape, size, label o alpha, que sirven para añadir valor a nuestro gráfico
# Las AESTHETIC que se utilizan dependen de la GEOMETRY que se vaya a utilizar, por ejemplo, la GEOMETRY point no tiene
# AESTHETIC label.

# La AESTHETIC se puede definir de forma estática o dinámica, dependiendo de si se quiere aplicar a todos los datos
# o agrupando por grupo de datos. Esto lo veremos en los ejemplos a continuación

# EJES X / Y #
# Definen los datos que se usan para disponer los ejes x e y del gráfico.
# Pueden ser AESTHETIC estáticos (ejemplo: eje x = 1)
penguins %>%
  ggplot(aes(x = 1, y = bill_length_mm))+
  geom_point()

# O dinámicos: como hemos visto en el ejemplo
penguins %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm))+
  geom_point()

# COLOR / FILL #
# Definen los colores que usamos en el gráfico.

# IMPORTANTE: Sobre los colores, para usar un color en R hay dos opciones:
# Usar colores precargados en R, en los que simplemente ponemos el nombre del color
# RStudio nos permite ver que color es cada uno simplemente escribiéndolo (esto es una novedad de hace unos años)

c("red", "blue", "green", "magenta", "cyan", "white", "black", "grey", "orange")

# Para una lista completa de colores guardados en R acceder a este enlace:
# https://sape.inf.usi.ch/quick-reference/ggplot2/colour

# La otra opción es usar los códigos hexadecimales 
c("#00f0ee", "#bbfcc4", "#264747")

# Podemos usar el AESTHETIC color o fill de forma estática, para utilizar en mismo color en todos los puntos
penguins %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm))+
  geom_point(color = "#ff7f57")

# O dinámica, para usar un color diferente para cada grupo
penguins %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm))+
  geom_point(aes(color = island)) # se define como aes() y se indica la variable de agrupación

# Diferencia entre color y fill:
# COLOR: Se aplica a puntos y líneas (el borde de los objetos).
# FILL: Se aplica al relleno de objetos con área (barras, cajas, polígonos).

# Ejemplo con puntos (color afecta al punto entero)
penguins %>%
  ggplot(aes(x = species, y = body_mass_g)) +
  geom_point(aes(color = species))

# Ejemplo con barras (fill rellena el cuerpo de la barra)
penguins %>%
  ggplot(aes(x = species)) +
  geom_bar(aes(fill = species))

# MINIRETO: Genera un gráfico de puntos donde el color dependa del "sex" y los ejes sean "flipper_length_mm" y "body_mass_g"
# Escribe el código aquí:




# SOLUCIÓN
penguins %>%
  filter(!is.na(sex)) %>% # Opcional: quitamos NAs para limpiar el gráfico
  ggplot(aes(x = flipper_length_mm, y = body_mass_g, color = sex)) +
  geom_point()

## SHAPE ##
# Definen las símbolos de los puntos (solo se usa con la GEOMETRY points)

# IMPORTANTE: En R existe una convención de símbolos que se usan para definir puntos.
# https://www.sthda.com/english/wiki/r-plot-pch-symbols-the-different-point-shapes-available-in-r

# Podemos usarlos de forma estática
penguins %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm))+
  geom_point(aes(color = island), shape = 1) # shape = 1 (circle)

penguins %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm))+
  geom_point(aes(color = island), shape = 0) # shape = 0 (cuadrado)

penguins %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm))+
  geom_point(aes(color = island), shape = 19) # shape = 19 (círculo sólido (por defecto))

penguins %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm))+
  geom_point(aes(color = island), shape = 21) # shape = 21 (círculo sólido filled)

# Como vimos la diferencia entre color y fill, depende de la GEOMETRY, hay algunas shapes que permiten utilizar colores al borde (color) y al relleno (fill).
# Es el caso de los shapes: 15, 16, 17, 18, 21, 22, 23, 24, 25
penguins %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm))+
  geom_point(aes(fill = island), shape = 21, color = "black") # shape = 21 (círculo sólido filled), color = "black" (borde negro), aes(fill = island)

# Shape también puede ser dinámico, si quisiéramos utilizar un shape diferente por grupo
penguins %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm))+
  geom_point(aes(color = island, shape = species))

# MINIRETO: Genera un gráfico donde el eje X sea la masa corporal, el eje Y el largo de la aleta, 
# y que los puntos tengan diferente forma según la isla.
# Escribe el código aquí:




# SOLUCIÓN
penguins %>%
  ggplot(aes(x = body_mass_g, y = flipper_length_mm, shape = island)) +
  geom_point()

## ALPHA ##

# ALPHA define la transparencia de los objetos (va de 0 = invisible a 1 = opaco).
# Es muy útil cuando hay muchos puntos solapados (overplotting).

# Ejemplo estático:
penguins %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm))+
  geom_point(alpha = 0.5)

# Ejemplo dinámico (poco común, pero posible):
penguins %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm))+
  geom_point(aes(alpha = body_mass_g))

# MINIRETO: Crea un gráfico de puntos de "bill_length_mm" vs "bill_depth_mm" con color por especie y una transparencia fija de 0.3
# Escribe el código aquí:




# SOLUCIÓN
penguins %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm, color = species)) +
  geom_point(alpha = 0.3)


# SIZE define el tamaño de los objetos. Suele usarse para representar una tercera variable numérica en un gráfico de dispersión.

# Ejemplo estático:
penguins %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm))+
  geom_point(size = 5)

# Ejemplo dinámico (gráfico de burbujas):
penguins %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm))+
  geom_point(aes(size = body_mass_g, color = species))

# MINIRETO: Representa el largo de la aleta vs el largo del pico, donde el tamaño del punto dependa de la masa corporal.
# Escribe el código aquí:



# SOLUCIÓN
penguins %>%
  ggplot(aes(x = bill_length_mm, y = flipper_length_mm, size = body_mass_g)) +
  geom_point()

## LABEL ##

# LABEL se utiliza para mostrar texto asociado a los datos. Es la aesthetic principal de geom_text() y geom_label().

# Ejemplo dinámico:
# Usamos el dataframe que creamos antes
ggplot(maximos_especie, aes(x = species, y = body_mass_g)) +
  geom_point() +
  geom_text(aes(label = species), vjust = -1) # vjust ajusta el texto verticalmente para que no pise el punto

# MINIRETO: En el dataset de penguins, etiqueta los puntos solo si el pingüino pesa más de 6000g



# SOLUCIÓN
penguins %>%
  mutate(etiqueta_pesados = ifelse(body_mass_g > 6000, as.character(species), "")) %>%
  ggplot(aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species)) +
  geom_text(aes(label = etiqueta_pesados), vjust = 1.5)


## Otros AESTHETIC
# A lo largo del curso veremos otros AESTHETIC que serán de utilidad, como linetype o stroke


### GEOMETRY ###
# Hemos visto hasta ahora algunas GEOMETRY de ggplot2: point, bar, text. El resto de GEOMETRY se definen de forma similar:
# geom_(nombre GEOMETRY). Las GEOMETRY más usadas son: point, jitter, text, label, line, tile, boxplot, bar, density, violin o histogram

# point
# Crea gráficos de dispersión (scatter plots). Es la herramienta principal para observar la relación entre dos variables numéricas.
penguins %>%
  ggplot(aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point()

# Los AESTHETIC más usados son:
penguins %>%
  ggplot(aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, shape = island), size = 2, alpha = 0.8)

# jitter
# Es una variante de geom_point que añade una pequeña cantidad de ruido aleatorio a los puntos. 
# Es vital cuando una de las variables es categórica para evitar que los puntos se amontonen uno encima de otro.
penguins %>%
  ggplot(aes(x = island, y = body_mass_g))+
  geom_jitter()

# Los AESTHETIC más usados son:
penguins %>%
  mutate(year = factor(year)) %>%
  ggplot(aes(x = island, y = body_mass_g)) +
  geom_jitter(aes(color = species, shape = year), width = 0.2, size = 1.5, alpha = 0.8) # width es el tamaño de rango de jiiter


# smooth
# Añade una línea ajustada a los datos para ayudar al ojo a ver patrones. Muy usado en modelos de regresión.
penguins %>%
  ggplot(aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point() +
  geom_smooth(method = "lm") # lm añade una línea de regresión lineal

# Los AESTHETIC más usados son:
penguins %>%
  ggplot(aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(alpha = 0.3) +
  geom_smooth(method = "lm", color = "darkblue", se = FALSE) # se = TRUE muestra el intervalo de confianza

# text & label
# Permiten rotular puntos o datos con texto. geom_text imprime el texto plano, mientras que geom_label dibuja un rectángulo detrás del texto para facilitar su lectura.
# text
penguins %>%
  ggplot(aes(x = flipper_length_mm, y = body_mass_g))+
  geom_text(aes(label = species))

# label
penguins %>%
  ggplot(aes(x = flipper_length_mm, y = body_mass_g))+
  geom_label(aes(label = species))

# Los AESTHETIC más usados son:
# text & label: para anotar datos con variables de texto
# Usamos un subset para no saturar el gráfico
penguins %>%
  filter(body_mass_g > 4000) %>%
  ggplot(aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_text(aes(label = species), vjust = -1, size = 6) + # size es el tamaño del texto
  geom_label(aes(label = island), fill = "lightyellow")


# line
# Conecta las observaciones ordenadas según el eje X. Muy común en series temporales.
penguins %>%
  ggplot(aes(x = flipper_length_mm, y = body_mass_g))+
  geom_line()

# Los AESTHETIC más usados son:
penguins %>%
  ggplot(aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_line(linewidth = 1, aes(color = species)) # linewidth es el grueso de la línea

# tile
# Dibuja rectángulos centrados en las coordenadas X e Y. Es la base para crear Heatmaps, donde el color del "azulejo" representa un valor.
penguins %>%
  ggplot(aes(x = island, y = species))+
  geom_tile(aes(fill = body_mass_g))

# Los AESTHETIC más usados son:
penguins %>%
  ggplot(aes(x = island, y = species)) +
  geom_tile(aes(fill = body_mass_g), color = "black", linewidth = 0.3) # linewidth es el grueso de los bordes

# boxplot
# Resume la distribución de una variable numérica mediante cuartiles. Muestra la mediana, el rango intercuartílico y los valores atípicos (outliers).
penguins %>%
  ggplot(aes(x = flipper_length_mm, y = island))+
  geom_boxplot()

# Los AESTHETIC más usados son:
penguins %>%
  ggplot(aes(x = island, y = flipper_length_mm)) +
  # outlier.color es el color de los outlier
  # outlier.shape es la forma de los outlier
  # width es la amplitud de cada boxplot (como de grande es)
  geom_boxplot(aes(fill = island), color = "black", outlier.color = "red", outlier.shape = 4, width = 0.5, linewidth = 0.3)

# violin
# Similar al boxplot, pero muestra la densidad de los datos. Es muy útil para ver si una distribución es bimodal (tiene dos "picos").
penguins %>%
  ggplot(aes(x = body_mass_g, y = species)) +
  geom_violin(aes(fill = species))

# Los AESTHETIC más usados son:
penguins %>%
  ggplot(aes(x = species, y = body_mass_g)) +
  geom_violin(aes(fill = species), alpha = 0.7, color = "black", width = 0.5, linewidth = 0.3)

# bar & col
# geom_bar hace que la altura de la barra sea proporcional al número de casos (conteo). geom_col usa valores reales de los datos para la altura.
penguins %>%
  ggplot(aes(x = species)) +
  geom_bar(aes(fill = species))

penguins %>%
  group_by(species) %>%
  summarise(mean_mass = mean(body_mass_g, na.rm = TRUE)) %>%
  ggplot(aes(x = species, y = mean_mass)) +
  geom_col(aes(fill = species))

# Los AESTHETIC más usados son:
penguins %>%
  ggplot(aes(x = species)) +
  geom_bar(aes(fill = sex), position = "dodge", width = 0.5, linewidth = 0.3) # position se usa para indicar donde como se disponen las barras

penguins %>%
  group_by(species) %>%
  summarise(mean_mass = mean(body_mass_g, na.rm = TRUE)) %>%
  ggplot(aes(x = species, y = mean_mass)) +
  geom_col(fill = "steelblue", color = "black", width = 0.5, linewidth = 0.3)



# density & histogram
# Herramientas para visualizar la distribución de una única variable continua. El histograma agrupa en "bins" (barras), la densidad crea una curva suave.
penguins %>%
  ggplot(aes(x = body_mass_g)) +
  geom_density(aes(color = species, fill = species), alpha = 0.5)

penguins %>%
  ggplot(aes(x = body_mass_g)) +
  geom_histogram(aes(fill = species))

# Los AESTHETIC más usados son:
penguins %>%
  ggplot(aes(x = body_mass_g)) +
  geom_density(aes(fill = species), alpha = 0.5, linewidth = 0.5)

penguins %>%
  ggplot(aes(x = body_mass_g)) +
  geom_histogram(aes(fill = species), bins = 30, color = "white") # bins indica el número de contenedores


# hline / vline
# Dibujan líneas infinitas horizontales o verticales. Se usan para marcar límites de control, medias o umbrales de significación.
penguins %>%
  ggplot(aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point() +
  geom_hline(yintercept = 4000, linetype = "dashed", color = "red") + # linetype es el tipo de línea
  geom_vline(xintercept = 200, color = "blue") # Línea vertical

# Los AESTHETIC más usados son:
penguins %>%
  ggplot(aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = island)) +
  geom_hline(yintercept = 4200, linetype = "dashed", color = "red", size = 1, linewidth = 0.8) +
  geom_vline(xintercept = median(penguins$flipper_length_mm, na.rm = T), color = "blue")

### EJERCICIO REPASO ###
# Genera un gráfico que compare la relación entre el largo del pico (bill_length_mm); eje X, y el ancho del pico (bill_depth_mm); eje y, pero cumpliendo estas condiciones:
# Cada especie debe tener un color diferente.
# Cada isla debe tener una forma (shape) diferente.
# Añade una capa de tendencia lineal (smooth) para todo el conjunto de datos de color negro.
# Añade una línea horizontal roja que marque la media del largo del pico (mean(bill_length_mm))."


### SOLUCIÓN ###
# Calculamos la media previamente para que el código sea más limpio
media_pico <- mean(penguins$bill_length_mm, na.rm = TRUE)
penguins %>%
  # Paso 1: Definimos DATA y AES principales
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm)) +
  
  # Paso 2: Añadimos GEOM_POINT con color por especie y forma por isla
  geom_point(aes(color = species, shape = island), size = 3, alpha = 0.7) +
  
  # Paso 3: Añadimos la línea de tendencia (Smooth)
  # Usamos color "black" fuera de aes() porque no depende de ninguna variable
  geom_smooth(method = "lm", color = "black", se = FALSE, linetype = "dotdash") +
  
  # Paso 4: Añadimos la línea horizontal de la media
  geom_hline(yintercept = media_pico, color = "red", linetype = "dashed", linewidth = 1)

### ggplot2: CAPAS DE PRESENTACIÓN ###

# Una vez dominamos DATA, AES y GEOM, entramos en las capas que hacen que el gráfico 
# sea interpretable y profesional: Facetas, Escalas y Temas.


## 1. FACETS (Facetas) ##

# Las facetas dividen un gráfico en múltiples paneles según variables categóricas.
# Es la mejor forma de comparar grupos sin saturar un solo gráfico.

# facet_wrap(): Para una sola variable. Organiza los paneles de forma eficiente.
penguins %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm)) +
  geom_point(aes(color = species)) +
  facet_wrap(~island) # El símbolo ~ significa "en función de"

# facet_grid(): Para cruzar dos variables (Filas ~ Columnas).
penguins %>%
  filter(!is.na(sex)) %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm)) +
  geom_point(aes(color = species)) +
  facet_grid(sex ~ island)

# MINIRETO: Crea un gráfico de densidad de "body_mass_g" separado en facetas por "year" 
# y con el color de relleno (fill) según "species".
# Escribe el código aquí:

# SOLUCIÓN MINIRETO
penguins %>%
  ggplot(aes(x = body_mass_g, fill = species)) +
  geom_density(alpha = 0.5) +
  facet_wrap(~year)


## 2. SCALES (Escalas) ##

# Las escalas controlan CÓMO se traducen los datos a propiedades visuales.
# Sirven para cambiar colores, límites de los ejes y etiquetas de leyenda.

# Las escalas controlan la relación entre los datos y los aesthetics.
# Sin escalas, ggplot2 usa valores por defecto. Con ellas, tomamos el control total.

library(RColorBrewer) # Librería clave para paletas predefinidas
library(viridis)      # Librería para paletas daltónico-friendly y perceptualmente uniformes

## 1. ESCALAS DE COLOR Y RELLENO (COLOR & FILL) ##

# Existen tres tipos principales de datos que requieren diferentes escalas de color:

# A. ESCALAS DISCRETAS / CATEGÓRICAS (Para variables como 'species' o 'island')
# Se usan cuando los datos pertenecen a grupos distintos sin un orden intrínseco.

# Uso manual: Tú eliges los colores exactos
penguins %>%
  ggplot(aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
  geom_point(size = 3) +
  scale_color_manual(values = c("Adelie" = "#FF8C00", "Chinstrap" = "#9932CC", "Gentoo" = "#008B8B"))

# Uso de paletas predefinidas (RColorBrewer)
# Tipos de paletas Brewer: "qual" (cualitativas), "div" (divergentes), "seq" (secuenciales)
penguins %>%
  ggplot(aes(x = species, fill = species)) +
  geom_bar() +
  scale_fill_brewer(palette = "Set2") # "Set1", "Set2", "Pastel1", etc.

# B. ESCALAS CONTINUAS (Para variables numéricas como 'body_mass_g')
# El color varía gradualmente según el valor numérico.

# Gradiente simple (dos colores)
penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm, color = body_mass_g)) +
  geom_point() +
  scale_color_gradient(low = "grey90", high = "blue")

# Gradiente de n-colores (scale_color_gradientn)
penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm, color = body_mass_g)) +
  geom_point() +
  scale_color_gradientn(colors = c("red","blue","orange"))

# C. ESCALAS DIVERGENTES
# Se usan cuando hay un punto medio crítico (ej: valores de expresión génica, donde 0 es la media)
# Para el ejemplo, crearemos una variable de "desviación de la masa media"
media_masa <- mean(penguins$body_mass_g, na.rm = TRUE)

penguins %>%
  mutate(diff_masa = body_mass_g - media_masa) %>%
  ggplot(aes(x = flipper_length_mm, y = bill_length_mm, color = diff_masa)) +
  geom_point() +
  scale_color_gradient2(low = "red", mid = "white", high = "blue", midpoint = 0)

# D. LA ESCALA VIRIDIS (La mejor para ciencia)
# Son paletas que se ven bien en blanco y negro y son aptas para daltónicos.
# _d para discreto, _c para continuo.
penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm, color = body_mass_g)) +
  geom_point() +
  scale_color_viridis_c(option = "magma") # Opciones: "viridis", "magma", "inferno", "plasma", "cividis"

penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  geom_point() +
  scale_color_viridis_d(option = "viridis") # Opciones: "viridis", "magma", "inferno", "plasma", "cividis"

# MINIRETO COLORES: Crea un gráfico de dispersión de bill_length vs bill_depth 
# donde el color sea la masa corporal usando la paleta viridis "plasma".


# SOLUCIÓN:
ggplot(penguins, aes(x = bill_length_mm, y = bill_depth_mm, color = body_mass_g)) + 
  geom_point() + 
  scale_color_viridis_c(option = "plasma")


## 2. ESCALANDO OTRAS AESTHETICS (SIZE, SHAPE, ALPHA) ##

# No solo el color se escala. Podemos controlar cómo cambian los tamaños y formas.

# A. SIZE (Tamaño)
# Es mejor usar scale_size_area() que scale_size() para que el valor 0 mapee a tamaño 0.
penguins %>%
  ggplot(aes(x = flipper_length_mm, y = bill_length_mm, size = body_mass_g)) +
  geom_point(alpha = 0.5) +
  scale_size_area(max_size = 10, name = "Peso (g)") # Controla el tamaño máximo del punto

# B. SHAPE (Forma)
# Se usa para variables categóricas. R tiene un límite de 6 formas automáticas.
penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm, shape = species)) +
  geom_point(size = 3) +
  scale_shape_manual(values = c("Adelie" = 15, "Chinstrap" = 17, "Gentoo" = 18)) # Usando códigos PCH

# C. ALPHA (Transparencia)
# Útil para resaltar puntos según una variable numérica.
penguins %>%
  ggplot(aes(x = flipper_length_mm, y = bill_length_mm, alpha = body_mass_g)) +
  geom_point(color = "darkblue") +
  scale_alpha_continuous(range = c(0.1, 1)) # Define el rango mínimo y máximo de transparencia


## 3. TRANSFORMACIONES DE EJES (SCALES X e Y) ##

# A veces los datos biológicos requieren escalas logarítmicas (ej: conteos de RNA-seq).
# Podemos transformar la escala directamente sin modificar el dataframe.

penguins %>%
  ggplot(aes(x = body_mass_g, y = flipper_length_mm)) +
  geom_point() +
  scale_x_log10() + # Escala logarítmica en base 10
  scale_y_reverse() # Invierte el eje Y


## 3. LABS & THEMES (Etiquetas y Temas) ##

# LABS: Modifica los textos (Títulos, ejes, leyendas).
# THEMES: Modifica la estética no relacionada con los datos (fondos, fuentes, rejillas).

# Ejemplo con etiquetas profesionales y tema predefinido
penguins %>%
  ggplot(aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
  geom_point() +
  labs(
    title = "Relación Biométrica en Pingüinos",
    subtitle = "Medidas tomadas en el Archipiélago Palmer",
    x = "Largo de la Aleta (mm)",
    y = "Masa Corporal (g)",
    color = "Especie",
    caption = "Fuente: palmerpenguins R package"
  ) +
  theme_minimal() # Tema limpio con fondo blanco

# Personalización de Theme (Control total)
penguins %>%
  ggplot(aes(x = species, y = body_mass_g)) +
  geom_boxplot(aes(fill = species)) +
  theme_classic() + # Tema clásico (ejes negros, sin cuadrícula)
  theme( # usar la función theme
    axis.text.x = element_text(angle = 45, hjust = 1, size = 12), # Rotar texto eje X
    legend.position = "none" # Eliminar la leyenda
  )

# La función theme tiene infinidad de parámetros que modifican el gráfico
# Mi consejo es que cuando queráis hacer algo específico, lo busquéis en Google (o ChatGPT)
# Conforme vayáis usando las diferentes funcionalidades, iréis aprendiendo pero incluso
# cuando seáis experto, lo más probable es que sigáis teniendo que buscar como hacer 
# algunas cosas.




# MINIRETO: Toma un gráfico de violín de "body_mass_g" por "island", 
# ponle un título, usa theme_dark() y mueve la leyenda a la parte superior (top).
# Escribe el código aquí:

# SOLUCIÓN MINIRETO
penguins %>%
  ggplot(aes(x = island, y = body_mass_g, fill = island)) +
  geom_violin() +
  labs(title = "Peso por Isla") +
  theme_dark() +
  theme(legend.position = "top")


### EJERCICIO FINAL DE REPASO (Integración de todo) ###

# Objetivo: Generar un gráfico listo para una publicación científica.
# 1. Relación bill_length_mm vs bill_depth_mm.
# 2. Separar por Sexo en paneles (facet).
# 3. Colorear por Especie con la paleta "Dark2" (scale_color_brewer).
# 4. Títulos claros y tema profesional.

### SOLUCIÓN EJERCICIO FINAL ###
penguins %>%
  filter(!is.na(sex)) %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm, color = species)) +
  geom_point(size = 2, alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE) + # Línea de tendencia sin banda de error
  facet_wrap(~sex) +
  scale_color_brewer(palette = "Dark2") +
  labs(
    title = "Dimorfismo sexual y morfología del pico",
    x = "Grosor del pico (mm)",
    y = "Longitud del pico (mm)",
    color = "Especie"
  ) +
  theme_bw() + # Tema con borde
  theme(
    legend.position = "bottom",
    strip.background = element_rect(fill = "lightgrey"), # Color de fondo de la etiqueta de faceta
    strip.text = element_text(face = "bold") # Texto de faceta en negrita
  )


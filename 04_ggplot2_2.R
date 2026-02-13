library(tidyverse)
library(palmerpenguins)

data("penguins")

ggplot(penguins, aes(x = species, y = bill_length_mm))+
  geom_violin(aes(fill = species), color = "grey20", alpha = 0.7)

ggplot(penguins, aes(x = bill_length_mm))+
  geom_density(aes(fill = species), alpha = 0.5)

ggplot(penguins, aes(x = island))+
  geom_bar(aes(fill = species), position = "dodge")


# Capa GEOMETRY en ggplot2 ----

# En este link tenéis un listado de todos los GEOMETRIES de ggplot2 ordenados
# https://rafalab.dfci.harvard.edu/dsbook/R/img/ggplot2-cheatsheeta.png

# Vamos a dividir las GEOMETRIES dependiendo del tipo de variables que se quiera poner

## Una Variable ----

### Densidades: geom_density ----
# Muestra la distribución de una variable numérica en términos de densidad. Muy útil para comparar grupos.
# Aesthetics Dinámicos: fill (relleno), color (borde).
# Aesthetics Estáticos: alpha (transparencia), linetype, linewidth

penguins %>%
  ggplot(aes(x = body_mass_g)) +
  geom_density(aes(fill = species), color = "gray50", alpha = 0.4, linetype = "dashed", linewidth = 0.5)

penguins %>%
  ggplot(aes(x = body_mass_g)) +
  geom_density(aes(color = island), fill = "white", alpha = 0.4)

### Histogramas: geom_histogram ----
# Muestra la distribución de una variable numérica en términos de conteo según rangos específicos.
# Aesthetics Dinámicos: fill, color.
# Aesthetics Estáticos: bins (nº barras), binwidth (ancho del rango).

penguins %>%
  ggplot(aes(x = flipper_length_mm)) +
  geom_histogram(bins = 20, aes(fill = island), color = "white")

penguins %>%
  ggplot(aes(x = flipper_length_mm)) +
  geom_histogram(bins = 100, aes(fill = island), color = "white")

### Gráficos de Barras: geom_bar ----
# Cuenta la frecuencia de filas por categoría (variable discreta)
# Aesthetics Dinámicos: fill, color.
# Aesthetics Estáticos: alpha, width, position

penguins %>%
  ggplot(aes(x = island)) +
  geom_bar(fill = "steelblue", alpha = 0.8)

penguins %>%
  ggplot(aes(x = island)) +
  geom_bar(aes(fill = species),  # por defecto position es "stack" (se agrupan en vertical)
           width = 0.3) # width hace que la columna sea más o menos delgada

penguins %>%
  ggplot(aes(x = island)) +
  geom_bar(aes(fill = species), position = "dodge") # position dodge nos permite separar cada grupo


## Variables Numéricas ----

### Puntos: geom_point ----
# Relación entre dos medidas (ej. largo vs alto del pico).
# Aesthetics Dinámicos: color, size, shape, alpha, fill (si shape es del 21 al 25)
# Aesthetics Estáticos: stroke (grosor borde).

penguins %>%
  filter(!is.na(sex)) %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm)) +
  geom_point(aes(color = species, shape = sex), size = 3)

penguins %>%
  filter(!is.na(sex)) %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm)) +
  geom_point(aes(fill = species), size = 3, shape = 21, color = "white", stroke = 1) # color en este caso pasa a ser el color del borde

### Smooth ----

### Texto y Labels ----

### Texto y Labels: geom_text y geom_label ----
# Añade nombres o etiquetas. geom_label pone una caja de texto.
# Aesthetics Dinámicos: label (qué poner), color, fill, size.
# Aesthetics Estáticos: hjust, vjust, nudge_x, nudge_y, angle.

penguins %>%
  filter(body_mass_g > 6000) %>%
  ggplot(aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point() +
  geom_label(aes(label = species), 
             nudge_y = 20, # nudge_y indica el desplazamiendo desde el punto en vertical (hacia arriba)
             nudge_x = 0.2) # nudge_x indica el desplazamiendo desde el punto en horizontal (hacia la derecha)

## Variables Numéricas y Categóricas

### Jitter ----

### Boxplot ----

### Violin ----

## Funciones Continuas ----

### Líneas ----

### Líneas Horizontales y Verticales ----

## Tres variables ----

### HeatMap ----

## Puntos: geom_point y geom_jitter ----
# Ambas funciones se usan para generar gráficos de dispersión de puntos. La diferencia entre ambas es que,
# mientras geom_point va a colocar el punto exactamente donde se le indique, geom_jitter permite algo más de margen
# en cuanto a la exactitud, pudiendo ser útil cuando queremos ver un tipo de distribución concreta

# RECOMENDACIÓN: Usa geom_point para gráficos de dispersión de dos variables numéricas
penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm))+
  geom_point()

# usar geom_jitter no es correcto, los puntos no están en el lugar exacto
penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm))+
  geom_jitter()

# RECOMENDACIÓN: Usa geom_jitter cuando una de las variables es categórica y tienes muchos puntos
penguins %>%
  ggplot(aes(x = species, y = bill_depth_mm))+
  geom_jitter() # genera distribuciones al azar a lo ancho (en este caso)

# usar geom_point no es del todo incorrecto pero no queda elegante
penguins %>%
  ggplot(aes(x = species, y = bill_depth_mm))+
  geom_point()

### AESTHETIC Dinámicos ----
# Los AESTHETIC dinámicos de ambas funciones son: color, shape, size y alpha (sobretodo cuando queremos generar algo en blanco y negro)

penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm))+
  geom_point(aes(color = island)) # color usando variable categórica

penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm))+
  geom_point(aes(color = body_mass_g)) # color usando variable numérica

penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm))+
  geom_point(aes(shape = island)) # shape usando variable categórica

penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm))+
  geom_point(aes(shape = body_mass_g)) # shape no se puede usar con variable numéricas: ERROR

penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm))+
  geom_point(aes(size = island)) # size usando variable categórica

penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm))+
  geom_point(aes(size = body_mass_g)) # size usando variable numérica

penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm))+
  geom_point(aes(alpha = island)) # alpha usando variable categórica

penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm))+
  geom_point(aes(alpha = body_mass_g)) # alpha usando variable numérica

### AESTHETIC ESTÁTICOS ----
# Todos los anteriores
penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm))+
  geom_point(size = 5, color = "orange", alpha = 0.5, shape = 18)

# IMPORTANTE: Para añadir un borde de color a los puntos debemos cambiar su forma a una forma "filled" y
# colorear usando el AESTHETIC fill en vez de color.
# https://www.sthda.com/english/wiki/r-plot-pch-symbols-the-different-point-shapes-available-in-r
# geom_point usa por defecto shape = 19, si queremos poner un borde debemos buscar una forma "filled"

penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm))+
  geom_point(size = 5, fill = "orange", color = "gray80", shape = 21) # color es el color del borde, fill es el relleno

penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm))+
  geom_point(size = 5, aes(fill = species), shape = 21, alpha = 0.7) # fill también puede ser dinámico siempre que shape sea "filled"

penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm))+
  geom_point(size = 5, aes(fill = species), shape = 21, alpha = 0.7, stroke = 2) # stroke define el grosor del borde


# Además de los AESTHETIC anteriores, en el caso específico de geom_jitter tenemos dos más
penguins %>%
  ggplot(aes(x = species, y = bill_depth_mm))+
  geom_jitter(aes(color = species), alpha = 0.7, size = 3)

penguins %>%
  ggplot(aes(x = species, y = bill_depth_mm))+
  geom_jitter(aes(color = species), alpha = 0.7, size = 3, width = 0.2) # width define el ancho de los límites de la distribución

penguins %>%
  ggplot(aes(y = species, x = bill_depth_mm))+
  geom_jitter(aes(color = species), alpha = 0.7, size = 3, height = 0.2) # si la figura está en horizontal, el parámetro es height


#############################################################
# EJERCICIO 1
# Contexto:
# Relación entre el peso corporal (bodywt) y el tiempo total de sueño (sleep_total).
# Queremos observar si existe una tendencia de sueño según el tamaño del animal
# y diferenciar a los animales según su tipo de alimentación (vore).
#
# Enunciado:
# 1. Carga el dataset msleep.
# 2. Genera un gráfico de dispersión (puntos) con bodywt en el eje X y sleep_total en el eje Y.
# 3. Haz que el tamaño de los puntos dependa de la variable brainwt (peso del cerebro).
# 4. Usa una forma de punto "filled" (rellena), concretamente la shape 21.
# 5. Mapea el color de relleno (fill) a la variable "vore".
# 6. Establece el color del borde de los puntos en "white" y un grosor de borde (stroke) de 1.
#############################################################

# El estudiante debe completar a partir de aquí
data("msleep")



# SOLUCIÓN

msleep %>%
  filter(!is.na(vore)) %>%
  ggplot(aes(x = bodywt, y = sleep_total)) +
  geom_point(aes(size = brainwt, fill = vore), 
             shape = 21, 
             color = "white", 
             stroke = 1, 
             alpha = 0.8)


#############################################################
# EJERCICIO 2
# Contexto:
# Distribución del sueño REM según el orden taxonómico (order). 
# Al ser "order" una variable categórica con muchos niveles, un gráfico de puntos 
# simple mostraría solapamiento (overplotting).
#
# Enunciado:
# 1. Carga el dataset msleep.
# 2. Filtra el dataset para quedarte solo con los órdenes: "Primates", "Rodentia" y "Carnivora".
# 3. Genera un gráfico usando geom_jitter para ver la distribución de sleep_rem (eje Y) 
# por cada order (eje X).
# 4. Ajusta el ancho de la dispersión (width) a 0.2 para que no se mezclen las columnas.
# 5. Pinta los puntos según el género (vore) y ajusta el tamaño a 3.
#############################################################

# El estudiante debe completar a partir de aquí
data("msleep")



# SOLUCIÓN

msleep %>%
  filter(!is.na(vore)) %>%
  filter(order %in% c("Primates", "Rodentia", "Carnivora")) %>%
  ggplot(aes(x = order, y = sleep_rem)) +
  geom_jitter(aes(color = vore), 
              width = 0.2, 
              size = 3, 
              alpha = 0.7)



## Texto: geom_text y geom_label ----
# Similar a geom_point pero añadiendo texto en lugar de puntos. geom_text añade texto plano y geom_label añade etiquetas
# Es IMPRESCINDIBLE usar el AESTHETIC label, para indicar que texto se muestra

penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm))+
  geom_text(aes(label = species))

penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm))+
  geom_label(aes(label = species))

### AESTHETIC Dinámicos ----
# Los AESTHETIC dinámicos de ambas funciones son: color, fill y size
# Se usan con variables numéricas y categóricas

penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm))+
  geom_text(aes(color = island, label = species)) # color usando variable categórica

penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm))+
  geom_label(aes(color = body_mass_g, label = species)) # color usando variable numerica

penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm))+
  geom_label(aes(fill = island, label = species)) # fill usando variable categórica

penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm))+
  geom_label(aes(fill = body_mass_g, label = species)) # fill usando variable numerica

penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm))+
  geom_text(aes(size = island, label = species)) # size usando variable categórica


### AESTHETIC ESTÁTICOS ----
# Todos los anteriores
penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm))+
  geom_text(size = 4, color = "orange", aes(label = species))

# Hay otros estáticos: alpha, hjust, vjust, angle, nudge_x, nudge_y
penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm))+
  geom_text(size = 4, color = "orange", aes(label = species), alpha = 0.2)

penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm))+
  geom_text(size = 4, color = "orange", aes(label = species), angle = 60)

penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm))+
  geom_point() + 
  geom_text(size = 4, color = "orange", aes(label = species), vjust = 0) # vjust = 0 pone el texto justo encima del punto; vjust = 1 lo pone justo debajo

penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm))+
  geom_point() + 
  geom_text(size = 4, color = "orange", aes(label = species), hjust = 1) # hjust = 0 pone el texto justo a la derecha del punto; hjust = 1 lo pone justo a la izquierda

penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm))+
  geom_point() + 
  geom_text(size = 4, color = "orange", aes(label = species), nudge_x = 1) # indica cuantas unidades a la derecha (cuando es positivo se mueve el texto)

penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm))+
  geom_point() + 
  geom_text(size = 4, color = "orange", aes(label = species), nudge_y = 0.5) # indica cuantas unidades hacia arriba (cuando es positivo) se mueve el texto

#############################################################
# EJERCICIO 1
# Contexto:
# Queremos identificar visualmente a qué grupo de alimentación (vore) pertenecen los animales 
# comparando su tiempo total de sueño y su tiempo de sueño REM, usando etiquetas con fondo.
#
# Enunciado:
# 1. Carga el dataset msleep.
# 2. Genera un gráfico usando geom_label con sleep_total en el eje X y sleep_rem en el eje Y.
# 3. El texto de la etiqueta (label) debe ser la columna "name" del animal.
# 4. Haz que el color de relleno (fill) de la etiqueta dependa de la variable "vore".
# 5. Ajusta el tamaño del texto a 3 y aplica un alpha de 0.6 para que no sea totalmente opaco.
#############################################################

# El estudiante debe completar a partir de aquí
data("msleep")



# SOLUCIÓN

msleep %>%
  filter(!is.na(vore)) %>%
  ggplot(aes(x = sleep_total, y = sleep_rem)) +
  geom_label(aes(label = name, fill = vore), 
             size = 3, 
             alpha = 0.6)


#############################################################
# EJERCICIO 2
# Contexto:
# A veces queremos resaltar solo ciertos puntos de interés en un gráfico de dispersión. 
# En este caso, queremos ver la relación entre peso corporal (bodywt) y peso del cerebro (brainwt),
# pero solo queremos poner el nombre a los animales que pesan más de 500kg.
#
# Enunciado:
# 1. Carga el dataset msleep.
# 2. Genera un gráfico de puntos (geom_point) con bodywt en eje X y brainwt en eje Y.
# 3. Añade una capa de texto (geom_text) que solo muestre el nombre (name) de los animales
#    cuyo peso corporal (bodywt) sea superior a 500.
# 4. Usa vjust = 0 y nudge_y = 0.1 para que el texto quede ligeramente encima del punto.
# 5. Pon el texto en color "darkred" y fuente de tamaño 4.
#############################################################

# El estudiante debe completar a partir de aquí
data("msleep")



# SOLUCIÓN

msleep %>%
  filter(!is.na(vore)) %>%
  ggplot(aes(x = bodywt, y = brainwt)) +
  geom_point(color = "gray") +
  geom_text(data = msleep %>% filter(bodywt > 500, !is.na(vore)), 
            aes(label = name),
            vjust = 0, 
            nudge_y = 0.1,
            color = "darkred",
            size = 4)

## Líneas: geom_line ----
# Se utiliza para conectar puntos de datos en orden, generalmente para mostrar tendencias.
# Es fundamental que el eje X sea una variable continua o de tiempo.

# Ejemplo básico
penguins %>%
  arrange(bill_length_mm) %>% 
  ggplot(aes(x = bill_length_mm, y = body_mass_g)) +
  geom_line()

### AESTHETIC Dinámicos ----
# Los más comunes son: color, linetype y linewidth (antes size)

# Diferentes líneas por especie
penguins %>%
  ggplot(aes(x = bill_length_mm, y = body_mass_g)) +
  geom_line(aes(color = species))

# Diferentes estilos de línea por especie
penguins %>%
  ggplot(aes(x = bill_length_mm, y = body_mass_g)) +
  geom_line(aes(linetype = species))

### AESTHETIC ESTÁTICOS ----
# Podemos definir el aspecto de la línea de forma global
penguins %>%
  ggplot(aes(x = bill_length_mm, y = body_mass_g)) +
  geom_line(color = "steelblue", linewidth = 0.8, linetype = "dashed", alpha = 0.2)

# Combinar puntos y líneas
penguins %>%
  ggplot(aes(x = bill_length_mm, y = body_mass_g)) +
  geom_line(color = "gray") +
  geom_point(aes(color = species), size = 2)


#############################################################
# EJERCICIO 1
# Contexto:
# Queremos analizar si existe un patrón en la cantidad de horas despierto (awake) 
# en relación al peso corporal, pero solo para los animales del orden "Rodentia".
# Las líneas nos ayudan a ver la variabilidad de esta tendencia.
#
# Enunciado:
# 1. Carga el dataset msleep.
# 2. Filtra los datos para el orden "Rodentia".
# 3. Asegúrate de ordenar los datos por bodywt (usa arrange) para que la línea no salte atrás.
# 4. Genera un gráfico de líneas con bodywt en el eje X y awake en el eje Y.
# 5. Configura la línea con un color "darkgreen", un grosor (linewidth) de 1 y un linetype "dotted".
# 6. Añade una capa de puntos (geom_point) encima para identificar los valores exactos.
#############################################################

# El estudiante debe completar a partir de aquí
data("msleep")



# SOLUCIÓN

msleep %>%
  filter(order == "Rodentia") %>%
  arrange(bodywt) %>% 
  ggplot(aes(x = bodywt, y = awake)) +
  geom_line(color = "darkgreen", linewidth = 1, linetype = "dotted") +
  geom_point()

## Líneas de Referencia: geom_vline y geom_hline ----
# Estas funciones no dependen de las coordenadas (x, y) de los datos del mismo modo
# que otras, sino que dibujan líneas rectas en un punto específico del eje.
# Se suelen usar para marcar umbrales, medias o límites biológicos.

# RECOMENDACIÓN: Usa geom_hline para marcar un valor constante en el eje Y (ej. una media)
penguins %>%
  ggplot(aes(x = bill_length_mm, y = body_mass_g)) +
  geom_point() +
  geom_hline(yintercept = 4500, color = "red", linetype = "dashed") # yintercept es el único parámetro obligatorio

# RECOMENDACIÓN: Usa geom_vline para marcar un valor constante en el eje X (ej. un valor crítico)
penguins %>%
  ggplot(aes(x = bill_length_mm, y = body_mass_g)) +
  geom_point() +
  geom_vline(xintercept = 50, color = "blue", linewidth = 1.5)

### AESTHETIC Dinámicos ----
# Aunque se pueden mapear a variables, lo más común es calcular un estadístico (como la media)
# y pasarlo como el valor intercept.

media_body_mass <- mean(penguins$body_mass_g, na.rm = TRUE)

penguins %>%
  ggplot(aes(x = bill_length_mm, y = body_mass_g)) +
  geom_point() +
  geom_hline(aes(yintercept = media_body_mass), color = "darkgreen")

### AESTHETIC ESTÁTICOS ----
# Funcionan igual que en geom_line: color, linewidth, linetype y alpha.
penguins %>%
  ggplot(aes(x = bill_length_mm, y = body_mass_g)) +
  geom_point() +
  geom_hline(yintercept = 4500, color = "purple", linetype = "dotdash", linewidth = 1, alpha = 0.2)


#############################################################
# EJERCICIO 1
# Contexto:
# Queremos analizar el sueño REM de los mamíferos. Se considera que un animal tiene
# un sueño REM "elevado" si supera las 3 horas. Además, nos interesa marcar 
# el peso del elefante africano (African elephant) para ver su posición relativa.
#
# Enunciado:
# 1. Carga el dataset msleep. Guarda el peso del elefante africano ("African elephant")
# 2. Crea un gráfico de dispersión (geom_point) con bodywt en el eje X y sleep_rem en el eje Y.
# 3. Añade una línea horizontal (geom_hline) en el valor 3 para marcar el umbral de sueño REM.
#    Ponle color "red" y estilo "dashed".
# 4. Añade una línea vertical (geom_vline) que marque el peso (bodywt) del "African elephant".
# 5. Haz que esta línea vertical sea de color "orange" y tenga un grosor (linewidth) de 0.5
#############################################################

# El estudiante debe completar a partir de aquí
data("msleep")



# SOLUCIÓN

peso_elefante <- msleep %>% filter(name == "African elephant") %>% pull(bodywt)

msleep %>%
  ggplot(aes(x = bodywt, y = sleep_rem)) +
  geom_point(alpha = 0.6) +
  geom_hline(yintercept = 3, color = "red", linetype = "dashed") +
  geom_vline(xintercept = peso_elefante, color = "orange", linewidth = 0.5)

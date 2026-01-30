library(palmerpenguins)
library(tidyverse)

# 1. Crea un nuevo objeto llamado penguins_clean realizando las siguientes operaciones:

# Elimina las filas que tengan valores faltantes (NA) en las columnas sex, body_mass_g y flipper_length_mm.
# Crea una nueva columna llamada flipper_index que sea el resultado de dividir body_mass_g entre flipper_length_mm.
# Crea una columna llamada size_category. Si body_mass_g es mayor a 4000, etiquétalo como "Grande", de lo contrario "Pequeño" (usa ifelse).
# Quédate solo con las columnas: species, island, sex, year, flipper_index y size_category.


# 2. Distribución de Densidad

# Objetivo: Ver la distribución del flipper_index por especie.
# Requisitos: * Eje X: flipper_index.
# Color de relleno (fill): species.
# Usa geom_density con una transparencia (alpha) de 0.5.
# Añade theme_minimal() y un título descriptivo.


# 3. Comparativa por Isla y Sexo (Facetas)

# Objetivo: Comparar el índice entre machos y hembras en las diferentes islas.
# Requisitos: Eje X: sex, Eje Y: flipper_index.
# Geometría: geom_boxplot (colorear por sexo, outlier.shape = NA) y encima un geom_jitter para ver los puntos individuales (con width = 0.2)
# Facetas: Divide el gráfico por island.
# Usa una escala de colores manual (scale_fill_manual) con tus dos colores favoritos.


# 4. Evolución Temporal
# Objetivo: ¿Ha cambiado el índice medio a lo largo de los años?
# Requisitos: Primero, agrupa por year y species y calcula la media del flipper_index.
# Dibuja un geom_line y un geom_point donde el color sea la especie.
# Cambia el tamaño de los puntos a 3.
# Usa labs() para renombrar los ejes a "Año" e "Índice de Aleta".


#### SOLUCIÓN ####

# 1
penguins_clean <- penguins %>%
  filter(!is.na(sex), !is.na(body_mass_g), !is.na(flipper_length_mm)) %>%
  mutate(flipper_index = body_mass_g / flipper_length_mm,
         size_category = ifelse(body_mass_g > 4000, "Grande", "Pequeño")) %>%
  select(species, island, sex, year, flipper_index, size_category)

# 2
ggplot(penguins_clean, aes(x = flipper_index, fill = species)) +
  geom_density(alpha = 0.5) + # Transparencia para ver solapamientos
  theme_minimal() +
  labs(
    title = "Distribución del Índice de Aleta por Especie",
    x = "Índice (Masa / Largo de Aleta)",
    y = "Densidad",
    fill = "Especie"
  )


# 3
ggplot(penguins_clean, aes(x = sex, y = flipper_index, fill = sex)) +
  geom_boxplot(outlier.shape = NA, alpha = 0.7) + # Boxplot base
  geom_jitter(width = 0.2, alpha = 0.3) +        # Puntos para ver la dispersión
  facet_wrap(~island) +                          # Dividir por isla
  scale_fill_manual(values = c("female" = "#f1a340", "male" = "#998ec3")) +
  theme_bw() +
  labs(
    title = "Índice de Aleta por Sexo e Isla",
    x = "Sexo",
    y = "Índice de Masa de la Aleta",
    fill = "Sexo"
  )


# 4
penguins_clean %>%
  group_by(year, species) %>%
  summarise(mean_index = mean(flipper_index, na.rm = TRUE)) %>%
  ungroup() %>%
  ggplot(aes(x = year, y = mean_index, color = species)) +
  geom_line(linewidth = 1) +  # Línea de tendencia
  geom_point(size = 3) +     # Puntos en cada año
  scale_x_continuous(breaks = c(2007, 2008, 2009)) + # Forzar años enteros
  theme_minimal() +
  labs(
    title = "Evolución Anual del Índice Medio",
    x = "Año",
    y = "Índice de Aleta Medio",
    color = "Especie"
  )

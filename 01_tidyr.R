# TIDYR ----
library(tidyverse)

## Pasar de untidy a tidy. pivot_longer() ----
# El uso de pivot_longer es:
# untidy %>% pivot_longer(cols = columnas que quiero convertir a variable,
                          #  names_to = nombre de esta nueva columna, 
                          #  values_to = nombre de la columna que almacena valores)

ventas_fruta <- data.frame(
  Producto = c("Manzanas", "Peras", "Plátanos", "Uvas", "Naranjas"),
  Enero = c(100, 120, 150, 80, 90),
  Febrero = c(110, 130, 160, 85, 95),
  Marzo = c(105, 125, 155, 82, 92)
)

ventas_tidy <- ventas_fruta %>%
  pivot_longer(
    cols = c(Enero, Febrero, Marzo), # Las columnas que queremos "colapsar", no es necesario poner comillas
    names_to = "Mes",                # El nombre de la nueva columna de categorías
    values_to = "Cantidad"           # El nombre de la nueva columna de valores
  )

# Un caso especial es cuando tenemos en nuestro dataframe nombres de filas
matriz_expresion <- matrix(rnorm(100000), nrow = 1000) # matriz de 1000 filas y 100 columnas
colnames(matriz_expresion) <- paste0("Ind_", 1:ncol(matriz_expresion))
rownames(matriz_expresion) <- paste0("Gen_", 1:nrow(matriz_expresion))
dataframe_expression <- as.data.frame(matriz_expresion)

tidy_expression <- dataframe_expression %>%
  rownames_to_column("Gen") %>% # crea una nueva columna llamada Gen con el valor de las filas
  pivot_longer(cols = colnames(matriz_expresion), # Las columnas que queremos colapsar son todas las de la matriz
               names_to = "Individuo", # el nombre de la nueva columna de categorías
               values_to = "Expresion") # el nombre de la nueva columna de valores

## Pasar de tidy a untidy. pivot_wider() ----
# El uso de pivot_wider es:
# tidy %>% pivot_wider(names_from = nombre de la columna que queremos expandir, 
#  values_from = nombre de la columna que almacena valores que irán en las celdas)

ventas_untidy <- ventas_tidy %>%
  pivot_wider(
    names_from = Mes,      # ¿De qué columna sacamos los nuevos encabezados?
    values_from = Cantidad  # ¿De qué columna sacamos los números?
  )

# Volviendo al caso especial de los rownames, usamos de apoyo la función column_to_rownames
untidy_expression <- tidy_expression %>%
  pivot_wider(names_from = Individuo, values_from = Expresion) %>%
  column_to_rownames("Gen") %>%
  as.matrix()


############################################################
# EJERCICIO 1
# Contexto:
# Transformación de datos de un ensayo clínico de formato ancho 
# (untidy) a formato largo (tidy) y viceversa, a partir del dataframe inicial.
#
# Enunciado:
# 1. Transformación a formato TIDY (Largo).
# 2. Operación Inversa (Volver a formato ancho).
#############################################################

# El estudiante debe completar a partir de aquí

ensayo_clinico <- data.frame(
  Paciente_ID = c("P01", "P02", "P03", "P04"),
  T0 = c(0.0, 0.0, 0.0, 0.0),
  T1 = c(12.5, 15.2, 11.8, 14.0),
  T2 = c(8.4, 9.1, 7.5, 8.8)
)






# SOLUCIÓN

ensayo_tidy <- ensayo_clinico %>% 
  pivot_longer(
    cols = c(T0, T1, T2),
    names_to = "Tiempo",
    values_to = "Concentracion"
  )

ensayo_back_to_wide <- ensayo_tidy %>%
  pivot_wider(
    names_from = Tiempo,
    values_from = Concentracion
  )



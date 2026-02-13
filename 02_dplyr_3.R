matriz_expresion <- matrix(rnorm(100000), nrow = 1000) 
colnames(matriz_expresion) <- paste0("Ind_", 1:ncol(matriz_expresion))
rownames(matriz_expresion) <- paste0("Gen_", 1:nrow(matriz_expresion))
dataframe_expression <- as.data.frame(matriz_expresion)

tidy_expression <- dataframe_expression %>%
  rownames_to_column("Gen") %>% 
  pivot_longer(cols = colnames(matriz_expresion), 
               names_to = "Individuo", 
               values_to = "Expresion")

metadata <- tibble(Individuo = paste0("Ind_", 1:ncol(matriz_expresion)),
                       Glucosa = rnorm(ncol(matriz_expresion), mean = 75, sd = 2),
                       Grupo = rep(c("Caso", "Control"), each = ncol(matriz_expresion)/2))

tidy_expression %>%
  left_join(metadata, by = c("Individuo" = "Individuo"))


# Unir Tablas ----

## Funciones _join() ----
# Funciones para unir dos tablas usando una clave (columna) común entre ellas

# inner_join() -> Une las filas con claves en ambos datasets
# left_join() -> Mantiene todas las filas del primer dataset, independientemente de que en el segundo falte alguna (Rellena con NA)
# right_join() -> Mantiene todas las filas del segundo dataset, independientemente de que en el primero falte alguna (Rellena con NA)
# full_join() -> Mantiene todas las filas en ambos datasets, aunque hay alguna que falte en alguno de ellos (rellena con NA)

## Uso _join() ----
# Además de las dos tablas que se quieren unir, se usa el parámetros by de las funciones _join.
# by indica que clave se utiliza en cada tabla by = c("Clave primer tabla" = "Clave segunda tabla")
# La primera tabla es siempre la de la izquierda, la segunda tabla es la de la derecha
tidy_expression %>% # primera tabla
  left_join(
    metadata, # segunda tabla
    by = c("Individuo" = "Individuo") # indicamos la clave en cada tabla
  )

# en caso que ambas tablas tengan la misma clave, podemos obviar usar by ya que las funciones
# buscarán columnas en común
tidy_expression %>% # primera tabla
  left_join(
    metadata, # segunda tabla
  )

## Ejemplo de cada _join ----

metadata_casos <- metadata %>%
  filter(Grupo != "Caso")

### inner_join() ----
tidy_expression %>%
  inner_join(metadata_casos) # solo une las filas de ambas tablas que estén en ambos datasets

### left_join() ----
tidy_expression %>%
  left_join(metadata_casos) # mantiene filas de la primera tabla aunque no estén en la segunda

### right_join() ----
tidy_expression_some <- tidy_expression %>%
  head(20)
tidy_expression_some %>%
  right_join(metadata_casos) # mantiene filas de la segunda tabla aunque no estén en la primera

### full_join() ----
tidy_expression_some %>%
  full_join(metadata_casos) # mantiene todas las filas de ambas columnas


#############################################################
# EJERCICIO 1
# Contexto:
# En Bioinformática, uno de los retos más comunes es analizar datos de RNA-Seq.
# Para ilustrar un ejemplo, se va a instalar la librería DESeq2 de Bioconductor
# que almacena un set de datos de prueba con counts y anotación de muestras.
#
# Enunciado:
# 1. Carga los datasets de counts (cts) y anotación (coldata)
# 2. Transforma "coldata" en tidy añadiendo el nombre de las filas a una columna, también hay que eliminar 
# el 'fb' del final
# 3. Transforma la matriz de counts a tidy (LARGO). Intenta llamar a la columna de muestras
# igual que se llama en coldata
# 4. Filtra los genes para mantener los 10 primeros
# 5. Une cts y coldata
#############################################################

# El estudiante debe completar a partir de aquí
install.packages("BiocManager") # instalar bioconductor
BiocManager::install("DESeq2") # instalar DESeq2
pasCts <- system.file("extdata", # obtener ruta a fichero de counts
                      "pasilla_gene_counts.tsv.gz",
                      package="DESeq2", mustWork=TRUE)
pasAnno <- system.file("extdata", # obtener ruta a fichero de anotación
                       "pasilla_sample_annotation.csv",
                       package="DESeq2", mustWork=TRUE)

cts <- as.matrix(read.csv(pasCts,sep="\t",row.names="gene_id")) # Leer fichero de counts
coldata <- read.csv(pasAnno, row.names=1) # Leer fichero de anotación


# SOLUCIÓN

coldata <- coldata %>%
  rownames_to_column("Muestra") %>%
  mutate(Muestra = gsub("fb", "", Muestra))

cts <- cts %>%
  as.data.frame() %>%
  rownames_to_column("Gen") %>%
  pivot_longer(cols = colnames(cts), names_to = "Muestra", values_to = "Expresion")

genes <- unique(cts$Gen)[1:10]
cts <- cts %>%
  filter(Gen %in% genes)

cts %>%
  left_join(coldata)
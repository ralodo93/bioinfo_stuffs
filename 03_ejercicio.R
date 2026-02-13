#############################################################
# EJERCICIO 
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
# 4. Transforma la columna expresión en log2 (usa log2(Expresion + 1)). Llama a la tabla
# cts_log2
# 5. Calcula la varianza de expresión de cada gen de la tabla cts_log2. Usa la función var() (similar a mean, sd etc) 
# Filtra los genes para quedarnos con el 10% con varianza más alta. Mira la ayuda de slice_head().
# Llama a la tabla cts_log2_filtrado
# 6. Une las tablas cts_log2_filtrado y coldata. Llama a la tabla cts_coldata
# 7. Calcula la media de cada Gen en cada Grupo (condition). Llama a la tabla gene_stats
# 8. Calcula la diferencia de medias de cada Gen (treated - untreated). Ordénalas de mayor a menor en valor absoluto. Para ello transforma
# la tabla gene_stats a formato ancho. Muestra las columnas Gen y diff
# 9. Repite los pasos 7 y 8 pero en vez de por condition usando la columna type
#############################################################

# El estudiante debe completar a partir de aquí
#install.packages("BiocManager") # instalar bioconductor
#BiocManager::install("DESeq2") # instalar DESeq2
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

cts_log2 <- cts %>%
  mutate(Expresion = log2(Expresion + 1))

genes_alta_varianza <- cts_log2 %>%
  group_by(Gen) %>%
  summarise(var = var(Expresion)) %>%
  ungroup() %>%
  arrange(desc(var)) %>%
  slice_head(prop = 0.1) %>%
  pull(Gen)
cts_log2_filtrado <- cts_log2 %>%
  filter(Gen %in% genes_alta_varianza)

cts_coldata <- cts_log2_filtrado %>%
  inner_join(coldata)

gene_stats <- cts_coldata %>%
  group_by(Gen, condition) %>%
  summarise(media = mean(Expresion)) %>%
  ungroup()

diferencia_medias <- gene_stats %>%
  pivot_wider(names_from = condition, values_from = media) %>%
  mutate(diff = treated - untreated,
         diff_abs = abs(diff)) %>%
  arrange(desc(diff_abs)) %>%
  select(Gen, diff)

gene_stats <- cts_coldata %>%
  group_by(Gen, type) %>%
  summarise(media = mean(Expresion)) %>%
  ungroup()
diferencia_medias <- gene_stats %>%
  pivot_wider(names_from = type, values_from = media) %>%
  mutate(diff = `single-read` - `paired-end`, # cuando los nombres de las columnas tienen caracteres no permitidos, podemos usar `nombre-columna` para forzarlo
         diff_abs = abs(diff)) %>%
  arrange(desc(diff_abs)) %>%
  select(Gen, diff)


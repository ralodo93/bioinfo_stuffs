# Creamos una matriz de 5000 genes (filas) x 100 muestras (columnas)
set.seed(123) # Para que todos tengamos los mismos números
datos_genes <- matrix(rnorm(5000 * 100, mean = 5, sd = 2), nrow = 5000)

# Ponemos nombres a las muestras
colnames(datos_genes) <- c(paste0("Sano_", 1:50), paste0("Enfermo_", 1:50))
rownames(datos_genes) <- paste0("Gene_", 1:5000)

# Convertimos a data.frame para trabajar como hemos aprendido
df_expresion <- as.data.frame(datos_genes)

# Inspeccionar los datos (head, dim, nrow, ncol)

# Crea una variable llamada Media_Sanos que calcule la media de expresión de cada gen en las muestras sanas (columnas 1 a 50)
# Intenta hacerlo con lo que sabes hasta ahora (bucles for)

# Ahora hazlo usando la función rowMeans() -> Recuerda usar la ayuda ?rowMeans()


# Crea una variable llamada Media_Enfermos que calcule la media de expresión de cada gen en las muestras enfermas (columnas 51 a 100).
# Hazlo por cualquiera de los dos métodos (bucle o función rowMeans)

# Crea una nueva columna en el data.frame llamada Diferencia que reste la media de expresión en enfermos menos la media en sanos.

# Crea una función llamada Clasificar_Genes que tome como argumento la diferencia de expresión y devuelva:
# "Sobreexpresado" si la diferencia es mayor que 2
# "Subexpresado" si la diferencia es menor que -2
# "No diferencial" si la diferencia está entre -2 y 2

# Crea un data.frame llamado Genes_de_Interes que contenga solo los genes que estén sobreexpresados o subexpresados según la función anterior.
# Tip: Crea una nueva Columna llamada Estado
# bucle for { df_expression$Estado <- Clasificar_Genes() }
# filtrar genes columnas df_expression

# Imprime el data.frame Genes_de_Interes para ver los resultados

# Crea un fichero CSV llamado "genes_diferenciales.csv" que contenga el data.frame Genes_de_Interes
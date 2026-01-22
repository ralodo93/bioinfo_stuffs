# Hasta ahora solo hemos usado un set de funciones que vienen precargadas en R. 
# Sin embargo, en la mayoría de los casos querremos usar funciones desarrolladas por otras personas 
# que acometen una función específica. Estas funciones se almacenan en lo que se conoce como librerías, 
# que debemos instalar (solo una vez) y cargar (una vez en cada sesión).

# Las librerías son muy diversas, las hay para manipular tablas (dplyr), generar gráficos (ggplot2), 
# analizar datos de RNA-Seq (DESeq2) etc.

# Las librerías suelen estar en CRAN (repositorio de R), aunque algunas muy especializadas estarán en Bioconductor.


## Instalar una librería que no tenemos:

# install.packages("nombre_librería") | Solo CRAN

install.packages("BiocManager") # Bioconductor
install.packages("tidyverse") # tidyverse, lo usaremos mañana

# instalar librería de Bioconductor
BiocManager::install("DESeq2")

## Cargar una librería

# library(nombre_librería)
library(tidyverse)

# Ejemplo Completo

# la librería fortunes tiene una función llamada fortune() que muestra una cita aleatoria de la comunidad de R

fortune() # si la usamos sin cargar, nos dará error

# para usarla debemos: instalarla, cargarla y usarla
install.packages("fortunes")
library(fortunes)
fortune()

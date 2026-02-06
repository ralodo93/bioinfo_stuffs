## Simulación Población de Ratones ##

# Una población de ratones de una ubicación presentan un fenotipo de color con dos variantes (Negro y Blanco).
# Este fenotipo está controlado por un gen cuyos posibles alelos presentan dominancia (N > b).
# Por lo tanto aquellos ratones con genotipo NN o Nn serán de color negro, mientras que los de color blanco serán nn

# 1) Carga los parámetros de este experimento, localizados en el fichero "parametros.RDS", llama a la variable parametros

# 2) Simula la población inicial. Crea un dataframe con las columnas: ID (Raton_x), Genero, Genotipo y Fenotipo. 
# El tamaño de la población inicial está en parametros
set.seed(158)
parametros


# 3) Teniendo en cuenta las tasas de supervivencia de cada fenotipo (parametros$pN para Negros y parametros$pB para Blancos),
# añade estos valores a una nueva columna de la tabla p0, asignando el valor a cada ratón. Añade otra columna, con valores aleatorios entre 0 y 1
# llamada tasa_mortalidad

# 4) Filtra aquellos ratones cuya tasa_mortalidad sean menores que la tasa_supervivencia. Llama a la tabla supervivientes

# 5) Vamos a empezar a programar la simulación de la siguiente generación, para ello usamos la tabla supervivientes. Lo
# primero que debemos hacer es buscar las parejas de hembras y machos, vamos a suponer que son parejas monógamas.
# Busca el número máximo de parejas

# 6) De forma aleatorio selecciona los machos y las hembras que forman cada pareja (con la columna ID). 
# Supongamos que hembras[1] es la pareja de machos[1]

# 7) Genera una función llamada cruzar_raton que, a partir del genotipo de su padre y su madre, resulte en el Genotipo del hijo (también al azar)
# Testéala con: 
cruzar_raton("Nb", "bb")


set.seed(2026)
parametros <- readRDS("parametros.RDS")

ids <- paste0("Raton_",seq(1:parametros$n_inicial))
genero <- sample(c("macho","hembra"), size = parametros$n_inicial, replace = TRUE)
genotipo <- sample(c("NN", "Nb", "bb"), size = parametros$n_inicial, replace = TRUE)
fenotipo <- ifelse(genotipo == "bb", "Blanco", "Negro")
p0 <- data.frame(ID = ids, Genero = genero, Genotipo = genotipo, Fenotipo = fenotipo)

p0$tasa_superviviencia <- ifelse(p0$Fenotipo == "Negro", parametros$pN, parametros$pB)
p0$tasa_mortalidad <- runif(parametros$n_inicial)

supervivientes <- p0[p0$tasa_superviviencia > p0$tasa_mortalidad,]

hembras <- supervivientes[supervivientes$Genero == "hembra",]
machos <- supervivientes[supervivientes$Genero == "macho",]
n_parejas <- min(c(nrow(hembras), nrow(machos)))

hembras <- sample(hembras$ID, n_parejas)
machos <- sample(machos$ID, n_parejas)

cruzar_raton <- function(genotipo_p, genotipo_m){
  
}


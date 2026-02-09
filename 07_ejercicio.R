## Simulación Población de Ratones ##

# Una población de ratones de una ubicación presentan un fenotipo de color con dos variantes (Negro y Blanco).
# Este fenotipo está controlado por un gen cuyos posibles alelos presentan dominancia (N > b).
# Por lo tanto aquellos ratones con genotipo NN o Nn serán de color negro, mientras que los de color blanco serán nn

# 1) Carga los parámetros de este experimento, localizados en el fichero "parametros.RDS", llama a la variable parametros

# 2) Simula la población inicial. Crea un dataframe con las columnas: ID (Raton_x), Genero, Genotipo y Fenotipo. 
# El tamaño de la población inicial está en parametros. Añade 5 NA aleatorios a las columnas Genero y Genotipo. Después elimina los NA
set.seed(2026)
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

# 7) Genera una función llamada obtener_hijo que, a partir del genotipo de su padre y su madre, resulte en el Genotipo del hijo (también al azar)
# Testéala con: 
obtener_hijo("Nb", "bb")

# truco, divide la función de forma modular. Haz una función para obtener los posibles alelos de cada progenitor

# 8) Aplicando un bucle for en donde cada iteración se coja a una pareja, simula el número de hijos que tendrá dicha pareja (parametros$n_hijos)
# y crea un dataframe con la nueva generación. Recuerda simular también el género de los hijos


# 9) Repite el proceso para 5 generaciones. Crea una función que simule cada generación y aplícala 5 veces

# 1
parametros <- readRDS("parametros.RDS")

# 2
set.seed(2026)
ids <- paste0("Raton_",seq(1:parametros$n_inicial))
genero <- sample(c("macho","hembra"), size = parametros$n_inicial, replace = TRUE)
na_genero <- sample(1:parametros$n_inicial, size = 5)
genero[na_genero] <- NA
genotipo <- sample(c("NN", "Nb", "bb"), size = parametros$n_inicial, replace = TRUE)
na_genotipo <- sample(1:parametros$n_inicial, size = 5)
genotipo[na_genotipo] <- NA
fenotipo <- ifelse(genotipo == "bb", "Blanco", "Negro")
p0 <- data.frame(ID = ids, Genero = genero, Genotipo = genotipo, Fenotipo = fenotipo)
p0 <- na.omit(p0)

# 3
p0$tasa_superviviencia <- ifelse(p0$Fenotipo == "Negro", parametros$pN, parametros$pB)
p0$tasa_mortalidad <- runif(nrow(p0))

# 4
supervivientes <- p0[p0$tasa_superviviencia > p0$tasa_mortalidad,]

# 5
hembras <- supervivientes[supervivientes$Genero == "hembra",]
machos <- supervivientes[supervivientes$Genero == "macho",]
n_parejas <- min(c(nrow(hembras), nrow(machos)))

# 6
hembras <- sample(hembras$ID, n_parejas)
machos <- sample(machos$ID, n_parejas)

# 7
obtener_alelos <- function(genotipo){
  alelos <- unlist(strsplit(genotipo, ""))
  return(alelos)
}

obtener_alelos("Nb")

obtener_hijo <- function(genotipo_p, genotipo_m){
  alelos_padre <- obtener_alelos(genotipo_p)
  alelo_padre <- sample(alelos_padre, size = 1)
  alelos_madre <- obtener_alelos(genotipo_m)
  alelo_madre <- sample(alelos_madre, size = 1)
  genotipo_hijo <- paste0(alelo_padre, alelo_madre)
  if (genotipo_hijo == "bN"){
    genotipo_hijo <- "Nb"
  }
  return(genotipo_hijo)
}

obtener_hijo("Nb", "bb")

# 8
p1 <- data.frame(Genotipo = "", Fenotipo = "")[0,]
for (i in 1:length(machos)){
  macho <- machos[i]
  hembra <- hembras[i]
  pareja <- supervivientes[supervivientes$ID %in% c(macho, hembra),]
  n_hijos <- sample(1:parametros$n_hijos, size = 1)
  for (hijo in 1:n_hijos){
    genotipo <- obtener_hijo(pareja$Genotipo[1], pareja$Genotipo[2])
    add_fila <- data.frame(Genotipo = genotipo, 
                           Fenotipo = ifelse(genotipo == "bb", "Blanco", "Negro"))
    p1 <- rbind(p1, add_fila)
  }
}

p1$Genero <- sample(c("macho","hembra"), size = nrow(p1), replace = TRUE)
p1$ID <- paste0("Raton_",seq(1:nrow(p1)))

# 9
simular_generacion <- function(p0, parametros){
  p0$tasa_superviviencia <- ifelse(p0$Fenotipo == "Negro", parametros$pN, parametros$pB)
  p0$tasa_mortalidad <- runif(nrow(p0))
  
  supervivientes <- p0[p0$tasa_superviviencia > p0$tasa_mortalidad,]
  
  hembras <- supervivientes[supervivientes$Genero == "hembra",]
  machos <- supervivientes[supervivientes$Genero == "macho",]
  n_parejas <- min(c(nrow(hembras), nrow(machos)))
  
  hembras <- sample(hembras$ID, n_parejas)
  machos <- sample(machos$ID, n_parejas)
  
  p1 <- data.frame(Genotipo = "", Fenotipo = "")[0,]
  for (i in 1:length(machos)){
    macho <- machos[i]
    hembra <- hembras[i]
    pareja <- supervivientes[supervivientes$ID %in% c(macho, hembra),]
    n_hijos <- sample(1:parametros$n_hijos, size = 1)
    for (hijo in 1:n_hijos){
      genotipo <- obtener_hijo(pareja$Genotipo[1], pareja$Genotipo[2])
      add_fila <- data.frame(Genotipo = genotipo, 
                             Fenotipo = ifelse(genotipo == "bb", "Blanco", "Negro"))
      p1 <- rbind(p1, add_fila)
    }
  }
  
  p1$Genero <- sample(c("macho","hembra"), size = nrow(p1), replace = TRUE)
  p1$ID <- paste0("Raton_",seq(1:nrow(p1)))
  return(p1)
}

for (i in 1:5){
  p0 <- simular_generacion(p0, parametros)
}


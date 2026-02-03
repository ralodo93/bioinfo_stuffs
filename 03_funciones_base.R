#### Funciones ####

### Concepto ###
# Una función es un bloque de código que se utiliza para procesar una serie de datos de forma definida
# Aunque podemos crear nuestras propias funciones (y las crearemos), en primer lugar vamos a ver como se usan
# Y algunas de las funciones más útiles que podemos utilizar en R.

## Usar funciones ##
# Estructura básica #
# Para usar una función simplemente debemos poner su nombre y entre paréntesis los argumentos de dicha función
# nombre_funcion(argumentos)
exp(20) # La función exp calcula el exponencial del número que se le indique

# Acceso a la ayuda de una función #
# Si queremos acceder a la ayuda de una función, ponemos un símbolo ? antes del nombre de la función
# ?nombre_funcion
?exp

# MINIRETO: Acceder a la ayuda de la función sum, adivina para que sirve y usa uno de los ejemplos



## Argumentos ##
# Los argumentos de una función hacen referencia a los datos de entrada que tiene dicha función.
# En el ejemplo de la función exp() vimos que el único argumento de entrada era un argumento x
# que además es un número o vector numérico
?exp

# Sin embargo, las funciones suelen ser más complejas con respecto a los argumentos.
?log # log() tiene como argumentos: x (vector o número) y base (vector o número, positivos)
# De ambos argumentos, el argumento base tiene por defecto el valor exp(1)
# Esto quiere decir que, siempre que no se diga lo contrario, por defecto va a usar este valor
# El otro argumento, x, como no tiene valor por defecto, siempre se requiere
log() # da error, el valor x se requiere
log(10) # logaritmo en base exp(1) de 10
log(10, base = 2) # logaritmo en base 2 de 10

# Argumentos por nombre de argumento #
# Los argumentos de las funciones pueden utilizarse asignando al nombre de dicho argumento un valor
# Siempre, sobretodo al principio, con funciones complejas etc es recomendable usar los nombres de los argumentos
# para tener un control más seguro de como funciona la función
log(x = 10, base = 2)
exp(x = 5)

# Argumentos por orden #
# Cuando controlamos mucho una función podemos ahorrarnos algo de código añadiendo los argumentos en el orden en el que están dispuestos
# En el caso de la función log(), el primer argumento es x y el segundo es base, por lo que podemos escribir directamente
log(10, 2)

# Os recomiendo solo hacer esto en los casos en los que controleis la función perfectamente y siempre que la función sea simple como ésta

# MINIRETO: Pide ayuda sobre la función round(), analiza para que sirve, 
# sus argumentos y úsala con el número 5.6467864468746 (tanto por defecto como con 3 dígitos)
# ¿Podrías usar esta función sin definir los argumentos?


## Funciones Anidadas ##
# Podemos utilizar una función dentro de otra. Siempre se ejecutan de dentro a fuera
# Calcula el log(10, 2); redondea el resultado
round(x = log(10, 2), digits = 3) # primero se aplica el logaritmo (función de dentro) y al resultado se le aplica la función round()

# MINIRETO: redonde a 4 decimales el resultado de la raíz cuadrada de 5 elevado a 3

# Errores típicos al usar funciones #

# Usar argumentos de forma errónea (tipo incorrecto)
?mean # la función mean pide un vector numérico
mean(c("Hola", "Hello")) # pero si introducimos algo que no sea numérico nos dará un resultado incierto (y, en este caso, un warning)


# Hemos visto que existen una serie de funciones que nos permite conocer información hacerca de un vector numérico (media, mediana etc)
# Este grupo de funciones suelen plantear un problema en el que siempre vamos a caer
# El problema de estas funciones es que, si en el vector de entrada hay un NA, no puede realizar la operación con un NA y
# dará un resultado incierto
vector_con_NA <- c(10, NA, 15, 25, 8)
mean(vector_con_NA) # devuelve NA

?mean # si miramos en la ayuda, vemos que mean (y el resto de funciones) tienen un parámetro llamado na.rm, que por defecto es FALSE
# Este parámetro le dice a la función que no debe eliminar los NA del vector de entrada, por lo que al hacer cualquier operación
# el resultado es NA
sum(vector_con_NA)
max(vector_con_NA)

# Soluciones; hay dos soluciones simples: 1) cambiar este parámetro a TRUE para que elimine los NA o eliminar los NA antes de usar la función
mean(vector_con_NA, na.rm = TRUE) # solución 1
vector_sin_NA <- na.omit(vector_con_NA) # solución 2
mean(vector_sin_NA)


### Librerías ###

# Hasta ahora solo hemos usado un set de funciones que vienen precargadas en R. 
# Sin embargo, en la mayoría de los casos querremos usar funciones desarrolladas por otras personas 
# que acometen una función específica. Estas funciones se almacenan en lo que se conoce como librerías, 
# que debemos instalar (solo una vez) y cargar (una vez en cada sesión).

# Las librerías son muy diversas, las hay para manipular tablas (dplyr), generar gráficos (ggplot2), 
# analizar datos de RNA-Seq (DESeq2) etc.

# Las librerías suelen estar en CRAN (repositorio de R), aunque algunas muy especializadas estarán en Bioconductor.


## Instalar y Cargar ##

# install.packages("nombre_librería") | Solo CRAN

install.packages("BiocManager") # Bioconductor
install.packages("tidyverse") # tidyverse, lo usaremos mañana

# instalar librería de Bioconductor
BiocManager::install("DESeq2")

# Cargar una librería

# library(nombre_librería)
library(tidyverse)

# Ejemplo Completo

# la librería fortunes tiene una función llamada fortune() que muestra una cita aleatoria de la comunidad de R

fortune() # si la usamos sin cargar, nos dará error

# para usarla debemos: instalarla, cargarla y usarla
install.packages("fortunes")
library(fortunes)
fortune()

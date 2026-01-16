### Concepto de Variable
## ¿Qué son?
# Una variable es un "contenedor" con un nombre que almacena un valor o datos.
# Nos permite reutilizar información a lo largo del código sin escribirla de nuevo.

## ¿Cómo se asignan?
# En R se utiliza preferentemente el operador <- (ALT + Guión (-)).
# Aunque el signo = también funciona, <- es la norma de estilo en R.
# Estructura => nombre_variable <- valor_variable
# IMPORTANTE: Intentad siempre usar nombres de variables que sean explicativos, sobretodo para entender bien el código
# Si quiero asignar un valor de un precio de un producto, es preferible llamar a esa variable
# 'precio_producto' o 'precio' a llamarlo 'a', 'veteasaber'
# IMPORTANTE: Los nombres de las variables no llevan espacios, ni guiones
# INCORRECTO - nombre producto nombre-producto
# CORRECTO - nombre_producto o nombre.producto
# IMPORTANTE: Un nombre de variable no empieza nunca con un número
# INCORRECTO: 4gatos
# CORRECTO: gatos4, gatos_4, gatos.4 etc
mi_numero=25 # Podemos usar el símbolo igual
mi_numero = 25 # Podemos añadir espacios delante y detrás (más estético)
mi_numero <- 25 # En R profesional se usa <- (ALT + Guión (-))
print(mi_numero) # también funciona si solo escribimos mi_numero

nombre_usuario <- "Alex" # Otro ejemplo, en este caso con un texto. Importante, para escribir texto siempre usar comillas dobles o simples
nombre_usuario

# Truco Tabulador
print(mi)


## ¿Cómo se que se ha creado una variable? -> Comprobar el Environment
# Una vez ejecutas la línea de asignación, la variable aparecerá en la pestaña 
# "Environment" (Entorno) de RStudio (panel superior derecho). 
# También puedes usar la función ls() para listar todas las variables creadas.
ls()

## Imprimir una variable
# Para ver el contenido de una variable, simplemente escribe su nombre o usa print().
mi_numero
print(nombre_usuario)
# También podemos usarla con otras de las funciones que hemos aprendido:
paste("Mi número es el", mi_numero)

## CUIDADO! CASE SENSITIVE
# R distingue entre mayúsculas y minúsculas. No es lo mismo 'Variable' que 'variable'.
Dato <- 10
# dato # Si ejecutas esto, R dará error porque 'dato' (en minúsculas) no existe.

### Tipos de Variables (I). Una variable = Un valor

## Variables Numéricas
# Almacenan números decimales (doubles) o enteros (integers).
precio <- 99.99
cantidad <- 5

# Operaciones con variables numéricas
# Se pueden usar variables para realizar cálculos matemáticos simples
total <- precio * cantidad
total

# También para aplicar a algunas de las funciones que vimos de la calculadora
log_precio <- log(precio)
exp_precio <- exp(precio)
sqrt_precio <- sqrt(precio)


## Variables de Texto
## Variables de Texto
# También llamadas "Character" o "Strings". Siempre van entre comillas dobles o simples
saludo <- "Hola, bienvenido"
ciudad <- 'Madrid'

# Operaciones con variables de texto
# No se pueden "sumar" (+) como números, se usan funciones como paste().
mensaje_completo <- paste(saludo, "a la ciudad de", ciudad)
print(mensaje_completo)

# Calcular el número de caracteres de un texto
nchar(saludo)

## Variables Booleanas
# Llamadas "Logical". Solo pueden tener dos valores: TRUE (Verdadero) o FALSE (Falso).
# Nota: Deben ir siempre en mayúsculas y sin comillas.
es_mayor_de_edad <- TRUE
esta_abierto <- FALSE

# Operadores Lógicos
mayor_que <- 10 > 5  # Se usa símbolo > (mayor que)
menor_que <- 10 < 5  # Se usa símbolo < (menor que)
mayor_o_igual_que <- 10 >= 5 # Se usa símbolo >= (mayor o igual que)
menor_o_igual_que <- 10 <= 5 # # Se usa símbolo <= (menor o igual que)
igual_que <- 10 == 5 # Se usa símbolo == (igual que) !Cuidado, usar doble =
diferente_que <- 10 != 5 # Se usa el símbolo != (diferente que)



### EJERCICIOS: VARIABLES Y TIPOS DE DATOS (3 MINUTOS)
# Resuelve cada reto debajo de su comentario.

## -- RETO 1: VARIABLES NUMÉRICAS --
# 1. Crea una variable llamada 'base' con valor 10 y otra 'altura' con valor 5.


# 2. Crea una variable llamada 'area_triangulo' que calcule (base * altura) / 2.


# 3. Imprime el resultado de 'area_triangulo'.


# 4. Calcula el log en base 10 de la variable 'area_triangulo'



## -- RETO 2: VARIABLES DE TEXTO --
# 5. Crea una variable llamada 'nombre' con tu nombre entre comillas.


# 6. Crea una variable llamada 'apellido' con tu apellido.

# 7. Usa la función paste() para crear una variable llamada 'nombre_completo' que contenga nombre y apellido

# 8. Usa la función paste() para crear un mensaje que diga: 
# "Hola, mi nombre es [nombre_completo]" usando la variable 'nombre_completo'.

# EXTRA: ¿Puedes hacerlo todo en una sola línea de código?

## -- RETO 3: CASE SENSITIVE Y SOBREESCRITURA --
# 9. Crea la variable 'Dato' con valor 100.


# 10. Intenta sumar 'dato' + 5 (en minúsculas). ¿Qué ocurre? 
# (Coméntalo con #)


# 9. Sobreescribe la variable 'base' asignándole ahora el valor 20. 
# ¿Qué valor ves ahora en el Environment para 'base'?


## -- RETO 4: COMPARACIONES (BOOLEANAS) --
# 10. Crea una variable llamada 'comparacion' que guarde el resultado de 
# verificar si 15 es mayor que 10. (Usa el símbolo >)


# 11. Crea una variable llamada 'comparacion' que guarde el resultado de 
# verificar si 35 es menor o igual que 10.


### Vectores

## ¿Qué es un vector?
# Es la estructura de datos más básica en R. Es una colección de elementos que pueden ser:
# número, texto o booleano.
# Se crean con la función c() (de "combine").
c(1, 2, 3) # Ejemplo básico sin asignar

## Asignación de vectores
edades <- c(25, 30, 18, 42) # vector con los elementos 25, 30, 18 y 42
nombres <- c("Ana", "Luis", "Pedro") # vector con los elementos "Ana", "Luis", "Pedro"
bool <- c(TRUE, FALSE, FALSE) # vector con los elementos TRUE, FALSE, FALSE

## Acceder a los elementos de un vector
# En R, las posiciones (índices) empiezan en 1.

# Por Posición:
edades[1]    # Acceder al primer elemento del vector
c(1, 3) # Vector de dos elementos: 1 y 3
edades[c(1, 3)]  # Acceder a las posiciones indicadas en el vector c(1,3): posición 1 y posición 3

# Por Booleano (Filtrado):
# Selecciona los elementos donde la condición es TRUE
edades >= 30 # Vector booleano que indica que elementos del vector cumplen la condición
edades[edades >= 30] # Filtro los elementos (por posición) que son TRUE en el vector booleano
c(10, 20, 30)[c(TRUE, FALSE, TRUE)] # Ejemplo básico

## Operaciones con vectores
# Existen ciertas funciones en R para acceder a información acerca un vector
length(edades) # devuelve el tamaño (número de elementos) de un vector
names(edades) # la función names devuelve los nombres del vector. Como no lo hemos definido es NULL
names(edades) <- c("a","b","c","d") # Asigno nombres a los elementos del vector
names(edades) # Ahora si tiene nombres
edades # Ahora el vector tiene etiquetas (names)
edades["a"] # Como acceder a los elementos según sus etiquetas - manteniendo el nombre
edades[["a"]] # Como acceder a los elementos según sus etiquetas - eliminando el nombre
# Asignar nombres a los elementos de un vector no es obligatorio, solo se usa en casos muy concretos

# Generar subsets aleatorios de un vector. función sample()
sample(edades, size = 1) # Genera un valor (size = 1) aleatorio del vector edades
sample(edades, size = 3) # Genera tres valores (size = 3) aleatorios del vector edades
sample(edades, size = 2, replace = TRUE) # Genera dos valores (size = 2) aleatorios, con reemplazamiento, del vector edades
# Obetener los valores únicos de un vector
edades <- c(10, 10, 20, 30, 40, 40)
unique(edades) # función unique()

## Operaciones con vectores numéricos
# Operaciones vectorizadas (elemento a elemento)
edades * 2 # multiplica cada elemento por 2
edades + 5 # le suma 5 a cada elemento

# Operaciones resumen
mean(edades) # calcula la media
median(edades) # calcula la mediana
max(edades) # calcula el valor máximo
min(edades) # calcula el valor mínimo
sd(edades) # calcula la desviacion estandar
sum(edades) # calcula la suma total

## Operaciones con vectores de texto
toupper(nombres) # lo transforma todo a mayúscula
tolower(nombres) # lo transforma todo a minúscula
nchar(nombres) # devuelve el número de caracteres de cada elemento
apellidos <- c("García","Ortega","Rodríguez")
paste(nombres, apellidos) # Concatenar los vectores de nombres y apellidos

## Secuencias rápidas
# Las secuencias son funciones que generan vectores de forma 
# automática siguiendo un patrón. Son esenciales para crear índices, 
# ejes de gráficas o simular datos sin tener que escribir cada número a mano.

# 1. Secuencias simples (Incremento de 1 en 1)
# Se usa el operador ":" para rangos enteros.
1:100       # Crea un vector de números del 1 al 100 de forma instantánea
5:0 # Crea un vector de números del 5 al 0
# Muy util para acceder a rangos de un vector
letras <- c("A", "B", "C", "D", "E") 
letras[1:3] # Acceder de la posición 1 a la 3

# 2. Secuencias personalizadas (Saltos específicos)
# Se usa seq() cuando el incremento no es 1 o necesitamos un tamaño fijo.
# Controlas el "paso" o salto
seq(from = 0, to = 10, by = 0.5) # Crea un vector de 0 (from) a 10 (to) de 0.5 en 0.5 (by)  

# 3. Repeticiones (Patrones constantes)
# Se usa rep() para repetir un valor o un vector n veces.
rep("A", 10) # Crea un vector con diez letras "A"


### Dataframes

## ¿Qué es un dataframe?
# Es una tabla (como una hoja de Excel). A diferencia de las matrices,
# cada columna puede tener un tipo de dato distinto (texto, número, etc.),
# pero todas las columnas deben tener la misma longitud.
# Ejemplo:
# Paciente Peso Altura
# A1 85 175
# A2 70 165

## Asignación de dataframes. Uso de la función data.frame
# Cada columna tiene un nombre, y para indicar que se va a establecer la siguiente columna se usa una coma
df <- data.frame(
  id = 1:3, # columna con nombre id y valores 1:3
  nombre = c("Ana", "Luis", "Pedro"), # columna con nombre nombre y valores Ana, Luis y Pedro
  puntuacion = c(8.5, 9.0, 7.5) # columna con nombre puntuacion y valores 8.5, 9.0 y 7.5
)
df

## Acceder a los elementos de un dataframe
# Símbolo $: Se usa para crear un vector con el nombre de la columna que queremos extraer
df$nombre

# Posiciones: Usamos los corchetes, separados por una coma -> [,]
# Lo que queda a la izquierda de la coma hace referencia a las FILAS. Puede ser número, vector, booleano
# Lo que queda a la derecha de la coma hace referencia a las COLUMNAS. Puede ser número, texto, vector, booleano
# Si no se indica nada a la izquierda de la coma, se obtienen todas las filas
# Si no se indica nada a la derecha de la coma, se obtienen todas las columnas
df[1, 2] # Fila 1, Columna 2
df[1:2, 3] # Filas 1:2, Columna 3
df[c(TRUE,FALSE,TRUE), c(TRUE, FALSE, FALSE)] # Filas 1 y 3, Columna 1
df[1,"id"] # Fila 1, Columna "id"
df[2, c("nombre","puntuacion")] # Fila 2, Columnas "nombre" y "puntuacion"
df[1,] # Fila 1, Todas las Columnas
df[,"nombre"] # Todas las filas, Columna "nombre"
df[df$puntuacion > 8,] # Solo las filas cuya puntuación sea mayor de 8, Todas las columnas


## Crear una nueva columna
df$doble_puntos <- df$puntuacion * 2

## Modificar un valor
df[3, 2] <- "Juan" # Cambia el valor de la Fila 3, columna 2 por "Juan"
df$puntuacion[1] <- 10.0 # Cambia el primer elemento de df$puntuación por 10
df[df$nombre == "Juan", "nombre"] <- "Pedro" # Cambia los elementos en los que nombre sea Juan por Pedro

## Operaciones con dataframes
dim(df)      # Dimensiones (filas y columnas)
nrow(df)     # Número de filas
ncol(df)     # Número de columnas
colnames(df) # Nombre de las columnas
rownames(df) # Nombre de las filas (si hubiera)
summary(df)  # Resumen estadístico de las columnas
head(df)     # Muestra las primeras filas (5 por defecto) de una tabla
tail(df)     # Muestra las últimas filas (5 por defecto) de una tabla

### Matrices

## ¿Qué es una matriz?
# Es una estructura bidimensional (filas y columnas) donde TODOS los
# elementos deben ser del mismo tipo (normalmente numéricos).

## Asignación de una matriz
# Se usa la función matrix(datos, nrow, ncol)
mi_matriz <- matrix(1:9, nrow = 3, ncol = 3)
mi_matriz
matrix(0, nrow = 2, ncol = 2) # Matriz de ceros 2x2

# También se puede crear una matriz a partir de un data.frame
# usando la función as.matrix()
data <- data.frame(col1 = c(1,2,3), col2 = c(4,5,6)) # Crear un data frame de ejemplo para crear una matriz
data 
mi_matriz <- as.matrix(data) # Crear una matriz a partir de un data frame usando la función as.matrix
mi_matriz

## Acceder a los elementos de una matriz
# Igual que en dataframes, usando [fila, columna]
mi_matriz[1, 2] # Elemento en fila 1, columna 2
mi_matriz[2, ]  # Fila 2 completa

## Modificar un valor. Igual que los dataframes
mi_matriz[1, 1] <- 99

## Operaciones con matrices. Las mismas que con los dataframes y además:
log(mi_matriz) # calcula el log a todos los elementos
mean(mi_matriz) # calcula la media global
t(mi_matriz) # Calcular la transpuesta de la matriz. Convertir columnas en filas y filas en columnas
mi_matriz * 10      # Multiplicación escalar
colSums(mi_matriz) # Suma de cada columna
rowSums(mi_matriz) # Suma de cada fila
rowMeans(mi_matriz) # Media de cada fila
colMeans(mi_matriz) # Media de cada columna


### EJERCICIOS: VECTORES, DATAFRAMES Y MATRICES (5-10 MINUTOS)
# Resuelve cada ejercicio debajo de su enunciado.

## -- SECCIÓN 1: VECTORES --

# 1. Crea un vector llamado 'temperaturas' con los valores: 22, 28, 15, 34, 21.


# 2. Usa una secuencia rápida para crear un vector llamado 'dias' del 1 al 5.


# 3. Asigna el vector 'dias' como nombres (names) del vector 'temperaturas'.


# 4. Filtra el vector 'temperaturas' para mostrar solo aquellas mayores a 25 grados.


# 5. Calcula la desviación estándar (sd) de las temperaturas.



## -- SECCIÓN 2: DATAFRAMES --

# 6. Crea un dataframe llamado 'tienda' con tres columnas:
#    - producto: "Manzana", "Pera", "Plátano"
#    - stock: 50, 20, 100
#    - organico: TRUE, FALSE, TRUE


# 7. Accede únicamente a la columna 'stock' usando el símbolo $.


# 8. Muestra solo la fila 2 del dataframe 'tienda' con todas sus columnas.


# 9. Crea una nueva columna llamada 'precio' con los valores: 1.5, 2.0, 0.8.


# 10. Filtra el dataframe para ver solo los productos que tengan un stock mayor a 30.



## -- SECCIÓN 3: MATRICES --

# 11. Crea una matriz llamada 'mi_tabla' que tenga los números del 1 al 6, 
#     con 2 filas y 3 columnas.


# 12. Cambia el valor de la fila 1, columna 3 por el número 99.


# 13. Calcula la suma de cada fila (rowSums) de 'mi_tabla'.


# 14. Transforma la matriz 'mi_tabla' en un dataframe llamado 'df_desde_matriz'.


# 15. ¿Qué función usarías para ver las dimensiones (filas y columnas) de 'mi_tabla'?


### FACTORES
## ¿Qué es un factor?
# Es una estructura de datos utilizada para manejar variables categóricas.
# A diferencia del texto simple, un factor almacena los datos como niveles (levels) 
# enteros, lo que permite a R saber que hay un número limitado de categorías.
# Ejemplo: Género (M, F), Nivel Educativo (Bajo, Medio, Alto).

## Asignación de factores
# Se usa la función factor() sobre un vector de texto.
factor(c("A", "B", "A")) # Ejemplo básico sin asignar
genero <- factor(c("Hombre", "Mujer", "Mujer", "Hombre"))
genero
# Usamos la función levels() para acceder a los niveles
levels(genero)

## Niveles (defecto y personalizados)
# Por defecto, R ordena los niveles alfabéticamente. 
# Podemos forzar un orden específico (importante para escalas ordinales).
niveles_estudio <- c("Bajo", "Medio", "Alto", "Bajo")
estudios_factor <- factor(niveles_estudio)
levels(estudios_factor)

# Forzar orden personalizado:
estudios_factor <- factor(niveles_estudio, levels = c("Bajo", "Medio", "Alto"))
levels(estudios_factor) # Ver los niveles del factor

## Diferencia entre factores y texto
# El texto (character) es solo una cadena de caracteres.
# El factor permite realizar análisis estadísticos (regresiones, modelos) 
# y representaciones gráficas ordenadas.
summary(genero) # El factor cuenta cuántos hay de cada nivel
summary(c("Hombre", "Mujer")) # El texto solo dice su longitud y tipo

## ¿Para que se usan?
# Uso en modelos estadísticos
# Orden lógico vs Orden alfabético
# Convertir números en categorías
# Visualización


### LISTAS
## ¿Qué es una lista?
# Es un "contenedor de contenedores". A diferencia de los vectores,
# una lista puede guardar objetos de diferentes tipos y tamaños:
# un vector, una matriz, un dataframe e incluso otra lista, todo en uno.

## Asignación de listas
# Se usa la función list(). Se recomienda poner nombres a los elementos.
list(1, "A", TRUE) # Ejemplo básico sin asignar
mi_lista <- list(
  id = 1,
  nombre = "Proyecto Alfa",
  puntuaciones = c(10, 8, 9),
  matriz_datos = matrix(1:4, nrow = 2)
)

## Acceder a los elementos de una lista
# Existen tres formas principales:
mi_lista$nombre        # Por nombre (devuelve el objeto original)
mi_lista[[2]]          # Por posición con doble corchete (devuelve el contenido)
mi_lista[2]            # Por posición con un corchete (devuelve una sub-lista)

## ¿Para qué se usan las listas?
# 1. Para devolver resultados de funciones complejas (como modelos estadísticos).
# 2. Para almacenar datos que no caben en una tabla (dataframe) porque 
#    tienen distintas dimensiones.
# 3. Como base de estructuras más avanzadas en R.

# Ejemplo de uso: Guardar el resultado de un test estadístico
test <- t.test(1:10)
# 'test' es en realidad una lista con muchos elementos (p.value, estimate, etc.)
test$p.value


### EJERCICIO FINAL INTEGRADOR: GESTIÓN DE PROYECTO DE INVESTIGACIÓN
# Contexto: Estás analizando los resultados de un experimento con tres fertilizantes.

## -- PASO 1: RECOLECCIÓN (Vectores y Factores) --

# 1. Crea un vector llamado 'plantas_id' con una secuencia del 1 al 6.
# 2. Crea un vector llamado 'crecimiento' (en cm) con: 12.5, 15.2, 10.8, 18.1, 14.3, 11.0.
# 3. Crea un vector de texto llamado 'tipo_suelo' con: "Seco", "Humedo", "Humedo", "Seco", "Seco", "Humedo".
# 4. Convierte 'tipo_suelo' en un FACTOR donde el nivel "Humedo" sea el primero (nivel de referencia).


## -- PASO 2: ORGANIZACIÓN (Dataframes) --

# 5. Crea un dataframe llamado 'experimento' que combine: id, crecimiento y suelo (factor).
# 6. Crea una nueva columna 'objetivo_cumplido' que sea TRUE si el crecimiento es mayor a 14, y FALSE si no.
# 7. Calcula la media de la columna 'crecimiento' usando el símbolo $.


## -- PASO 3: ANÁLISIS FILTRADO --

# 8. Extrae un nuevo dataframe llamado 'plantas_top' que contenga solo las filas donde 
#    'objetivo_cumplido' sea TRUE.
# 9. De este nuevo dataframe, muestra solo las columnas 'id' y 'crecimiento'.


## -- PASO 4: ALMACENAMIENTO TOTAL (Listas) --

# 10. Crea una lista llamada 'reporte_final' que contenga:
#     - El dataframe original 'experimento' (llámalo 'datos')
#     - El vector de niveles del factor suelo (llámalo 'niveles')
#     - El valor de la media calculada en el paso 7 (llámalo 'promedio_total')

# 11. Accede al 'promedio_total' dentro de la lista 'reporte_final' usando el símbolo $.


## -- PASO 5: EXPORTACIÓN SIMULADA (Matrices) --

# 12. Crea una matriz de 2x2 llamada 'resumen_matriz' que contenga el valor mínimo, 
#     máximo, la media y la desviación estándar del crecimiento.

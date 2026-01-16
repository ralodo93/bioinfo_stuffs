## --- MENSAJES EN CONSOLA ---
print("Hola Mundo") # Todo OK: Imprime el texto correctamente

# --- UNEXPECTED SYMBOL (Error de sintaxis) ---
# Ocurre cuando intentamos nombrar variables empezando por números o caracteres no permitidos
1variable <- 5   # ERROR: El nombre de una variable nunca puede empezar por un número
variable1 <- 5   # CORRECTO: Los números sí pueden ir al final o en medio

# También ocurre cuando usamos espacios en el nombre de las variables
nombre variable <- 5 #ERROR: no puede haber espacios en el nombre de las variables
nombre_variable <- 5 # CORRECTO: Usa barras bajas o puntos, no guiones ni comas
nombre.variable <- 5

# --- COULD NOT FIND FUNCTION ---
# Ocurre cuando escribimos mal el nombre de la función o no está instalada/cargada
men(c(1,4,5,6,7,8,9))  # ERROR: "men" no existe (falta una 'a'). R es muy estricto con la ortografía
mean(c(1,4,5,6,7,8,9)) # CORRECTO: Función para calcular la media

datos_meteo <- read.xlsx("datos_meteorologicos.xlsx") # ERROR: No existe ninguna función llamada "read.xlsx" aún
install.packages("openxlsx") # Instalar la librería (descargar la herramienta de internet, solo correr una vez)
library(openxlsx)            # Cargar la librería (abrir la caja de herramientas)

# --- FILE DOES NOT EXIST ---
# Intentamos leer un archivo que no está en nuestra carpeta de trabajo o no ha sido creado aún
datos_meteo <- read.xlsx("datos_meteorologicos.xlsx") # ERROR: Si el archivo no existe en la carpeta

# Creamos datos de ejemplo para poder guardar un archivo real
datos_clima <- data.frame(
  Dia = 1:10,
  Ciudad = rep("Granada", 10),
  Temperatura_C = c(12, 14, 15, 13, 11, 10, 12, 15, 16, 14),
  Humedad_pje = c(45, 50, 55, 60, 65, 70, 55, 50, 40, 42),
  Precipitacion_mm = c(0, 0, 2, 10, 15, 5, 0, 0, 0, 0),
  Viento_kmh = c(10, 12, 15, 20, 25, 15, 10, 8, 12, 14)
)

write.xlsx(datos_clima, "datos_meteorologicos.xlsx") # Guarda el archivo en tu PC
datos_meteo <- read.xlsx("datos_meteorologicos.xlsx") # CORRECTO: Ahora que existe, sí puede leerlo

# --- OBJECT NOT FOUND (El error más común) ---
# Intentamos usar una variable que no existe o está mal escrita (Mayúsculas/Minúsculas)
edad <- 25
Edad + 35 # ERROR: "Edad" con mayúscula no existe, definimos "edad" en minúscula

variableConNombreMuyLargoQueEsDificilDeRecordar <- 100
variableconNombre... + 50 # ERROR: R es sensible a las mayúsculas (Case Sensitive)

height <- 175
heigth + 10 # ERROR: Typo (falta de ortografía en el nombre)

# --- SUBSCRIPT OUT OF BOUNDS ---
# Intentamos acceder a una posición (índice) que no existe en el vector o matriz
vector_numeros <- c(10, 20, 30, 40, 50) # Tiene 5 elementos
vector_numeros[6] # ERROR: No hay posición 6, devuelve NA
vector_numeros[0] # ERROR: En R, las posiciones empiezan en 1, no en 0

m <- matrix(1:9, nrow=3, ncol=3) # Matriz de 3x3
m[4,2] # ERROR: No existe la fila 4

# --- NON-NUMERIC ARGUMENT TO BINARY OPERATOR ---
# Intentamos hacer cálculos matemáticos con texto
peso_promedio <- "25" # Es un texto (Character) por las comillas
peso_promedio + 10  # ERROR: No puedes sumar letras + números

# --- ARGUMENT IS MISSING (Olvido de comas) ---
datos_clima[1]    # Devuelve la columna 1 (como lista)
datos_clima[1, ]  # Fila 1 (CORRECTO para ver una fila específica)
datos_clima[, 1]  # Columna 1 (CORRECTO para ver una columna específica)

# --- ARGUMENT "X" IS MISSING, WITH NO DEFAULT ---
# Llamamos a una función que necesita datos obligatoriamente, pero se la pasamos vacía
mean() # ERROR: ¿De qué quieres que calcule la media?
?mean()  # CORRECTO: Abre la ayuda para ver qué argumentos necesita

# --- UNUSED ARGUMENT ---
# Le pasamos a la función algo que no sabe qué es o no reconoce
mean(5, a = 5) # No da error por la propia estructura de la función
read.xlsx("datos_meteo.xlsx", a = 5) # ERROR: Argumento inventado

# El "Error del Símbolo Plus" (+)
# Ocurre cuando falta cerrar un paréntesis o una llave. 
# La consola muestra un + y no deja escribir más comandos.
# SOLUCIÓN: Pulsar la tecla 'ESC' en el teclado para cancelar.

# if (5 > 3) {
#   print("Hola"
# Al ejecutar esto, la consola se quedará esperando con un +

################################################################################
#              EJERCICIOS DE R: GESTIÓN DE ERRORES Y LIBRERÍAS                 #
################################################################################

### --- BLOQUE 1: SINTAXIS Y NOMBRES (UNEXPECTED SYMBOL) --- ###

# 1. ¿Qué error da? Corrígelo para que sea un nombre válido.
123_variable <- 50

# 2. ¿Qué error da? Corrígelo para que sea un nombre válido.
mi variable <- 50


### --- BLOQUE 2: FUNCIONES Y LIBRERÍAS (COULD NOT FIND FUNCTION) --- ###

# 3. Calcula el logaritmo de 100 escribiendo 'lg(100)'. 
#    Observa el error y escribe la función correcta.
lg(100)

# 4. Queremos usar una función llamada 'read_excel' que pertenece a la librería "readxl".
#    Escribe los dos comandos necesarios para:
#    a) Descargar la librería de internet.
#    b) Cargarla en la sesión actual para poder usarla.


### --- BLOQUE 3: RUTAS Y ARCHIVOS (FILE DOES NOT EXIST) --- ###

# 5. Intenta leer un archivo imaginario con 'read.xlsx("mi_dieta.xlsx")'.
#    Copia el mensaje de error que aparece en la consola.
# 6. Crea un data frame pequeño con dos columnas y úsalo para generar 
#    físicamente el archivo "ejercicio_archivo.xlsx" usando write.xlsx().


### --- BLOQUE 4: SENSIBILIDAD A MAYÚSCULAS (OBJECT NOT FOUND) --- ###

# 7. Ejecuta: usuario_nombre <- "Carlos".
#    Ahora intenta imprimir: print(Usuario_Nombre). ¿Qué ha pasado?

# 8. Corrige el siguiente código (tiene un typo):
#    temperatura_madrid <- 25
#    temperatura_madrdi + 5


### --- BLOQUE 5: POSICIONES E ÍNDICES (OUT OF BOUNDS) --- ###

# 9. Crea un vector 'colores' con 3 nombres de colores.
#    Intenta acceder a 'colores[4]'. ¿Qué resultado te devuelve R?
# 10. Crea una matriz de 2x2. Intenta acceder a la fila 3, columna 1. 
#     ¿Qué error aparece?


### --- BLOQUE 6: TIPOS DE DATOS Y ARGUMENTOS --- ###

# 11. Ejecuta: valor_texto <- "100". 
#     Intenta multiplicarlo por 2. ¿Cuál es el nombre del error que aparece?
# 12. Ejecuta la función 'sum()' sin poner nada dentro de los paréntesis.
#     ¿Qué mensaje de error te devuelve R sobre los argumentos?


### --- BLOQUE 7: EL SÍMBOLO PLUS (+) Y CIERRE DE SÍMBOLOS --- ###

# 13. Escribe en tu consola (sin completar el paréntesis): print("Hola" 
#     y pulsa ENTER. Verás que sale un símbolo +. 
#     ¿Qué tecla debes pulsar para salir de ahí y recuperar el control?

# 14. [PRÁCTICA] Corrige este bloque de código para que no dé error:
#     if (10 > 5) {
#       print("El número es mayor"
#     }


### --- EJERCICIO FINAL DE REPASO --- ###

# 15. Tienes el siguiente código lleno de fallos. Tu misión es arreglarlo:
#     1_muestra_medica <- c(10, 20, 30)
#     Mean(1_muestra_medica)
#     1_muestra_medica[10]
#     "resultado" <- 1_muestra_medica + "5"

################################################################################
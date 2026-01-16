### Esto es RSTUDIO

## PANELES:
# Source / Fuente -> Arriba a la izquierda (este mismo) -> Se usa para escribir código y ejecutarlo, nos aporta ayuda para resolver algunos errores
print("Hola R") # Para ejecutar un comando desde Source se usa CTRL + ENTER
# Console / Consola -> Abajo a la izquierda -> Es donde se ejecuta el código desde Source, aunque también se puede escribir código directamente (no recomendado salvo excepciones)
# - Para ejecutar un comando desde consola, se utiliza ENTER
# - Opción limpiar la consola (CTRL + L o pulsando en el botón)
# Environment / Entorno -> Arriba a la derecha -> Es donde vamos a ver todas las variables que hemos ido creando, aunque tiene más pestañas, la única de utilidad para este inicio es ésta
# Viewer / Visualizador -> Abajo a la derecha -> Conjunto de herramientas que usaremos para facilitar nuestra existencia con R. Incluye:
# - Files -> Vemos la rama de directorios, podemos cambiar de directorio, crear y borrar archivos etc
# - Plots -> Se genera la previsualización de las figuras que vamos generando
plot(1:10)
# - Packages -> Nos informa de los paquetes que tenemos instalados y los que están cargados
# - Help -> Es donde se genera la ayuda de las funciones que estamos usando
?print() # Utilizamos ?Nombre_Función() para imprimir la ayuda
# - Viewer y Presentation -> No relevante para el curso

## Mi primer comando
print("Hola R") # Instrucción para ejecutar una acción

## Comentarios: Usamos los comentarios (líneas que empiezan con #) para explicar el código. 
# R los ignora al ejecutar.
# print("Hola R)

## Script o Consola
print("Yo estoy en un script") # Ejecutar con CTRL + ENTER o PULSANDO RUN ARRIBA A LA DERECHA

### Primeros Pasos
## ¿Cómo puedo saber mi directorio?
getwd() # Función que devuelve la ubicación del directorio de trabajo, si creo un fichero (excel, csv, png etc) se va a crear en dicho directorio

## ¿Cómo puedo cambiar de directorio?
# setwd("ir/a la/ruta") # Mejor usar visualizador (Ir a carpeta -> More -> Set as working directory)

## Abrir un nuevo fichero .R -> New File -> R Script
## Añadir un pequeño comando
## Guardar fichero con CTRL + S


### Calculadora - Expresiones
## Operaciones básicas
8+7 # Sumar 8 y 7
8 + 7 # los espacios no importan, se trata de algo decorativo (gusto personal)
8 - 10 # Restar 8 menos 10
8 * 10 # Multiplicar 8 por 10
20 / 5 # Dividir 20 entre 5
8 ^ 2 # Elevar 8 al cuadrado

## Operaciones complejas (paréntesis)
# Funciona exactamente igual que en matemáticas
8 + 2 * 10 
(8 + 2) * 10


## Operaciones avanzadas (funciones específicas)
# Uso de una función: Nombre_Funcion(argumentos)
# Para usar de forma correcta las funciones, usamos ?Nombre_Función()
?sqrt() # Ayuda de sqrt()
sqrt(x = 64) # Raíz cuadrada de 64
sqrt(64) # En este caso se utiliza el primer parámetro (para esta función solo hay uno)
abs(-10) # Valor absoluto de -10

?log() # Ayuda de log()
log(x = 100) # Ejecutar log con x = 100 y base = exp(1) (defecto) Logaritmo Natural
exp(1) # Exponencial de 1 (e^1)
log(100) # Ejecutar log con x = 100 y base = exp(1) (defecto)
log(x = 100, base = 10) # Ejecutar log con x = 100 y base = 10
log(100, 10) # Ejecutar log con x = 100 y base = 10
exp(3)    # Exponencial de 3 (e^3)
log(10*5) # Logaritmo natural de 10 por 5

?round() # ayuda round()
round(3.14159, 2) # Redondear 3.14159 a 2 decimales
ceiling(4.3) # Redondear hacia arriba al entero más cercano
floor(4.7)   # Redondear hacia abajo al entero más cercano
# muchas más funciones disponibles como factorial(), sin(), cos() etc.

## Uso Tabulador
ceiling(4.3)
c

### Imprimir por Pantalla

## print()
# Sirve para mostrar un objeto directamente en la consola. 
# Es la función por defecto, pero menos flexible para combinar texto.
print("Hola Mundo") # importante, para escribir texto siempre entre comillas dobles o simples
print(5*40)

## paste()
# Concatena (une) varios elementos convirtiéndolos a texto. 
# Por defecto, añade un espacio entre los elementos.
paste("El", "resultado", "es", 10) # sep por defecto es " "
paste("Letra", "A", sep = "-") # Ejemplo con separador personalizado

## paste0()
# Es una variante de paste() que concatena elementos sin espacios entre ellos.
# Es más eficiente cuando quieres pegar texto y números de forma compacta.
paste0("Usuario", 123)
paste0("http://", "google.com")

## message()
# Se usa para generar mensajes de diagnóstico o información al usuario. 
# En interfaces como RStudio, el texto suele aparecer en color azul. 
# No detiene la ejecución del código.
message("Cargando base de datos, por favor espere...")

## cat()
# (Concatenate and Print) Sirve para imprimir texto puro en la consola. 
# A diferencia de print(), no muestra las comillas ni los índices [1]. 
# Es ideal para dar formato manual usando saltos de línea (\n).
cat("Línea 1\nLínea 2\n")
cat("El valor de pi es aproximadamente", 3.1416)

## warning()
# Genera un mensaje de advertencia. A diferencia de un error, el código 
# sigue ejecutándose, pero avisa al usuario que algo podría estar mal.
warning("La columna contiene valores nulos.")

### EJERCICIOS
# Instrucciones: Escribe la solución debajo de cada comentario. 

## -- SECCIÓN 1: CÁLCULOS --

# 1. Calcula el resultado de: 15 más 30, y el resultado divídelo entre 2.
# (Usa paréntesis para asegurar el orden correcto)


# 2. Calcula la raíz cuadrada de 144 usando la función específica. Pista: sqrt()


# 3. Calcula el logaritmo de 1000 en base 10.


# 4. Calcula el logaritmo natural de 50.


# 5. Calcula el valor absoluto de -25.


# 6. Redondea el número 7.89 al entero inferior (hacia abajo). Pista: floor()


# 7. ¿Qué comando escribirías para ver la ayuda de la función 'floor'?



## -- SECCIÓN 2: IMPRESIÓN Y TEXTO --

# 8. Usa paste() unir las palabras "R" "es" "genial" 
# con un guion medio (-) como separador.


# 9. Usa paste0() para crear la dirección: "home/Usuarios/Documentos" 
# uniendo las tres palabras (sin espacios).


# 10. Imprime el mensaje "Cuidado: el tanque está vacío" 
# usando la función específica para ADVERTENCIAS.


# 11. Usa cat() para imprimir en dos líneas distintas:
# Línea A: "Primera"
# Línea B: "Segunda"
# (Pista: usa \n)


# 12. Escribe un comando que genere el siguiente texto (usa paste()):
# La raíz cuadrada de 25 es: 5 (usa la función para calcular la raíz cuadrada)



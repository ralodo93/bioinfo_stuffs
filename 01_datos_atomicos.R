#### Datos Atómicos ####
# Son los componentes básicos e indivisibles.

### Numéricos ###
10 # el número 10
20 # el número 20
4.78 # el número 4.78
-50 # el número -50
1e2 # también es un número (100)


## Operaciones ##
# Las operaciones básicas con R son:
10 + 20 # Suma
20 - 10 # Resta
10 * 2 # Multiplicación
20 / 2 # División
8 %% 2 # División entera (Resto)
2 ^ 10 # Potencia

# MINIRETO: ¿Cuántos segundos tiene un día?. Escribe solución debajo:


# Para hacer operaciones algo más complejas, debemos prestar atención al uso de paréntesis
# Similar a como se aplica en matemáticas
10 + 20 * 2 # Se hace primero 20 * 2 y luego se le suma 10
(10 + 20) * 2 # Se hace primero 10 + 20 y luego se multiplica por 2
(10 - 5) / (5 + 10) # 10-5 y 5+10 se hacen por separado, después se aplica la división a los resultados

# MINIRETO: Tienes 36 manzanas. Si decides regalar 8 manzanas y luego repartir todas las manzanas restantes equitativamente entre 2 amigos, 
# ¿cuántas manzanas recibe cada uno?. Escribe la solución debajo:

### Texto ###
# IMPORTANTE. Un dato de texto SIEMPRE va metido entre comillas simples ('Hola Mundo') o dobles ("Hola Mundo")
"Hola Mundo" # dato de tipo texto (también llamado string o caracter)
'Hola Mundo' # aunque generalmente se usan comillas dobles, podemos usar comillas simples
"100" # CUIDADO! al meter un número entre comillas, pasa a convertirse en texto

# MINIRETO: Crea un texto con el contenido: Estoy aprendiendo R. Escribe solución debajo:

## Case Sensitive ##
# Debemos prestar atención con las mayúsculas y las minúsculas.
# R reconoce las mayúsculas y minúsculas, por lo que "Hola Mundo" no es igual que "hola mundo"

### Booleanos ###
# Son datos que solo pueden tener dos valores: TRUE o FALSE
TRUE # Cuando SI se cumple una condición. No funciona true ni True.
FALSE # Cuando NO se cumple una condición. No funciona false ni False.

## Operadores Lógicos ##
# Símbolos que se usan para comparar valores y evaluar la condición
# Podemos aplicar diferentes operadores lógicos a datos numéricos y de texto
10 < 20 # menor que
10 <= 20 # menor o igual que
10 > 20 # mayor que
10 >= 20 # mayor o igual que
10 == 20 # igual que (OJO, usar ==)
"Hola Mundo" == "hola mundo" # aquí vemos lo que hablamos de case sensitive
10 != 20 # diferente que
"Hola Mundo" != "hola mundo" # aquí vemos lo que hablamos de case sensitive

# Operador inverso (!)
# Cuando usamos el operador inverso (!) delante de una condición, se invierte el resultado booleano
10 < 20 # TRUE
!10 < 20 # Se invierte el resultado, pasa a ser FALSE

# MINIRETO: Comprueba si una persona de 15 años puede entrar en una discoteca (mayores de 18).
# Escribe solución debajo:


## Combinar Operadores ##
# Hay dos operadores que nos permiten combinar condiciones: AND y OR

# Operador AND (&)
# Devuelve TRUE solo si ambas condiciones a su izquierda y derecha son verdaderas. Si una de las dos falla, el resultado es falso.
(10 < 20) & (20 > 5) # TRUE & TRUE -> Ambas son TRUE -> TRUE
(10 < 20) & ("Hola Mundo" == "hola mundo") # TRUE & FALSE -> No todas son TRUE -> FALSE

# Operador OR (|)
# Devuelve TRUE si algunas de las condiciones a su izquierda y derecha son verdaderas. Aunque una de las dos falle, el resultado es verdadero.
(10 < 20) | (20 > 5) # TRUE | TRUE -> Ambas son TRUE -> TRUE
(10 < 20) | ("Hola Mundo" == "hola mundo") # TRUE | FALSE -> Al menos una de ellas es TRUE -> TRUE
(20 < 10) | ("Hola Mundo" == "hola mundo") # FALSE | FALSE -> Todas son FALSE -> FALSE

# MINIRETO: Para que un examen esté aprobado, la nota debe ser mayor o igual a 5 Y la asistencia debe ser superior a 75.
# Comprueba si una persona aprueba con nota de 8 y asistencia de 75. Escribe solución debajo:

# Anidar Operadores
# Podemos añadir tanta complejidad como queramos a nuestras combinaciones lógicas.
# Funcionan similar a las operaciones matemáticas, los paréntesis son muy útiles para definir el orden en que se comparan.
(10 < 20) | (20 > 5 & 10 < 5) # TRUE | (TRUE & FALSE) -> TRUE | FALSE -> TRUE


### Faltantes y Nulos ###
NA # Es un valor Faltante. Indica que el valor existe pero se desconoce
NULL # Es un valor Nulo. Indica que el valor no existe
# En el futuro veremos las implicaciones que tiene cada uno


#### EJERCICIOS COMPLEMENTARIOS: DATOS ATÓMICOS ####

# Ejercicio 1: Cálculos en el supermercado
# Has ido a la compra y has cogido 3 bolsas de manzanas que cuestan 4 euros cada una 
# y 2 paquetes de pasta que cuestan 1 euro cada uno. 
# Escribe una sola expresión utilizando paréntesis para calcular el precio total:


# Ejercicio 2: Reparto de premios
# Un premio de 1000 euros se reparte entre 4 personas. A la cantidad que recibe cada 
# persona hay que restarle 50 euros en concepto de gastos de gestión.
# Calcula cuánto dinero neto recibe cada una de las 4 personas:


# Ejercicio 3: Verificación de textos
# Comprueba mediante un operador lógico si el texto "RStudio" es exactamente igual 
# al texto "rstudio". Ten en cuenta la importancia de las mayúsculas:


# Ejercicio 4: Control de temperatura
# Una máquina funciona correctamente si la temperatura es mayor de 15 grados 
# Y menor o igual a 30 grados. 
# Comprueba si la máquina funciona correctamente a 32 grados:


# Ejercicio 5: Acceso a una atracción
# Para subir a una atracción infantil se debe cumplir al menos una de estas dos condiciones:
# Tener 10 años o más O medir más de 120 centímetros.
# Comprueba si puede subir una persona que tiene 8 años y mide 125 centímetros:


# Ejercicio 6: Validación de datos
# Comprueba si el número 50 es diferente al texto "50" utilizando el operador lógico 
# correspondiente:


# Ejercicio 7: Lógica inversa
# Utiliza el operador de inversión (!) para demostrar que es FALSO que 
# el número 100 sea menor que 50:


# Ejercicio 8: Condición de beca
# Para obtener una beca de transporte, el alumnado debe cumplir:
# Que la distancia al centro sea mayor de 20 km 
# Y que el ingreso familiar sea menor de 15000 euros O que sea familia numerosa (TRUE).
# Evalúa el caso de alguien que vive a 25 km, con ingresos de 18000 euros pero 
# que SÍ es familia numerosa:
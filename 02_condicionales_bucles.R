# Condicionales
## Ejemplo básico
edad <- 30
if (edad > 18){ # usar las llaves para indicar cuando se abre if (ALT + símbolo de llave hacia la derecha)
  print("Adulto")
} # Usar las llaves para indicar que se cierra un if (ALT + símbolo hacia la izquierda)

if(edad > 18){ #  Evalúa el if
  print("Adulto")
} else { # Si el if es FALSE, ejecuta lo que haya en else
  print("Menor")
}

## Ejemplo complejo
concentracion <- 50 #ng/uL
if (concentracion > 20){
  estado <- "Correcto"
  print("Muestra lista para procesar")
} else{
  estado <- "Rechazado"
  print("Concentración demasiado baja")
}
print(estado)

## Uso de else if
temp <- 25
if (temp > 30) {
  print("Hace calor")
} else if (temp >= 20) {
  print("Clima agradable")
} else {
  print("Hace frío")
}

nota <- 8.5
if (nota >= 9) {
  print("Sobresaliente")
} else if (nota >= 7) {
  print("Notable")
} else if (nota >= 5) {
  print("Aprobado")
} else {
  print("Suspenso")
}

# Condicionales múltiples
edad <- 25
tiene_carnet <- TRUE

# AND: Ambas deben ser TRUE
if (edad >= 18 & tiene_carnet == TRUE) { # & se escribe con SHIFT + 6
  print("Puedes conducir")
}

# OR: Al menos una debe ser TRUE
dia <- "Sábado"
if (dia == "Sábado" | dia == "Domingo") { # | se escribe con ALT + 1
  print("Es fin de semana")
}

## Ejemplo Complejo: Clasificación de Especie (Ecología)
peso <- 25          # en kg
altura <- 1.2       # en metros
es_carnivoro <- TRUE # También se usa T o F

if (peso > 20 & altura > 1.0 & es_carnivoro == TRUE) {
  print("Clasificación: Depredador Grande")
  rango_territorio <- peso * 5  # necesita 5km2 por cada kg
  print(paste("Territorio estimado (km2):", rango_territorio))
} else if (peso > 10 & (altura > 0.5 | es_carnivoro == FALSE)) {
  print("Clasificación: Mesofauna / Herbívoro Mediano")
  rango_territorio <- peso * 1.5
  print(paste("Territorio estimado (km2):", rango_territorio))
} else {
  print("Clasificación: Fauna Menor")
  # IF anidado para dar detalles del motivo
  if (peso < 5) {
    print("Motivo: El ejemplar es demasiado pequeño para esta categoría.")
  } else {
    print("Motivo: No cumple los requisitos d
          e altura o dieta.")
  }
}

# Bucles
## Bucle for básico - contador
for (i in 1:5){
  print(paste("Estamos en la vuelta número", i))
}

## Recorrer un vector de texto
especies <- c("Roble", "Pino", "Encina", "Haya")
for (arbol in especies) {
  print(paste("Analizando muestra de:", arbol))
}

## Ejemplo Complejo: Análisis de expresión génica
# Tenemos un vector con resultados de 5 muestras
expresion_genes <- c(120, 45, 8, 150, 80)
for (valor in expresion_genes) {
  if (valor > 100) {
    print(paste("Nivel:", valor, "-> EXPRESIÓN ALTA (Sobreexpresado)"))
  } else if (valor >= 50) {
    print(paste("Nivel:", valor, "-> EXPRESIÓN NORMAL"))
  } else {
    print(paste("Nivel:", valor, "-> EXPRESIÓN BAJA (Posible Knockout)"))
    # Podemos añadir lógica extra dentro
    if (valor < 10) {
      print("¡Alerta! Valor extremadamente bajo, revisar calidad.")
    }
  }
}

## Ejemplo definitivo
## 1. Creamos el DataFrame (Datos de entrada)
pacientes <- data.frame(
  ID = c("P01", "P02", "P03", "P04", "P05"),
  Gen1 = c(10, 45, 12, 80, 5),
  Gen2 = c(15, 50, 10, 90, 8),
  Gen3 = c(8, 40, 14, 75, 4),
  Gen4 = c(12, 48, 11, 85, 6),
  Gen5 = c(10, 42, 13, 82, 7)
)

print("--- Tabla de Expresión de Pacientes ---")
print(pacientes)

## 2. Bucle complejo: Analizando fila por fila (paciente por paciente)
# nrow(pacientes) nos dice cuántas filas hay (en este caso 5)
# ncol(pacientes) nos dice las columnas que  hay (6 en este caso)
# colnames(pacientes) nos dice los nombres de las columnas de la tabla pacientes

# Rehacer paso a paso
for (i in 1:nrow(pacientes)) {
  id <- pacientes$ID[i]
  for (j in 2:ncol(pacientes)){
    gene <- colnames(pacientes)[j]
    valor <- pacientes[i,j]
    if (valor > 100) {
      print(paste("Nivel del gen", gene, "en el paciente",id,"-> EXPRESIÓN ALTA"))
    } else if (valor >= 50) {
      print(paste("Nivel del gen", gene, "en el paciente",id,"-> EXPRESIÓN NORMAL"))
    } else {
      print(paste("Nivel del gen", gene, "en el paciente",id,"-> EXPRESIÓN BAJA"))
      # Podemos añadir lógica extra dentro
      if (valor < 10) {
        print("¡Alerta! Valor extremadamente bajo, revisar calidad.")
      }
    }
  }
}

# Bucle while
# Útil cuando no sabemos cuántas vueltas exactas daremos

contador <- 1
while (contador <= 5) {
  print(paste("El contador vale:", contador))
  # ¡IMPORTANTE! Tenemos que cambiar el valor para que el bucle termine
  contador <- contador + 1 
}

## El ejemplo definitivo de WHILE: Lanzar el dado
# Objetivo: Lanzar un dado hasta que salga un 6
resultado <- 0
lanzamientos <- 0

while (resultado != 6) {
  lanzamientos <- lanzamientos + 1
  # Generamos un número aleatorio entre 1 y 6
  resultado <- sample(1:6, size = 1)
  print(paste("Lanzamiento", lanzamientos, ": Ha salido un", resultado))
}
print(paste("¡POR FIN! Hemos necesitado", lanzamientos, "intentos para sacar un 6."))


######### Ejercicios #################

# Condicionales

## Crea una variable proteina_ug con el valor 15

## Escribe un bloque if/else if/else que:
## 1. Si la cantidad es mayor de 50, imprima: "ÓPTIMA"
## 2. Si la cantidad está entre 20 y 50, imprima: "SUFICIENTE"
## 3. Si la cantidad es menor de 20, imprima: "BAJA"

# Bucles

## Tienes un vector con 6 fragmentos de ADN en pares de bases. Crea dicho vector
fragmentos <- c(150, 2400, 800, 3500, 120, 1500)

## Usa bucle for para recorrer el vector. Dentro del bucle:
## 1. si el fragmento es mayor de 2000, imprime: "FRAGMENTO LARGO"
## 2. si no, imprime: "FRAGMENTO CORTO"

# Reto Final

## Usando el siguiente dataframe:
clinica <- data.frame(
  Paciente = c("Sujeto_A", "Sujeto_B", "Sujeto_C"),
  Edad = c(70, 45, 30),
  Colesterol = c(240, 180, 210),
  Fumador = c(TRUE, FALSE, TRUE)
)

## Escribe un bucle for que recorra las filas de la tabla y que, de cada paciente, calcule el nivel de riesgo:
## 1. Riesgo alto: si es mayor de 60 años Y tiene colesterol > 200
## 2. Riesgo moderado: si es fumador O tiene colesterol > 200 (pero no cumple las condiciones de riesgo alto)
## 3. Riesgo Bajo: En cualquier otro caso.

# Bonus Track
## Crea un pequeño programa con while que simule la toma de presión arterial. 
## El programa debe imprimir "Tomando presión..." y generar un número aleatorio (usa sample(80:150, 1)) 
## hasta que salga un valor menor a 120 (Presión normal).
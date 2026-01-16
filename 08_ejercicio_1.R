################################################################################
#                PROYECTO FINAL: ANÁLISIS AUTOMATIZADO DE DATOS               #
################################################################################

### --- FASE 1: PREPARACIÓN Y GESTIÓN DE ARCHIVOS ---
# 1. Descarga el fichero del Titanic desde esta URL:
# "https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv"
# Guárdalo en tu ordenador con el nombre "datos_titanic.csv".

# 2. Lee el archivo guardado y asígnalo a una variable llamada 'df_titanic'.

# 3. Exporta las primeras 10 filas de este dataframe a un archivo Excel 
# llamado "muestra_titanic.xlsx".


### --- FASE 2: EXPLORACIÓN Y FUNCIONES BASE ---
# 4. ¿Cuántas filas y columnas tiene el dataframe? Usa una función.

# 5. Calcula la media de la edad de los pasajeros (columna 'Age'). 
# ¡Ojo! Hay valores NA, asegúrate de que la función mean() no devuelva NA.

# 6. Crea un vector llamado 'ciudades' con los valores únicos de la columna 'Embarked'.


### --- FASE 3: CREACIÓN DE FUNCIONES Y LÓGICA ---
# 7. Crea una función llamada 'clasificar_edad' que reciba un número y devuelva:
#    - "Menor" si es < 18
#    - "Adulto" si está entre 18 y 64
#    - "Anciano" si es >= 65
#    - "Desconocido" si el valor es NA

# 8. Crea una función llamada 'check_supervivencia' que reciba el valor de la 
#    columna 'Survived' (0 o 1) y devuelva:
#    - "No Sobrevivió" si es 0
#    - "Sobrevivió" si es 1


### --- FASE 4: BUCLES Y TRANSFORMACIÓN ---
# 9. Crea una nueva columna en el dataframe 'df_titanic' llamada 'Categoria_Edad'.
#    Usa la función ifelse() anidada (o un bucle si te atreves) para llenarla 
#    usando la lógica de la pregunta 7.

# 10. Crea un bucle FOR que recorra las primeras 5 filas del dataframe e imprima 
#     un mensaje personalizado por consola usando paste0:
#     "El pasajero [Name] tiene [Age] años y su estado es [Survived]."
#     (Usa tu función 'check_supervivencia' para que el estado no sea un número).


### --- FASE 5: FILTRADO Y GESTIÓN FINAL ---
# 11. Crea un nuevo dataframe llamado 'supervivientes_ricos' que contenga solo 
#     a los pasajeros que:
#     - Sobrevivieron (Survived == 1)
#     - Y pagaron un billete (Fare) mayor a 100.

# 12. Guarda este último dataframe ('supervivientes_ricos') en un archivo 
#     llamado "analisis_final.rds".


### --- FASE 6: DEPURACIÓN (DEBUGGING) ---
# 13. Intenta ejecutar: mean(df_titanic$Fare + "10"). 
#     Explica en un comentario qué error da y por qué.
# 14. ¿Qué pasa si intentas acceder a df_titanic[1000, 1]? 
#     Explica el error que obtienes.

################################################################################



################################################################################
#                RETO PRO: SISTEMA AUTOMATIZADO DE GESTIÓN CLÍNICA             #
################################################################################

### --- FASE 1: SIMULACIÓN Y EXPORTACIÓN ---
# 1. Crea un Data Frame llamado 'hospital_A' con 10 pacientes:
#    - ID: "HOSP-01" hasta "HOSP-10" (Pista: usa paste0 y 1:10)
#    - Glucosa: 10 valores aleatorios entre 60 y 200 (usa sample())
#    - Grupo: 5 "Control" y 5 "Tratamiento"
# 2. Introduce un error manual: cambia la Glucosa del paciente 3 a un valor de texto "85" (entre comillas).
# 3. Exporta este dataframe a un archivo CSV llamado "datos_crudos_hospital.csv".


### --- FASE 2: IMPORTACIÓN Y LIMPIEZA (DEBUGGING) ---
# 4. Lee el archivo "datos_crudos_hospital.csv".
# 5. Al intentar calcular la media de Glucosa, te dará un error (Non-numeric argument).
#    Detecta qué fila tiene el texto, corrígela convirtiéndola a numérico y 
#    calcula la media final ignorando los NAs si los hubiera.


### --- FASE 3: LÓGICA ANIDADA Y FUNCIONES ---
# 6. Crea una función llamada 'analizador_riesgo' que reciba la glucosa y el grupo:
#    - Si el grupo es "Control" y glucosa > 140: "Riesgo Moderado"
#    - Si el grupo es "Tratamiento" y glucosa > 140: "Seguimiento Especial"
#    - Si glucosa > 180: "ALERTA CRÍTICA" (independientemente del grupo)
#    - En cualquier otro caso: "Normal"

# 7. Crea una segunda función llamada 'formatear_id' que convierta cualquier ID 
#    a mayúsculas y le añada el prefijo "BIO-".


### --- FASE 4: AUTOMATIZACIÓN (EL BUCLE MAESTRO) ---
# 8. Añade tres columnas vacías al dataframe: 'Estado', 'ID_Final' y 'Fecha_Proceso'.
# 9. Crea un bucle FOR que recorra el dataframe fila por fila:
#    a) Aplique 'analizador_riesgo' y guarde el resultado en 'Estado'.
#    b) Aplique 'formatear_id' y guarde el resultado en 'ID_Final'.
#    c) Guarde la fecha actual en 'Fecha_Proceso' usando la función Sys.Date().
#    d) Si el estado es "ALERTA CRÍTICA", que imprima un mensaje: "¡URGENTE! Paciente [ID] requiere atención".


### --- FASE 5: GESTIÓN DE ARCHIVOS COMPLEJA ---
# 10. Filtra los pacientes que NO sean "Normal" y guárdalos en un objeto llamado 'casos_estudio'.
# 11. Guarda 'casos_estudio' en un archivo RDS.
# 12. Crea una lista llamada 'backup_total' que contenga:
#     - El dataframe original limpio.
#     - El dataframe filtrado de casos_estudio.
#     - Un vector con los nombres de las funciones que has creado.
# 13. Guarda la lista completa en un archivo .RData llamado "backup_investigacion.RData".


### --- FASE 6: EL "STRESS TEST" ---
# 14. Intenta acceder a la columna 10 del dataframe. ¿Qué error de los vistos 
#     en el script de errores ocurre? (Escribe el nombre del error en un comentario).
# 15. Borra todos los objetos de tu entorno (puedes usar la escoba del panel Environment) 
#     y carga solo el archivo .RData. Comprueba si tus funciones y tablas siguen ahí.

################################################################################
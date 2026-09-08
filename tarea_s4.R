
# Tarea Semana 4 
# Nombre: Francisco Inostroza
# Fecha: 08-09-2026
# Revisa datos de CASEN y compara sueldos según estudios y sector.

# 1. Cargar datos con ruta relativa
casen <- read.csv("data/raw/casen_reducido.csv")

# 2. Explorar estructura antes de calcular
dim(casen)      # Muestra cantidad de filas y columnas
str(casen)      # Muestra la estructura y tipo de cada columna
head(casen)     # Muestra las primeras 6 filas
summary(casen)  # Da un resumen estadistico de cada variable

# Tipos de datos
# region: character 
# sector: character 
# educ: integer 
# edad: integer 
# ingreso: numeric 
# genero: character 
# ¿Hay NA? Sí, solo la columna 'ingreso' tiene 5 valores NA.

# 3. Subset con condición compuesta 
# Personas del sector Servicios Y con más de 12 años de estudio
sub_servicios <- casen[casen$sector == "Servicios" & casen$educ > 12, ]

# 4. Estadísticas del subset vs total
n_total <- nrow(casen)          # Cuenta las filas totales
n_sub   <- nrow(sub_servicios)  # Cuenta las filas del grupo filtrado

edad_prom_total <- mean(casen$edad)          # Promedio de edad total
edad_prom_sub   <- mean(sub_servicios$edad)  # Promedio de edad del grupo

ingreso_prom_total <- mean(casen$ingreso, na.rm = TRUE) # Sueldo promedio total
ingreso_prom_sub   <- mean(sub_servicios$ingreso, na.rm = TRUE) # Sueldo promedio grupo
# resultados
n_sub
n_total

edad_prom_sub
edad_prom_total

ingreso_prom_sub
ingreso_prom_total

# ¿Ganan más que el promedio?
# Sí, ganan $866.286 en comparacion a los $655.291 del promedio.
# Puede ser ya que al tener más años de estudio permite acceder a puestos con mejores sueldos.

# 5. ¿Se gana más en Servicios que en Agricultura? 
ingreso_agri <- mean(casen$ingreso[casen$sector == "Agricultura"], na.rm = TRUE) 
ingreso_serv <- mean(casen$ingreso[casen$sector == "Servicios"], na.rm = TRUE)
# Se agrega el na.rm por los valores perdidos del ingreso

# Resultados
ingreso_agri
ingreso_serv

# En promedio servicios tiene mas ingresos que agricultura
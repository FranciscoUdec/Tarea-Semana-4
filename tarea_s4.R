
# Tarea Semana 4 
# Nombre: Francisco Inostroza
# Fecha: 08-09-2026
# Revisa datos de CASEN y compara sueldos según estudios y sector.

# 1. Cargar datos con ruta relativa
casen <- read.csv("data/raw/casen_reducido.csv")

# 2. Explorar estructura antes de calcular
dim(casen)
str(casen)
head(casen)
summary(casen)

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
n_total <- nrow(casen)
n_sub   <- nrow(sub_servicios)

edad_prom_total <- mean(casen$edad)
edad_prom_sub   <- mean(sub_servicios$edad)

ingreso_prom_total <- mean(casen$ingreso, na.rm = TRUE)
ingreso_prom_sub   <- mean(sub_servicios$ingreso, na.rm = TRUE)

# resultados
n_sub
n_total

edad_prom_sub
edad_prom_total

ingreso_prom_sub
ingreso_prom_total

# ¿Ganan más que el promedio?
# Sí, ganan $866.286 frente a $655.291 del promedio general.
# Puede ser ya que al tener más años de estudio permite acceder a puestos con mejores sueldos.

# 5. Pregunta propia: ¿Se gana más en Servicios que en Agricultura? 
ingreso_agri <- mean(casen$ingreso[casen$sector == "Agricultura"], na.rm = TRUE) 
ingreso_serv <- mean(casen$ingreso[casen$sector == "Servicios"], na.rm = TRUE)
# Se agrega el na.rm por los valores perdidos del ingreso

ingreso_agri
ingreso_serv

# En conclusion en promedio servicio tiene mas ingresos que agricultura.
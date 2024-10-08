#!/bin/bash

# 1-) Mensaje de bienvenida:
echo " Ejecutando Script 'A', se están creando las estructuras de directorios para los exámenes..."

# 2-) Creación de la estructura de directorios
mkdir -p /Examenes-UTN/{alumno_1,alumno_2,alumno_3,profesores}/{parcial_1,parcial_2,parcial_3}

# 3-) Listar la estructura para verificar
tree /Examenes-UTN

# 4-) Estableciendo permiso (opcional si es necesario):
sudo chmod 764 Punto_A.sh

# 5-) Mensaje de finalización:
echo " El Script 'A' se ha ejecutado correctamente, creación de estructuras completada!"


#!/bin/bash

# 1-) Definir la carpeta de destino y el archivo de salida
CARPETA="RTA_ARCHIVOS_Examen"
ARCHIVO="Filtro_Basico.txt"

# 2-) Crear la carpeta de destino si no existe
mkdir -p "$CARPETA"

# 3-) Crear el archivo de salida con un encabezado
echo "Información del sistema:" > "$CARPETA/$ARCHIVO"

# 4-) Obtener el total de memoria RAM y agregarlo al archivo
echo "Obteniendo el total de memoria RAM..."
memoria_ram=$(grep MemTotal /proc/meminfo | awk '{print $2}')
echo "Memoria RAM total: $memoria_ram kB" >> "$CARPETA/$ARCHIVO"

# 5-) Obtener el fabricante del chasis y agregarlo al archivo
echo "Obteniendo el fabricante del chasis..."
fabricante_chasis=$(sudo dmidecode -t chassis | grep -i 'Manufacturer' | awk -F: '{print $2}')
echo "Fabricante del chasis: $fabricante_chasis" >> "$CARPETA/$ARCHIVO"

# 6-) (Opcional) Obtener el modelo del chasis y agregarlo al archivo
echo "Obteniendo el modelo del chasis (opcional)..."
modelo_chasis=$(sudo dmidecode -t chassis | grep -i 'Product Name:' | awk -F: '{print $2}')
echo "Modelo del chasis: $modelo_chasis" >> "$CARPETA/$ARCHIVO"

# 7-) Mensaje de finalización
echo "Archivo $ARCHIVO creado exitosamente en $CARPETA."

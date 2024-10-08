#!/bin/bash

# 1-) Definir el directorio base
base_dir=~/Estructura_Asimetrica

# 2-) Crear los directorios principales: "correo" y "clientes"
mkdir -p "$base_dir"/{correo,clientes}

# 3-) Crear los subdirectorios "cartas_1" a "cartas_100" en ambas carpetas
for i in {1..100}; do
    mkdir -p "$base_dir"/{correo,clientes}/cartas_$i
done

# 4-) Crear los subdirectorios "carteros_1" a "carteros_10" solo en la carpeta "correo"
for i in {1..10}; do
    mkdir -p "$base_dir"/correo/carteros_$i
done

# 5-) Validar la estructura creada usando el comando tree
tree "$base_dir" --noreport | pr -T -s'' -w 80 -column 4

# 6-) Validación adicional: contar cuántas carpetas "cartas" se crearon
total_cartas=$(find "$base_dir" -type d -name 'cartas_*' | wc -l)
echo "Total de subdirectorios 'cartas' creados: $total_cartas"

# 7-) Mensaje de finalización
if [ $total_cartas -eq 200 ]; then
    echo "Estructura creada correctamente con todos los directorios esperados."
else
    echo "Error: No se crearon todas las carpetas esperadas."
fi

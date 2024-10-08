#!/bin/bash

# 1-) Mensaje de bienvenida:
echo "Ejecutando Script 'F'..."

# 2-) Definir la carpeta de destino y el archivo de salida
RUTA_DESTINO="RTA_ARCHIVOS_Examen_$(date +%Y%m%d)"
ARCHIVO="Filtro_Avanzado.txt"

# 3-) Crear la carpeta de destino si no existe
mkdir -p "$RUTA_DESTINO"

# 4-) Verificación de permisos de escritura en la ruta de destino
echo "Verificando permisos de escritura en $RUTA_DESTINO..."
if [ -d "$RUTA_DESTINO" ] && [ -w "$RUTA_DESTINO" ]; then
    echo "El directorio $RUTA_DESTINO existe y tienes permisos de escritura."
else
    echo "Error: No tienes permisos de escritura en $RUTA_DESTINO o no existe."
    exit 1
fi 

# 5-) Obtener la dirección IP pública
echo "Obteniendo la IP pública..."
IP_PUBLICA=$(curl -s ifconfig.me)

# 6-) Obtener el nombre de usuario actual
USUARIO=$(logname)

# 7-) Generar un hash del nombre de usuario (usando SHA-256)
echo "Generando un hash del nombre de usuario..."
HASH_USUARIO=$(echo -n "$USUARIO" | sha256sum | awk '{print $1}')

# 8-) Obtener la URL del repositorio remoto
echo "Obteniendo la URL del repositorio remoto..."
if git remote -v; then
    URL_REPOSITORIO=$(git remote get-url origin)
else
    echo "Error: No se pudo obtener la URL del repositorio remoto."
    exit 1
fi

# 9-) Guardar los resultados en el archivo Filtro_Avanzado.txt
echo "Guardando resultados en $ARCHIVO..."
{
    echo "Mi IP Pública es: $IP_PUBLICA"
    echo "Mi usuario es: $USUARIO"
    echo "El Hash de mi usuario es: $HASH_USUARIO"
    echo "La URL de mi repositorio es: $URL_REPOSITORIO"
} > "$RUTA_DESTINO/$ARCHIVO"

# 10-) Mensaje de finalización
echo "Archivo $ARCHIVO creado exitosamente en $RUTA_DESTINO."
echo "Fin del script 'F'."

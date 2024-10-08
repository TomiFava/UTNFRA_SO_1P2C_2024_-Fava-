#!/bin/bash

# 1-) Mensaje de bienvenida:
echo "Iniciando Script 'C'..."

# 2-) Función para generar contraseñas:
generate_password() {
    echo $(openssl passwd -crypt "$1")
}
CONTRASEÑA=$(generate_password 'osboxes.org')

# 3-) Crear los grupos:
sudo groupadd p1c2_2024_gAlumno
sudo groupadd p1c2_2024_gProfesores

# 4-) Crear los usuarios con sus respectivos grupos:
sudo useradd -m -G p1c2_2024_gAlumno -p "$CONTRASEÑA" p1c2_2024_A1
sudo useradd -m -G p1c2_2024_gAlumno -p "$CONTRASEÑA" p1c2_2024_A2
sudo useradd -m -G p1c2_2024_gAlumno -p "$CONTRASEÑA" p1c2_2024_A3
sudo useradd -m -G p1c2_2024_gProfesores -p "$CONTRASEÑA" p1c2_2024_P1

# 5-) Verificar si el directorio ya existe
if [ ! -d "/Examenes-UTN" ]; then
    sudo mkdir -p /Examenes-UTN/{alumno_{1..3},profesores}
else
    echo "/Examenes-UTN ya existe."
fi

# 6-) Asignación de permisos a las carpetas:
sudo chown p1c2_2024_A1:p1c2_2024_A1 /Examenes-UTN/alumno_1
sudo chmod 750 /Examenes-UTN/alumno_1

sudo chown p1c2_2024_A2:p1c2_2024_A2 /Examenes-UTN/alumno_2
sudo chmod 740 /Examenes-UTN/alumno_2

sudo chown p1c2_2024_A3:p1c2_2024_A3 /Examenes-UTN/alumno_3
sudo chmod 750 /Examenes-UTN/alumno_3

sudo chown p1c2_2024_P1:p1c2_2024_gProfesores /Examenes-UTN/profesores
sudo chmod 775 /Examenes-UTN/profesores

# 7-) Crear un archivo de validación para cada usuario:
for user in p1c2_2024_A1 p1c2_2024_A2 p1c2_2024_A3 p1c2_2024_P1; do
    sudo su -c "whoami > /Examenes-UTN/${user/alumno_/alumno_1}/validar.txt" "$user"
done

# 8-) Mensaje de finalización:
echo "Usuarios creados, permisos ajustados y archivo de validación generado."

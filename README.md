# Examen práctico - Infraestructura como código
El siguiente repositorio contiene los archivos con la configuración necesaria para levantar un servidor en AWS por medio de Terraform y desplegar el contenido de una API simple mediante Ansible a través de SSH.

## Preparación previa
* Configuración local de terraform para el acceso a AWS
* Archivo .pem del par clave utilizado _(recomendable dentro de la carpeta terraform)_
* Actualizar el archivo **inventario_ini.sh** en su última linea para apuntar al archivo .pen utilizado
* Otorgar permisos para la ejecución del archivo **inventario_ini.sh** dentro de la carpeta ansible (chmod 700 o 750)

## Levantar el servidor y desplegar la API
Desde la carpeta terraform, comenzar con la inicialización y planeación ejecutando los siguientes comandos de Terraform:
```
terraform init
terraform plan
```
Para levantar el servidor y desplegar la API, aplique el plan establecido ejecutando el siguiente comando de terraform:
```
terraform apply -auto-approve
```
## Verificación con Ansible
Permaneciendo en la carpeta terraform, ejecute el archivo para generar el inventario con la IP pública de la instancia creada:
```
../ansible/inventario_ini.sh
```
A continuación, ejecute el siguiente comando de Ansible para contactar a la instancia creada del servidor:
```
ansible -i ../ansible/inventario.ini api-main-py -m ping
```
## Destrucción del servidor
Para finalizar destruya la instancia creada, junto a  los recursos adicionales creados, ejecutando el siguiente comando:
```
terraform destroy -auto-approve
```
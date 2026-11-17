#!/bin/bash
echo "[api-main-py]" > ../ansible/inventario.ini
echo "$(terraform output -raw ip_public_app_main_py)" >> ../ansible/inventario.ini
echo "[api-main-py:vars]" >> ../ansible/inventario.ini
echo "ansible_user=ubuntu" >> ../ansible/inventario.ini
echo "ansible_ssh_private_key_file=/home/omars/project/terraform/ApiMainPy.pem" >> ../ansible/inventario.ini
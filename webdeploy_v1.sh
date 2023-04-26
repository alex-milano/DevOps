#!/bin/bash

user=$(id -u)
echo $user

if [ "$(id -u)" -ne 0 ]; then
    echo "el usuario debe ser root"
    exit
fi

##update
apt update
apt install -y git curl apache2

sleep1
##iniciar el servicio de apache
echo "Iniciando servicio de apache"
systemctl start apache2
systemctl enable apache2

sleep1
#web
git clone devops-memory https://github.com/roxsross/devops-static-web.git
cp -r devops-static-web/* /var/www/html/
ls -ltr /var/www/html/
echo "página instalada"

sleep1
##test 
echo "testeando web"
curl localhost

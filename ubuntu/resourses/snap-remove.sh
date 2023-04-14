#!/bin/bash

. ./config.sh

#Проверка наличия и удаление docker snap
snap list | grep docker
if [ $? -eq 0 ]; then
    echo -e "\e[31mУстановлен docker из snap. Удалите и запустите скрипт заново\e[0m"
	read -p "Удалить из системы? (Y/N)" answer
	case ${answer:0:1} in
		y|Y )
			snap remove docker
			sed -i 's.ListenStream=/run/docker\.sock.ListenStream=/var\/run\/docker\.sock.g' /lib/systemd/system/docker.socket
			systemctl daemon-reload
			;;
		* )
			echo -e "\e[31mУдалите (snap remove docker) и запустите скрипт заново\e[0m"
			exit 1
			;;
	esac
fi
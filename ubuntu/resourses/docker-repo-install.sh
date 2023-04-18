#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null
. ./config.sh

#Установка Docker последней версии.
apt-get update
apt-get upgrade -y
apt-get install ca-certificates curl gnupg lsb-release wget -y

if docker -v docker &> /dev/null
then
    echo -e "\e[42mDocker установлени\e[0m"
else
	echo -e "\e[42mУстановка Docker+Compose\e[0m"
	mkdir -p /etc/apt/keyrings
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	apt-get update
	apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
	groupadd docker
	usermod -aG docker $USER
	systemctl start docker
	systemctl enable docker
fi
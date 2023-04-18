#!/usr/bin/env bash

#cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null
. ./resourses/conf/config.sh


#Устанавливаем необходимые компоненты
apt-get update
apt-get upgrade -y
apt-get install ca-certificates curl gnupg lsb-release wget -y

#Выкачиваем нужные пакеты для докера
wget -vc https://download.docker.com/linux/debian/dists/buster/pool/stable/amd64/$CONTAINERD_VER
wget -vc https://download.docker.com/linux/debian/dists/buster/pool/stable/amd64/$DOCKER_CE_CLI_VER
wget -vc https://download.docker.com/linux/debian/dists/buster/pool/stable/amd64/$DOCKER_CE_VER
wget -vc https://download.docker.com/linux/debian/dists/buster/pool/stable/amd64/$DOCKER_COMPOSE_VER
wget -vc https://download.docker.com/linux/debian/dists/buster/pool/stable/amd64/$DOCKER_BUILDX_VER

#Устанавливаем докер
dpkg -i $CONTAINERD_VER $DOCKER_CE_VER $DOCKER_CE_CLI_VER $DOCKER_BUILDX_VER $DOCKER_COMPOSE_VER

#включаем
systemctl start docker
systemctl enable docker

#groupadd docker $$ usermod -aG docker $USER
groupadd docker
usermod -aG docker $USER
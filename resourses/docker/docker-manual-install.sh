#!/usr/bin/env bash

. ./resourses/conf/config.sh

#Выкачиваем нужные версии пакетов для докера
wget -vc https://download.docker.com/linux/${SYSTEM_VERSION}/dists/${SYSTEM_CODENAME}/pool/stable/amd64/containerd.io_${CONTAINERD_VER}_amd64.deb
wget -vc https://download.docker.com/linux/${SYSTEM_VERSION}/dists/${SYSTEM_CODENAME}/pool/stable/amd64/docker-ce-cli_${DOCKER_CE_CLI_VER}_amd64.deb
wget -vc https://download.docker.com/linux/${SYSTEM_VERSION}/dists/${SYSTEM_CODENAME}/pool/stable/amd64/docker-ce_${DOCKER_CE_VER}_amd64.deb
wget -vc https://download.docker.com/linux/${SYSTEM_VERSION}/dists/${SYSTEM_CODENAME}/pool/stable/amd64/docker-compose-plugin_${DOCKER_COMPOSE_VER}_amd64.deb
wget -vc https://download.docker.com/linux/${SYSTEM_VERSION}/dists/${SYSTEM_CODENAME}/pool/stable/amd64/docker-buildx-plugin_${DOCKER_BUILDX_VER}_amd64.deb

#Устанавливаем докер
dpkg -i containerd.io_${CONTAINERD_VER}_amd64.deb docker-ce_${DOCKER_CE_VER}_amd64.deb docker-ce-cli_${DOCKER_CE_CLI_VER}_amd64.deb docker-buildx-plugin_${DOCKER_BUILDX_VER}_amd64.deb docker-compose-plugin_${DOCKER_COMPOSE_VER}_amd64.deb

#включаем
systemctl start docker
systemctl enable docker

#groupadd docker $$ usermod -aG docker $USER
groupadd docker
usermod -aG docker ${CURRENT_USER}
sudo --user=${CURRENT_USER} newgrp docker
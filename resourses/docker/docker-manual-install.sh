#!/usr/bin/env bash

. ./resourses/conf/config.sh

#Выкачиваем нужные версии пакетов для докера
wget -vc https://download.docker.com/linux/${SYSTEM_VERSION}/dists/${SYSTEM_CODENAME}/pool/stable/amd64/${CONTAINERD_VER}
wget -vc https://download.docker.com/linux/${SYSTEM_VERSION}/dists/${SYSTEM_CODENAME}/pool/stable/amd64/${DOCKER_CE_CLI_VER}
wget -vc https://download.docker.com/linux/${SYSTEM_VERSION}/dists/${SYSTEM_CODENAME}/pool/stable/amd64/${DOCKER_CE_VER}
wget -vc https://download.docker.com/linux/${SYSTEM_VERSION}/dists/${SYSTEM_CODENAME}/pool/stable/amd64/${DOCKER_COMPOSE_VER}
wget -vc https://download.docker.com/linux/${SYSTEM_VERSION}/dists/${SYSTEM_CODENAME}/pool/stable/amd64/${DOCKER_BUILDX_VER}

#Устанавливаем докер
dpkg -i ${CONTAINERD_VER} ${DOCKER_CE_VER} ${DOCKER_CE_CLI_VER} ${DOCKER_BUILDX_VER} ${DOCKER_COMPOSE_VER}

#включаем
systemctl start docker
systemctl enable docker

#groupadd docker $$ usermod -aG docker $USER
groupadd docker
usermod -aG docker ${CURRENT_USER}
sudo --user=${CURRENT_USER} newgrp docker
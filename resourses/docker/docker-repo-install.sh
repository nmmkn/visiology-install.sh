#!/usr/bin/env bash

. ./resourses/conf/config.sh


mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/${SYSTEM_VERSION}/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/${SYSTEM_VERSION} $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update

case ${DOCKER_VERSION} in
latest)
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
;;
manual)
apt-get install docker-ce=${DOCKER_CE_VER} docker-ce-cli=${DOCKER_CE_CLI_VER} containerd.io=${CONTAINERD_VER} docker-buildx-plugin=${DOCKER_BUILDX_VER} docker-compose-plugin=${DOCKER_COMPOSE_VER} -y
;;
*)
echo "Выбран неправильный режим установки"
esac

groupadd docker
usermod -aG docker ${CURRENT_USER}
sudo --user=${CURRENT_USER} newgrp docker
systemctl start docker
systemctl enable docker
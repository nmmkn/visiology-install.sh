#!/usr/bin/env bash

. ./resourses/conf/config.sh

snap remove docker
sed -i 's.ListenStream=/run/docker\.sock.ListenStream=/var\/run\/docker\.sock.g' /lib/systemd/system/docker.socket
systemctl daemon-reload

case ${DOCKER_INSTALL} in
    auto)
#. ./resourses/docker/snap-remove.sh #Для Ubuntu удаляем установку Docker из Snap.
#. ./resourses/docker/docker-repo-install.sh
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    ;;
    manual)
#Выкачиваем нужные версии пакетов для докера
    wget -vnc https://download.docker.com/linux/${SYSTEM_VERSION}/dists/${SYSTEM_CODENAME}/pool/stable/amd64/${CONTAINERD_VER}
    wget -vnc https://download.docker.com/linux/${SYSTEM_VERSION}/dists/${SYSTEM_CODENAME}/pool/stable/amd64/${DOCKER_CE_CLI_VER}
    wget -vnc https://download.docker.com/linux/${SYSTEM_VERSION}/dists/${SYSTEM_CODENAME}/pool/stable/amd64/${DOCKER_CE_VER}
    wget -vnc https://download.docker.com/linux/${SYSTEM_VERSION}/dists/${SYSTEM_CODENAME}/pool/stable/amd64/${DOCKER_COMPOSE_VER}
    wget -vnc https://download.docker.com/linux/${SYSTEM_VERSION}/dists/${SYSTEM_CODENAME}/pool/stable/amd64/${DOCKER_BUILDX_VER}

    dpkg -i ${CONTAINERD_VER} ${DOCKER_CE_VER} ${DOCKER_CE_CLI_VER} ${DOCKER_BUILDX_VER} ${DOCKER_COMPOSE_VER}
    rm -f ${CONTAINERD_VER} ${DOCKER_CE_VER} ${DOCKER_CE_CLI_VER} ${DOCKER_BUILDX_VER} ${DOCKER_COMPOSE_VER}

    systemctl start docker
    systemctl enable docker
    ;;
    *)
    echo "DOCKER_INSTALL установленна неверно."
    ;;
esac

groupadd docker &>> /dev/null
usermod -aG docker ${CURRENT_USER}
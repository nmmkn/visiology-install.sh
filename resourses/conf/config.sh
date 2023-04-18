#!/usr/bin/env bash

#cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null

#Конфигурационные параметры платформы Visiology

# Параметры окружения
CURRENT_USER=$( echo $USER)
INSTALL_DIR=/home/${CURRENT_USER}
WORK_DIR=./distrib_$VP_REALESE



#Параметры Visiology
VP_DISTR=distrib_$VP_REALESE.tar.xz
VP_REALESE=2.30+3.1
VP_VERSION=v2 # v2, v3, all
VP_ADDRESS=$( hostname -I) #ip address, dns name

#Параметры Docker
DOCKER_SETUP=repo #repo, manual
CONTAINERD_VER=containerd.io_1.6.9-1_amd64.deb
DOCKER_CE_VER=docker-ce_23.0.1-1~debian.10~buster_amd64.deb
DOCKER_CE_CLI_VER=docker-ce-cli_23.0.1-1~debian.10~buster_amd64.deb
DOCKER_BUILDX_VER=docker-buildx-plugin_0.10.2-1~debian.10~buster_amd64.deb
DOCKER_COMPOSE_VER=docker-compose-plugin_2.16.0-1~debian.10~buster_amd64.deb

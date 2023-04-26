#!/usr/bin/env bash

# Параметры окружения дистрибутива linux.
CURRENT_USER=${SUDO_USER}
INSTALL_DIR=/usr/local
WORK_DIR=./distrib_${VP_ARCHIVE}

#Версия дистрибутива аналитической платформы Visiology.
VP_DISTR=distrib_${VP_ARCHIVE}.tar.xz
VP_RELEASE=2.29.1 #2.30_3.1
VP_ARCHIVE=2.29.1 #2.30+3.1

VP_VERSION=v2 # v2, v3, all.
VP_ADDRESS=$( hostname -I) #ip address, dns name.

#Параметры ручной установки Docker.
#Для получения списка поддерживаемых версий, исполните комманду apt-cache madison docker-ce | awk '{ print $3 }' для каждого пакета
SYSTEM_VERSION=ubuntu #ubuntu, debian
SYSTEM_CODENAME=jammy #для Ubuntu - kinetic,jammy,focal,bionic. Для Debian - bullseye,buster. Для Astra Linux 1.7.3 - buster
DOCKER_INSTALL=manual #auto, manual. Для Astra Linux - manual.
DOCKER_VERSION=latest #latest, manual. Для Astra Linux - manual.
CONTAINERD_VER=containerd.io_1.6.9-1_amd64.deb
DOCKER_CE_VER=docker-ce_23.0.4-1~ubuntu.22.04~jammy_amd64.deb
DOCKER_CE_CLI_VER=docker-ce-cli_23.0.4-1~ubuntu.22.04~jammy_amd64.deb
DOCKER_BUILDX_VER=docker-buildx-plugin_0.10.4-1~ubuntu.22.04~jammy_amd64.deb
DOCKER_COMPOSE_VER=docker-compose-plugin_2.16.0-1~ubuntu.22.04~jammy_amd64.deb
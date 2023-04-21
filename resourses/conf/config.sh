#!/usr/bin/env bash

# Параметры окружения дистрибутива linux.
CURRENT_USER=${SUDO_USER}
INSTALL_DIR=$(eval echo ~${SUDO_USER})
WORK_DIR=./distrib_${VP_ARCHIVE}

SYSTEM_VERSION=ubuntu #ubuntu, debian, astra
SYSTEM_CODENAME=jammy #для Ubuntu - kinetic,jammy,focal,bionic. Для Debian - bullseye,buster. Для Astra Linux - buster

#Версия дистрибутива аналитической платформы Visiology.
VP_DISTR=distrib_${VP_ARCHIVE}.tar.xz
VP_RELEASE=2.30_3.1
VP_ARCHIVE=2.30+3.1

VP_VERSION=v2 # v2, v3, all.
VP_ADDRESS=$( hostname -I) #ip address, dns name.

#Параметры Docker
#Для получения списка поддерживаемых версий, исполните комманду apt-cache madison docker-ce | awk '{ print $3 }' для каждого пакета
DOCKER_INSTALL=repo #repo, manual. Для Astra Linux - manual.
DOCKER_VERSION=latest #latest, manual. Для Astra Linux - manual.
CONTAINERD_VER=1.6.9-1
DOCKER_CE_VER=23.0.1-1~debian.10~buster
DOCKER_CE_CLI_VER=23.0.1-1~debian.10~buster
DOCKER_BUILDX_VER=0.10.2-1~debian.10~buster
DOCKER_COMPOSE_VER=2.16.0-1~debian.10~buster

#Версии docker для Astra Linux
#CONTAINERD_VER=1.6.9-1
#DOCKER_CE_VER=23.0.1-1~debian.10~buster
#DOCKER_CE_CLI_VER=23.0.1-1~debian.10~buster
#DOCKER_BUILDX_VER=0.10.2-1~debian.10~buster
#DOCKER_COMPOSE_VER=2.16.0-1~debian.10~buster


#!/bin/bash

#Конфигурационные параметры платформы Visiology

# Параметры окружения
HOME_DIR=~/
WORK_DIR=~/distrib_$()
CURRENT_USER=$( echo $USER)


#Параметры Visiology
distr_filename=distrib_2.30+3.1
platform_version=2.30_3.1

#Параметры Docker
CONTAINERD_VER=containerd.io_1.6.9-1_amd64.deb
DOCKER_CE_VER=docker-ce_23.0.1-1~debian.10~buster_amd64.deb
DOCKER_CE_CLI_VER=docker-ce-cli_23.0.1-1~debian.10~buster_amd64.deb
DOCKER_BUILDX_VER=docker-buildx-plugin_0.10.2-1~debian.10~buster_amd64.deb
DOCKER_COMPOSE_VER=docker-compose-plugin_2.16.0-1~debian.10~buster_amd64.deb

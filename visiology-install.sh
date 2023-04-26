#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P

#Обновление системы и установка необходимых компонентов
apt-get update
apt-get upgrade -y
apt-get install ca-certificates curl gnupg lsb-release wget -y

#Папки и файлы конфигураций платформы.
. ./resourses/conf/config.sh

#Устанавливаем Docker
. ./resourses/docker/docker-install.sh

#Устанавливаем платформу
. ./resourses/platform/platform-install.sh

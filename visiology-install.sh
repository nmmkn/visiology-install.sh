#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null

#Обновление системы и установка необходимых компонентов
apt-get update
apt-get upgrade -y
apt-get install ca-certificates curl gnupg lsb-release wget git -y

#Папки и файлы конфигураций платформы.
. ./resourses/conf/config.sh


#Проверяем наличие и удаляем Docker из Snap
. ./resourses/docker/snap-remove.sh

#Устанавливаем Docker
. ./resourses/docker/docker-repo-install.sh

#Устанавливаем платформу
. ./resourses/platform/platform-install.sh
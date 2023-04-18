#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null

#Папки и файлы конфигураций платформы.
. ./resourses/conf/config.sh


#Проверяем наличие и удаляем Docker из Snap
. ./resourses/docker/snap-remove.sh

#Устанавливаем Docker
. ./resourses/docker/docker-repo-install.sh

#Устанавливаем платформу
. ./resourses/docker/platform-install.sh
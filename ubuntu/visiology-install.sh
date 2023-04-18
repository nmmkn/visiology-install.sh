#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null

#Папки и файлы конфигураций платформы.
. ./resourses/config.sh


#Проверяем наличие и удаляем Docker из Snap
. ./resourses/snap-remove.sh

#Устанавливаем Docker
. ./resourses/docker-repo-install.sh

#Устанавливаем платформу
. ./resourses/platform-install.sh
#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P

#Обновление системы и установка необходимых компонентов
apt-get update
apt-get upgrade -y
apt-get install ca-certificates curl gnupg lsb-release wget -y

#Подключаем репозиторий Docker
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/${SYSTEM_VERSION}/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/${SYSTEM_VERSION} $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update

#Папки и файлы конфигураций платформы.
. ./resourses/conf/config.sh

case ${DOCKER_INSTALL} in
repo)
. ./resourses/docker/snap-remove.sh #Для Ubuntu удаляем установку Docker из Snap.
. ./resourses/docker/docker-repo-install.sh
;;
manual)
. ./resourses/docker/docker-manual-install.sh
;;
*)
echo "DOCKER_INSTALL установленна неверно."
;;
esac

#Устанавливаем платформу
. ./resourses/platform/platform-install.sh
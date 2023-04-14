#!/bin/bash


#Папки и файлы конфигураций платформы.
. ./resourses/conf/config.sh


#Проверяем наличие и удаляем Docker из Snap
. ./docker/snap-remove.sh

#Устанавливаем Docker
. ./docker/docker-repo-install.sh

#Устанавливаем платформу
. ./platform/platform-install.sh
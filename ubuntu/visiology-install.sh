#!/bin/bash


#Папки и файлы конфигураций платформы.
. ./resourses/conf/config.sh


#Проверяем наличие и удаляем Docker из Snap
. ./resourses/docker/snap-remove.sh

#Устанавливаем Docker
. ./resourses/docker/docker-repo-install.sh

#Устанавливаем платформу
. ./resourses/platform/platform-install.sh
#!/bin/bash


#Папки и файлы конфигураций платформы.
. ./resourses/config.sh


#Проверяем наличие и удаляем Docker из Snap
. ./resourses/snap-remove.sh

#Устанавливаем Docker
. ./resourses/docker-repo-install.sh

#Устанавливаем платформу
. ./resourses/platform-install.sh
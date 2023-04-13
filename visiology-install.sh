#!/bin/bash

echo "Выберите вверсию для установки:"
echo "1 версия 2.30"
echo "2 версия 2.31"
echo "3 Выход"

read choice

case $choice in
1)
platform_version=2.30+3.1
;;
2)
platform_version=2.31+3.2
;;
3)
exit 0
;;
*)
echo "Выберите вверсию для установки:"

esac

distr_filename=distrib_$platform_version.tar.xz
distr_folder=distrib_$platform_version
#!/bin/bash

. ../conf/config.sh

cd $WORK_DIR
echo -e "\e[36mТип установки\e[0m"
distr=("Установка через образы" "Установка через Yandex Container Registry")
select opt in "${distr[@]}"
do
    case $opt in
        "Установка через образы")
            read -p "Скачать дистрибутив $platform_version? (Y/N)" answer
			case ${answer:0:1} in
				y|Y )
					wget "https://storage.yandexcloud.net/distributions/${distr_filename}.tar.xz"
					;;
				* )
					echo "Поиск дистрибутива.."
					;;
			esac
			if test -f ./"${distr_filename}.tar.xz"; then
						echo "Файл с дистрибутивом найден"
					else
						echo -e "\e[31mОтсутствует файл с дистрибутивом\e[0m"
						exit 1
					fi
			tar -xvf ${distr_filename}.tar.xz
			cd ${distr_filename}
			docker load < images/platform-deployment.tar.gz
			docker run -it --rm -u $(id -u):$(id -g) -v "$(pwd)":/mnt/volume -v /var/lib/visiology/certs:/mnt/visiology cr.yandex/crpe1mi33uplrq7coc9d/visiology/release/platform-deployment:$platform_version
			./load_images.sh
			cd v2 && FALSE=false ./prepare-folders.sh && cd ..
			v2/prepare-config.sh
			./run.sh -p $platform_url --start v2
			exit 0
            ;;
        "Установка через Yandex Container Registry")
            echo "Запросите токен для по ссылке https://oauth.yandex.ru/authorize?response_type=token&client_id=1a6990aa636648e9b2ef855fa7bec2fb"
			read -p "Введите токен:" token
			docker login --username oauth --password $token cr.yandex
			docker pull cr.yandex/crpe1mi33uplrq7coc9d/visiology/release/platform-deployment:$platform_version
			docker run -it --rm -u $(id -u):$(id -g) -v "$(pwd)":/mnt/volume -v /var/lib/visiology/certs:/mnt/visiology cr.yandex/crpe1mi33uplrq7coc9d/visiology/release/platform-deployment:$platform_version
			./load_from_release_dockerhub.sh -v v2
			cd v2 && FALSE=false ./prepare-folders.sh && cd ..
			v2/prepare-config.sh
			./run.sh -p $platform_url --start v2
			exit 0
            ;;
        *) echo "invalid option";;
    esac
done
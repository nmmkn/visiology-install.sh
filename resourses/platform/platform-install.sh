#!/usr/bin/env bash

#cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null
. ./resourses/conf/config.sh

cd $INSTALL_DIR
read -p "Скачать дистрибутив $VP_RELEASE? (Y/N)" answer
			case ${answer:0:1} in
				y|Y )
					wget "https://storage.yandexcloud.net/distributions/${VP_DISTR}"
					;;
				* )
					echo "Поиск дистрибутива.."
					;;
			esac
			if test -f ./"${VP_DISTR}"; then
						echo "Файл с дистрибутивом найден"
					else
						echo -e "\e[31mОтсутствует файл с дистрибутивом\e[0m"
						exit 1
					fi
			tar -xvf ${VP_DISTR}
			cd ${WORK_DIR}
			docker load < images/platform-deployment.tar.gz
			docker run -it --rm -u $(id -u):$(id -g) -v "$(pwd)":/mnt/volume -v /var/lib/visiology/certs:/mnt/visiology cr.yandex/crpe1mi33uplrq7coc9d/visiology/release/platform-deployment:${VP_RELEASE}
			./load_images.sh --version ${VP_VERSION}
			cd v2 && FALSE=false ./prepare-folders.sh && cd ..
			v2/prepare-config.sh
			#./run.sh -p $platform_url --start v2
			exit 0
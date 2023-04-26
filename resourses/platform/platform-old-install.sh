#!/usr/bin/env bash

. ./resourses/conf/config.sh

cd ${INSTALL_DIR}

wget -vnc "https://storage.yandexcloud.net/distributions/${VP_DISTR}"

tar -xvf ${VP_DISTR}
cd ${WORK_DIR}
chmod +x *.sh
./load_images.sh




#docker load < images/platform-deployment.tar.gz
#docker run -it --rm -u $(id -u):$(id -g) -v "$(pwd)":/mnt/volume -v /var/lib/visiology/certs:/mnt/visiology cr.yandex/crpe1mi33uplrq7coc9d/visiology/release/platform-deployment:${VP_RELEASE}
#./load_images.sh --version ${VP_VERSION}
#cd v2 && FALSE=false ./prepare-folders.sh && cd ..
#v2/prepare-config.sh
#./run.sh -p $platform_url --start ${VP_VERSION}
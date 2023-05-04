#!/usr/bin/env bash

. ./resourses/conf/config.sh

cd ${INSTALL_DIR}
docker swarm init
wget -vnc "https://storage.yandexcloud.net/distributions/${VP_DISTR}"

tar -xvf ${VP_DISTR}
cd ${WORK_DIR}
chmod +x *.sh
./load_images.sh
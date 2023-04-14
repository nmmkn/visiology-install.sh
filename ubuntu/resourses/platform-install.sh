#!/bin/bash

. ./config.sh

cd $HOME_DIR
wget "https://storage.yandexcloud.net/distributions/$VP_DISTR"
tar -xvf $VP_DIST
cd $WORK_DIR
chmod +x *.sh

docker load < images/platform-deployment.tar.gz
docker run -it --rm -u $(id -u):$(id -g) -v "$(pwd)":/mnt/volume -v /var/lib/visiology/certs:/mnt/visiology cr.yandex/crpe1mi33uplrq7coc9d/visiology/release/platform-deployment:$VP_REALESE

./load_images.sh -v $VP_VERSION

cd v2 && \
sudo FALSE=false ./prepare-folders.sh && \
cd ..

./v2/prepare-config.sh

./run.sh -p $VP_ADDRESS
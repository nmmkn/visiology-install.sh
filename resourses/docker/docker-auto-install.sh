#!/bin/bash

. ./resourses/conf/config.sh

curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
groupadd docker
usermod -aG docker ${CURRENT_USER}
sudo --user=${CURRENT_USER} newgrp docker
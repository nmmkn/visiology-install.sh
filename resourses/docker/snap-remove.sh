#!/usr/bin/env bash

. ./resourses/conf/config.sh

snap remove docker
sed -i 's.ListenStream=/run/docker\.sock.ListenStream=/var\/run\/docker\.sock.g' /lib/systemd/system/docker.socket
systemctl daemon-reload
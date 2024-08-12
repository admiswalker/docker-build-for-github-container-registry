#!/bin/bash
SCRIPT_DIR=`cd $(dirname ${BASH_SOURCE:-$0}); pwd`
cd ${SCRIPT_DIR}/../../

TMP="./tmp/docker_build/raspberry_pi_64"
mkdir -p ${TMP}
cd ${TMP}

wget https://downloads.raspberrypi.org/raspios_full_arm64/root.tar.xz
REPOSITORY_NAME="raspberry_pi"
docker image import root.tar.xz ${REPOSITORY_NAME}/raspios_full_arm64:2022-04-04_bullseye
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes

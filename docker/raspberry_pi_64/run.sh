#!/bin/sh
docker run \
       -u `id -u`:`id -g` \
       -v /etc/group:/etc/group:ro \
       -v /etc/passwd:/etc/passwd:ro \
       -v /etc/shadow:/etc/shadow:ro \
       -v /etc/sudoers.d:/etc/sudoers.d:ro \
       --rm -it --name sstd_raspberry_pi_64 \
       -v $PWD:/home -w /home \
       sstd_raspberry_pi_64 /bin/sh
#       sstd_raspberry_pi_64/raspios_full_arm64:2022-04-04_bullseye /bin/sh

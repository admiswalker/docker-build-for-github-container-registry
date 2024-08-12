#!/bin/bash
SCRIPT_DIR=`cd $(dirname ${BASH_SOURCE:-$0}); pwd`
docker build -t sstd_raspberry_pi_64 $SCRIPT_DIR

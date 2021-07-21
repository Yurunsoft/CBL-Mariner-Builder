#!/bin/bash
sudo apt update && \
sudo apt install make tar wget curl rpm qemu-utils golang-go genisoimage python2-minimal bison gawk && \
git clone https://github.com/microsoft/CBL-Mariner.git && \
cd CBL-Mariner/toolkit && \
sudo make iso REBUILD_TOOLS=y REBUILD_PACKAGES=n CONFIG_FILE=./imageconfigs/full.json && \
cd ../ && \
result_file_path=$(find out/images/full -maxdepth 1 -name full-*.iso) && \
echo $result_file_path && \
result_file_name=${result_file_path##*/}
echo $result_file_name && \
echo "result_file_path=CBL-Mariner/$result_file_path" >> $GITHUB_ENV && \
echo "result_file_name=${result_file_name}" >> $GITHUB_ENV

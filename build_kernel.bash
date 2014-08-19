#!/bin/bash

script_path="`pwd`"
kernel_path="/usr/src/linux"

cp "${script_path}/config" "${kernel_path}/.config"

cd "${kernel_path}"
make oldconfig
kernel_version=`make kernelversion`

cp "${kernel_path}/.config" "${script_path}/config"

genkernel --install --symlink --no-splash --lvm --kernel-config="${script_path}/config" all

cd "${script_path}"
git add config
git commit --verbose -e -m "linux-${kernel_version}"

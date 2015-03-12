#!/usr/bin/env sh

script_path="`pwd`"
kernel_path="/usr/src/linux"

cd "${kernel_path}"
kernel_version=`make kernelversion`

time genkernel --install --symlink --no-splash --lvm --kernel-config="${script_path}/config" --makeopts=-j5 all

cd "${script_path}"
git add config
git commit --verbose -m "linux-${kernel_version}"

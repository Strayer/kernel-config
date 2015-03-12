#!/usr/bin/env sh

script_path="`pwd`"
kernel_path="/usr/src/linux"

cp "${script_path}/config" "${kernel_path}/.config"

cd "${kernel_path}"
make oldconfig

cp "${kernel_path}/.config" "${script_path}/config"

cd "${script_path}"

git diff HEAD "${script_path}/config"

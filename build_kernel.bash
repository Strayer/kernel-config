#!/bin/bash
cd ${0%/*}
genkernel --install --symlink --no-splash --lvm --kernel-config=./config all

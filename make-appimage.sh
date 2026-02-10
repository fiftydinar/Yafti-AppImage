#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q yafti | awk '{print $2; exit}')
export ARCH VERSION
export OUTPATH=./dist
# export ADD_HOOKS="self-updater.bg.hook" # This is excluded because it's going to be used in immutable directories
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export APPNAME=yafti
export MAIN_BIN=yafti
export ICON=DUMMY
export DESKTOP=DUMMY
export DEPLOY_SYS_PYTHON=1
export DEPLOY_GTK=1
export GTK_DIR=gtk-4.0
export ANYLINUX_LIB=1
export ALWAYS_SOFTWARE=1

# Deploy dependencies
quick-sharun /usr/bin/yafti -- ./yafti-config.yml
quick-sharun /usr/lib/libgirepository*

# Turn AppDir into AppImage
quick-sharun --make-appimage

# Test the final app
quick-sharun --test ./dist/*.AppImage ./yafti-config.yml --force

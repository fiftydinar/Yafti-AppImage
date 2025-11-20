#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q yafti | awk '{print $2; exit}')
export ARCH VERSION
export OUTPATH=./dist
# export ADD_HOOKS="self-updater.bg.hook" # This is excluded because it's going to be used in immutable directories
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export APPNAME=yafti
export ICON=DUMMY
export DESKTOP=DUMMY
export DEPLOY_SYS_PYTHON=1
export DEPLOY_OPENGL=1
export DEPLOY_GTK=1
export GTK_DIR=gtk-4.0

# Deploy dependencies
quick-sharun /usr/bin/yafti -- ./yafti-config.yml
quick-sharun /usr/lib/libgirepository*

# Turn AppDir into AppImage
quick-sharun --make-appimage

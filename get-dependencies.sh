#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Building yafti..."
echo "---------------------------------------------------------------"
sed -i 's|EUID == 0|EUID == 69|g' /usr/bin/makepkg
git clone https://github.com/ublue-os/yafti.git ./yafti && (
	cd ./yafti
  mv ./pkg/PKGBUILD ./PKGBUILD
  sed -i 's/^pkgver=.*/pkgver=0.10.2/' ./PKGBUILD
  makepkg -fs --noconfirm
	ls -la .
	pacman --noconfirm -U *.pkg.tar.*
)

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

pkgname="linux-kernel"
arch=("amd64" "arm64")
pkgver="6.18~rc3"
source=("https://github.com/oklopfer/debs/raw/master/empty.tar.xz")
pacdeps=("linux-headers-deb" "linux-headers-generic-deb" "linux-modules-deb" "linux-image-unsigned-deb")
pkgdesc="Provides the latest Linux kernel via the Ubuntu mainline repositories"
maintainer=("Oren Klopfer <oren@taumoda.com>")
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline")

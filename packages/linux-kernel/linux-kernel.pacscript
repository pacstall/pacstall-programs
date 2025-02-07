pkgname="linux-kernel"
arch=("amd64" "arm64")
pkgver="6.13~rc7"
source=("https://github.com/oklopfer/debs/raw/master/empty.tar.xz")
pacdeps=("linux-image-unsigned-deb" "linux-modules-deb" "linux-headers-deb" "linux-headers-generic-deb")
pkgdesc="Provides the latest Linux kernel via the Debian mainline repositories"
maintainer=("Oren Klopfer <oren@taumoda.com>")
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline")

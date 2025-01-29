pkgname="linux-kernel-stable"
arch=("amd64" "arm64")
pkgver="6.12.11"
source=("https://github.com/oklopfer/debs/raw/master/empty.tar.xz")
pacdeps=("linux-headers-stable-deb" "linux-headers-generic-stable-deb" "linux-image-unsigned-stable-deb")
pkgdesc="Provides the latest stable Linux kernel via the Debian mainline repositories"
maintainer=("Oren Klopfer <oren@taumoda.com>")
repology=("project: linux" "repo: distrowatch")

pkgname="linux-kernel-lts-6.6"
arch=("amd64" "arm64")
pkgver="6.6.63"
source=("https://github.com/oklopfer/debs/raw/master/empty.tar.xz")
pacdeps=("linux-headers-lts-6.6-deb" "linux-headers-generic-lts-6.6-deb" "linux-modules-lts-6.6-deb" "linux-image-unsigned-lts-6.6-deb")
pkgdesc="Linux kernel LTS from Ubuntu Mainline Kernel PPA"
incompatible=("debian:10" "debian:11" "debian:12")
maintainer=("James Ed Randson <jimedrand@disroot.org>")

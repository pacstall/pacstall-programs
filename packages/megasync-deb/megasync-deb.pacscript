pkgname="megasync-deb"
gives="megasync"
repology=("project: megasync")
pkgver="5.2.0"
build_version="2.1"
replaces=("${gives}")
breaks=("${gives}" "${gives}-bin" "${gives}-git" "${gives}-app" "${gives}-deb")
incompatible=("debian:sid" "*:buster" "*:stretch" "*:jessie" "debian:testing" "*:bionic" "*:focal" "*:kinetic")
arch=("amd64")

case "${DISTRO#*:}" in
  mantic)
    distro_base="xUbuntu"
    distro_release="23.10"
    sha256sums=("bbd393d4da780f7bad760b5f439a257ca2aa8f7b9d478cc62e28f55366f95460")
    ;;
  jammy)
    distro_base="xUbuntu"
    distro_release="22.04"
    sha256sums=("104e912eb813dd47ffb8ad3ae2b76760ebbe09492162184d14308e9cc80119f9")
    ;;
  bookworm)
    distro_base="Debian"
    distro_release="12"
    sha256sums=("194be72c321812d663e9c8296096965b8e7f5f802bbfe410b09b68fa65c8090d")
    ;;
  bullseye)
    distro_base="Debian"
    distro_release="11"
    sha256sums=("0b414c6013c77596683ce5209bd0010bddba4a8bc089b509b77291faa0c040e8")
    ;;
  *) ;;
esac

source=("https://mega.nz/linux/repo/${distro_base}_${distro_release}/amd64/megasync_${pkgver}-${build_version}_amd64.deb")
url="https://mega.nz"
pkgdesc="Easy automated syncing between your computers and your MEGA cloud drive"
maintainer=("Arrowsome <ramtintoosi@gmail.com>")

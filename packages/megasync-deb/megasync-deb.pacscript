pkgname="megasync-deb"
gives="megasync"
repology=("project: megasync")
pkgver="5.2.1"
replaces=("${gives}")
breaks=("${gives}" "${gives}-bin" "${gives}-git" "${gives}-app" "${gives}-deb")
incompatible=("debian:sid" "*:buster" "*:stretch" "*:jessie" "debian:testing" "*:bionic" "*:focal" "*:kinetic")
arch=("amd64")

case "${DISTRO#*:}" in
  noble)
    distro_base="xUbuntu"
    distro_release="24.04"
    build_version="2.1"
    sha256sums=("3e1f9816c449dede48a095d7cdcba733be26739fb1e6cbc1a43a47a372654865")
    ;;
  mantic)
    distro_base="xUbuntu"
    distro_release="23.10"
    build_version="4.1"
    sha256sums=("3520e7837a88c78e9a7e02247968526fa3c46cb29747da4209428819d9f3d84a")
    ;;
  jammy)
    distro_base="xUbuntu"
    distro_release="22.04"
    build_version="4.1"
    sha256sums=("5b8ce6c03a0a933832451eab2425519e7fa8480f58b5a0c6d9457476ec0e9aa1")
    ;;
  bookworm)
    distro_base="Debian"
    distro_release="12"
    build_version="4.1"
    sha256sums=("5a63deac549fd09daeca479fd0bbbf0cb329dc9bef1245a334a1a75535548635")
    ;;
  bullseye)
    distro_base="Debian"
    distro_release="11"
    build_version="4.1"
    sha256sums=("304ae53fbdbbfa5fd290c97129e93df9ef0ea5610b94a68e8a4e6d8cee8fd1b3")
    ;;
  *) ;;
esac

source=("https://mega.nz/linux/repo/${distro_base}_${distro_release}/amd64/megasync_${pkgver}-${build_version}_amd64.deb")
url="https://mega.nz"
pkgdesc="Easy automated syncing between your computers and your MEGA cloud drive"
maintainer=("Arrowsome <ramtintoosi@gmail.com>")

name="megasync-deb"
gives="megasync"
repology=("project: megasync")
pkgver="4.12.2"
build_version="2.1"
replace=("${gives}")
breaks=("${gives}" "${gives}-bin" "${gives}-git" "${gives}-app" "${gives}-deb")
incompatible=("debian:sid" "*:buster" "*:stretch" "*:jessie" "debian:testing" "*:bionic" "*:focal" "*:kinetic")
arch=("amd64")

case "${DISTRO#*:}" in
  mantic)
    distro_base="xUbuntu"
    distro_release="23.10"
    hash="badbddc147ec4c8e8c372fbd6e2c67dd3306c9d3a9b3348b75d705338ae8c8e0"
    ;;
  jammy)
    distro_base="xUbuntu"
    distro_release="22.04"
    hash="adae37285c485788ed777ac32947d9b1b8fc2fb736b92e94b924b55fa5f5bc73"
    ;;
  bookworm)
    distro_base="Debian"
    distro_release="12"
    hash="f33f5909196b8063e03de02040c97da981e035011dcd7d2d909f14d16c83daa9"
    ;;
  bullseye)
    distro_base="Debian"
    distro_release="11"
    hash="adae37285c485788ed777ac32947d9b1b8fc2fb736b92e94b924b55fa5f5bc73"
    ;;
  *);;
esac

url="https://mega.nz/linux/repo/${distro_base}_${distro_release}/amd64/megasync_${pkgver}-${build_version}_amd64.deb"
homepage="https://mega.nz"
pkgdesc="Easy automated syncing between your computers and your MEGA cloud drive"
maintainer="Arrowsome <ramtintoosi@gmail.com>"

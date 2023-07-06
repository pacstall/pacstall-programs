name="megasync-deb"
gives="megasync"
repology=("project: megasync")
version="4.9.5"
build_version="1.1"
replace=("${gives}")
breaks=("${gives}" "${gives}-bin" "${gives}-git" "${gives}-app" "${gives}-deb")
incompatible=("debian:sid" "*:buster" "*:stretch" "*:jessie" "debian:testing" "*:bionic" "*:focal" "*:kinetic" "*:mantic")
arch=("amd64")

case "${DISTRO#*:}" in
  lunar)
    distro_base="xUbuntu"
    distro_release="23.04"
    hash="f49c316c842e727deb222d84a829adde6a470581751eb101e920b11a3c368b1b"
    ;;
  jammy)
    distro_base="xUbuntu"
    distro_release="22.04"
    hash="69a0ef997f353ade109bfb74a58582e34d23574a23db69ee43a96685f4d2bdcf"
    ;;
  trixie)
    distro_base="Debian"
    distro_release="testing"
    hash="6a71b09fa3df1f4e1a98f1c89cb8ab4f5aa5e2a63a9e44f3baabaf089b98e483"
    ;;
  bookworm)
    distro_base="Debian"
    distro_release="12"
    hash="8f77fb8bffcf8ae68993b6d890a0dfd5ce23963c5e12b8e32cf69e1f6e2d0d9c"
    ;;
  bullseye)
    distro_base="Debian"
    distro_release="11"
    hash="dab1ebe56184f91f209331189daddf46eac897b9d64bc70a7bf8d3dcbfbf2562"
    ;;
  *) ;;
esac

url="https://mega.nz/linux/repo/${distro_base}_${distro_release}/amd64/megasync_${version}-${build_version}_amd64.deb"
homepage="https://mega.nz"
description="Easy automated syncing between your computers and your MEGA cloud drive"
maintainer="Arrowsome <ramtintoosi@gmail.com>"

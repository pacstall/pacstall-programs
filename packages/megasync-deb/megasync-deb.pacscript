name="megasync-deb"
gives="megasync"
repology=("project: megasync")
pkgver="4.9.6"
build_version="1.1"
replace=("${gives}")
breaks=("${gives}" "${gives}-bin" "${gives}-git" "${gives}-app" "${gives}-deb")
incompatible=("debian:sid" "*:buster" "*:stretch" "*:jessie" "debian:testing" "*:bionic" "*:focal" "*:kinetic" "*:mantic")
arch=("amd64")

case "${DISTRO#*:}" in
  lunar)
    distro_base="xUbuntu"
    distro_release="23.04"
    hash="5f37dacf8da5ca3efaca50fb462553d361ef34a75a553c5fcd2202f2e624b56a"
    ;;
  jammy)
    distro_base="xUbuntu"
    distro_release="22.04"
    hash="9c7980b6f7551786daff03738528bdc70b7df5c2193953c80140af50f63b4121"
    ;;
  bookworm)
    distro_base="Debian"
    distro_release="12"
    hash="083bb006cc71038e04fb90b97f6b837f0539c7f8c2f4eaa4c38890ef12c134ac"
    ;;
  bullseye)
    distro_base="Debian"
    distro_release="11"
    hash="38a30c5743f250975502bde45b3fd87ffaae031ca76aa6fd69d6605cf363662c"
    ;;
  *) ;;
esac

url="https://mega.nz/linux/repo/${distro_base}_${distro_release}/amd64/megasync_${pkgver}-${build_version}_amd64.deb"
homepage="https://mega.nz"
pkgdesc="Easy automated syncing between your computers and your MEGA cloud drive"
maintainer="Arrowsome <ramtintoosi@gmail.com>"

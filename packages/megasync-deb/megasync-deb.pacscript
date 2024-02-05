name="megasync-deb"
gives="megasync"
repology=("project: megasync")
pkgver="4.11.0"
build_version="3.1"
replace=("${gives}")
breaks=("${gives}" "${gives}-bin" "${gives}-git" "${gives}-app" "${gives}-deb")
incompatible=("debian:sid" "*:buster" "*:stretch" "*:jessie" "debian:testing" "*:bionic" "*:focal" "*:kinetic")
arch=("amd64")

case "${DISTRO#*:}" in
  mantic)
    distro_base="xUbuntu"
    distro_release="23.10"
    hash="375385a178bf86039c406d9f691aee187c47308e4bab11d0ea135c97c919f900"
    ;;
  lunar)
    distro_base="xUbuntu"
    distro_release="23.04"
    hash="d461cb63bb7ef78884eb562857bf6723939d72042894c27222479e76f4d658ea"
    ;;
  jammy)
    distro_base="xUbuntu"
    distro_release="22.04"
    hash="03a9fe62162e69df95c4a4394319110964de2cf019db3349b3666a1ea9d492f2"
    ;;
  bookworm)
    distro_base="Debian"
    distro_release="12"
    hash="a72c97126443e62c90514f0724cdebeb3e4707a5f6812c909c2f3538905095f7"
    ;;
  bullseye)
    distro_base="Debian"
    distro_release="11"
    hash="ae9b59d0d11e2ed0db9dee7e364ffb77fbcd3f03b2fc86fbf3db1e18c448b2a3"
    ;;
  *) ;;
esac

url="https://mega.nz/linux/repo/${distro_base}_${distro_release}/amd64/megasync_${pkgver}-${build_version}_amd64.deb"
homepage="https://mega.nz"
pkgdesc="Easy automated syncing between your computers and your MEGA cloud drive"
maintainer="Arrowsome <ramtintoosi@gmail.com>"

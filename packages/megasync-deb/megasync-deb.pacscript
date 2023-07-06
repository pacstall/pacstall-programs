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
    hash="e1c6d66b9946d0e5a427560a39c0b2affe72714b57b3a41ceefac8304a0a3113"
    ;;
  jammy)
    distro_base="xUbuntu"
    distro_release="22.04"
    hash="35a22daee1b9b5b8b2c619ebf80614a9781314cc1c5a3ad80d55af9d6cd6e378"
    ;;
  bookworm)
    distro_base="Debian"
    distro_release="12"
    hash="6fc4eda65d253bb42d4550e6a80fa0a6eda15978fe6dcebb61ff3e7a38c55096"
    ;;
  bullseye)
    distro_base="Debian"
    distro_release="11"
    hash="929189eeaed61ce33efba1a3ead6159cde9b9601147a68854345a1b9b955cda5"
    ;;
  *) ;;
esac

url="https://mega.nz/linux/repo/${distro_base}_${distro_release}/amd64/megasync_${version}-${build_version}_amd64.deb"
homepage="https://mega.nz"
description="Easy automated syncing between your computers and your MEGA cloud drive"
maintainer="Arrowsome <ramtintoosi@gmail.com>"

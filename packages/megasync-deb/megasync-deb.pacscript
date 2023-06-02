name="megasync-deb"
gives="megasync"
repology=("project: megasync")
version="4.9.4"
build_version="-3.1"
replace=("${gives}")
breaks=("${gives}" "${gives}-bin" "${gives}-git" "${gives}-app" "${gives}-deb")
incompatible=("debian:sid" "debian:buster" "debian:stretch" "ubuntu:devel" "ubuntu:18.*" "ubuntu:19.*" "ubuntu:20.*" "ubuntu:21.*" "ubuntu:23.10")
arch=("amd64")

setup_xubuntu_vars() {
  local codename=$1

  case "${codename}" in
    lunar)
      distro_release="23.04"
      hash="e1c6d66b9946d0e5a427560a39c0b2affe72714b57b3a41ceefac8304a0a3113"
      ;;
    kinetic)
      distro_release="22.10"
      hash="aab733084d4ec041bc15423df9d33319ec1302576ef248708768cf5e23cb1336"
      ;;
    jammy)
      distro_release="22.04"
      hash="35a22daee1b9b5b8b2c619ebf80614a9781314cc1c5a3ad80d55af9d6cd6e378"
      ;;
    *)
      return 1
      ;;
  esac

  distro_base="xUbuntu"
}

setup_debian_vars() {
  local codename=$1

  case "${codename}" in
    bookworm)
      distro_release="testing"
      hash="6fc4eda65d253bb42d4550e6a80fa0a6eda15978fe6dcebb61ff3e7a38c55096"
      ;;
    bullseye)
      distro_release="11"
      hash="929189eeaed61ce33efba1a3ead6159cde9b9601147a68854345a1b9b955cda5"
      ;;
    *)
      return 1
      ;;
  esac

  distro_base="Debian"
}

if grep -q '^UBUNTU_CODENAME=' /etc/os-release; then
  ubuntu_codename="$(grep '^UBUNTU_CODENAME=' /etc/os-release | cut -d '=' -f 2)"
  setup_xubuntu_vars "${ubuntu_codename}"
elif grep -q '^ID=debian' /etc/os-release; then
  debian_codename="$(grep '^VERSION_CODENAME=' /etc/os-release | cut -d '=' -f 2)"
  setup_debian_vars "${debian_codename}"
elif grep -q '^DEBIAN_CODENAME=' /etc/os-release; then
  debian_codename="$(grep '^DEBIAN_CODENAME=' /etc/os-release | cut -d '=' -f 2)"
  setup_debian_vars "${debian_codename}"
fi

url="https://mega.nz/linux/repo/${distro_base}_${distro_release}/amd64/megasync_${version}${build_version}_amd64.deb"
homepage="https://mega.nz"
description="Easy automated syncing between your computers and your MEGA cloud drive"
maintainer="Arrowsome <ramtintoosi@gmail.com>"

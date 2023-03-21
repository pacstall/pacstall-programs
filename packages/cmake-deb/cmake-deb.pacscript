name="cmake-deb"
gives="cmake"
version="3.25.1"
description="CMake data files (modules, templates and documentation)"
pacdeps=("cmake-data-deb")
codename="$(lsb_release -cs)"
case "${codename}" in
  "bullseye")
    url="http://ftp.debian.org/debian/pool/main/c/cmake/cmake_${version}-1~bpo11+1_amd64.deb"
    hash="6c7c8d91c045ccf44c9cc7dc1f05d8431707df4651bf18b4a3ee34847bc205f3"
    ;;
  *)
    url="http://archive.ubuntu.com/ubuntu/pool/main/c/cmake/cmake_${version}-1_amd64.deb"
    hash="f78feb5db10ceacf701f41698f555c4be9fe6426f940dfd921b5c4e41fe48a7a"
    ;;
esac
arch=('amd64')
maintainer="Zahrun <Zahrun@github.com>"

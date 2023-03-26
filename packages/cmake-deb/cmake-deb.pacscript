name="cmake-deb"
gives="cmake"
version="3.25.1"
description="CMake data files (modules, templates and documentation)"
pacdeps=("cmake-data-deb")
codename="$(lsb_release -cs)"
case "${codename}" in
  "bullseye")
    url="http://ftp.debian.org/debian/pool/main/c/cmake/cmake_${version}-1~bpo11+1_amd64.deb"
    hash="5561f20944ef4d9d3ea496bc92dff5b1d5adea3cfee1fa302a7298bedeb03f9e"
    ;;
  *)
    url="http://archive.ubuntu.com/ubuntu/pool/main/c/cmake/cmake_${version}-1_amd64.deb"
    hash="f78feb5db10ceacf701f41698f555c4be9fe6426f940dfd921b5c4e41fe48a7a"
    ;;
esac
arch=('amd64')
maintainer="Zahrun <Zahrun@github.com>"

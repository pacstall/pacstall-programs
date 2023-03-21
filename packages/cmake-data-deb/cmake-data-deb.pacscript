name="cmake-data-deb"
gives="cmake-data"
version="3.25.1"
description="CMake data files (modules, templates and documentation)"
codename="$(lsb_release -cs)"
case "${codename}" in
  bullseye)
    url="http://ftp.debian.org/debian/pool/main/c/cmake/cmake-data_${version}-1~bpo11+1_all.deb"
    hash="6c7c8d91c045ccf44c9cc7dc1f05d8431707df4651bf18b4a3ee34847bc205f3"
    ;;
  *)
    url="http://archive.ubuntu.com/ubuntu/pool/main/c/cmake/cmake-data_${version}-1_all.deb"
    hash="aac42cff2659b9214e65c72bd44ac23d7353d247ec5dd8d56d0f4dff97ffd41e"
    ;;
esac
arch=('amd64')
maintainer="Zahrun <Zahrun@github.com>"

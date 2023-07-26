name="cmake-data-deb"
gives="cmake-data"
version="3.27.0"
description="CMake data files (modules, templates and documentation)"
codename="$(lsb_release -cs)"
case "${codename}" in
  "bullseye")
    url="http://ftp.debian.org/debian/pool/main/c/cmake/cmake-data_${version}-2_all.deb"
    hash="5f94ce4ed55111d56a3f387e81edc713099b5084a15dfb7d9c620e38bf207e96"
    ;;
  *)
    url="http://archive.ubuntu.com/ubuntu/pool/main/c/cmake/cmake-data_${version}-2_all.deb"
    hash="17936d368614bd835ad2a79c87e25e06199109c87a5e4351749899c8aff8ddd8"
    ;;
esac
arch=('amd64')
maintainer="Zahrun <Zahrun@github.com>"
repology=("project: cmake" "repo: debian_unstable")

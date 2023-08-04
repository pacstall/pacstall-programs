name="obs-backgroundremoval"
repology=("project: obs-backgroundremoval")
version="1.1.2"
url="https://github.com/royshil/obs-backgroundremoval/archive/refs/tags/${version}.tar.gz"
build_depends=("libobs-dev" "libcurl4-openssl-dev" "libssl-dev" "qt6-base-dev" "libsimde-dev" "ninja-build")
pacdeps=("cmake-deb")
breaks=("${name}-git")
replace=("${name}")
arch=('amd64')
description="OBS plugin to replace the background in portrait images and video"
hash="1080909535d6e5d46af5e8e8b56c4b369ef5a101edf93ee74d06f957e96bc7cf"
maintainer="Zahrun <Zahrun@github.com>"

incompatible=('ubuntu:jammy' 'ubuntu:focal' 'ubuntu:bionic' 'debian:buster' 'debian:bullseye')

build() {
  mkdir build_x86_64 && cd build_x86_64 || return 1
  cmake --preset linux-x86_64 -DUSE_SYSTEM_CURL=ON -DCMAKE_INSTALL_PREFIX:PATH="${pkgdir}"/usr .. > /dev/null
  cmake --build . -j"${NCPU}" > /dev/null
}

package() {
  cd build_x86_64 || return 1
  sudo cmake --install . > /dev/null
  sudo mkdir -p "${pkgdir}"/usr/lib/x86_64-linux-gnu
  sudo mv "${pkgdir}"/usr/lib/obs-plugins "${pkgdir}"/usr/lib/x86_64-linux-gnu/
  sudo install -Dm644 "../LICENSE" -t "${pkgdir}/usr/share/licenses/${name}"
}

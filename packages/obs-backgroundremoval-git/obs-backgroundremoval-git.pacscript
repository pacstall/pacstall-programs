name="obs-backgroundremoval-git"
pkgname="obs-backgroundremoval"
url="https://github.com/royshil/obs-backgroundremoval.git"
makedepends=("libobs-dev" "libcurl4-openssl-dev" "libssl-dev" "qt6-base-dev" "libsimde-dev" "ninja-build")
pacdeps=("cmake-deb")
breaks=("${pkgname}")
replace=("${pkgname}")
gives=("${pkgname}")
arch=('amd64')
description="OBS plugin to replace the background in portrait images and video"
maintainer="Zahrun <Zahrun@github.com>"
pkgver() {
  git ls-remote "${url}" refs/heads/main | cut -f1 | cut -c1-8
}
version="$(pkgver)"
incompatible=('ubuntu:jammy' 'ubuntu:focal' 'ubuntu:bionic' 'debian:buster' 'debian:bullseye')

build() {
  mkdir build_x86_64 && cd build_x86_64 || return 1
  cmake --preset linux-x86_64 -DCMAKE_INSTALL_PREFIX:PATH="${pkgdir}"/usr .. > /dev/null
  cmake --build . -j"${NCPU}" > /dev/null
}

package() {
  cd build_x86_64 || return 1
  sudo cmake --install . > /dev/null
  sudo mkdir -p "${pkgdir}"/usr/lib/x86_64-linux-gnu/
  sudo mv "${pkgdir}"/usr/lib/obs-plugins "${pkgdir}"/usr/lib/x86_64-linux-gnu/
  sudo install -Dm644 "../LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

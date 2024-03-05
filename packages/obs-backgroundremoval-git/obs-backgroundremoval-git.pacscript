name="obs-backgroundremoval-git"
pkgname="obs-backgroundremoval"
source=("https://github.com/royshil/obs-backgroundremoval.git")
pkgver="1.1.8"
makedepends=("libobs-dev" "libcurl4-openssl-dev" "libssl-dev" "qt6-base-dev" "libgl1-mesa-dev" "ninja-build" "cmake")
breaks=("${pkgname}")
replaces=("${pkgname}")
gives=("${pkgname}")
arch=('amd64')
pkgdesc="OBS plugin to replace the background in portrait images and video"
maintainer="Zahrun <Zahrun@github.com>"
incompatible=('*:jammy' '*:focal' '*:bionic' '*:buster' '*:bullseye')

build() {
  cmake --preset linux-x86_64 -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build_x86_64 --parallel
}

package() {
  sudo cmake --install build_x86_64 --prefix "${pkgdir}"/usr
  sudo install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${name}"
}

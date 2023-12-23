name="obs-backgroundremoval"
repology=("project: obs-backgroundremoval")
pkgver="1.1.8"
url="https://github.com/royshil/obs-backgroundremoval/archive/refs/tags/${pkgver}.tar.gz"
makedepends=("libobs-dev" "libcurl4-openssl-dev" "libssl-dev" "qt6-base-dev" "libgl1-mesa-dev" "ninja-build")
pacdeps=("cmake-deb")
breaks=("${name}-git")
replace=("${name}")
arch=('amd64')
pkgdesc="OBS plugin to replace the background in portrait images and video"
hash="c84a6f2cb40fe2df0e8f7745ad41b1dbbf21aea3a3b61de20e2d79b9fc412421"
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

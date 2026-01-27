pkgname="obs-backgroundremoval"
repology=("project: obs-backgroundremoval")
pkgver="1.1.12"
source=("@${pkgname}~${pkgver}::https://github.com/royshil/obs-backgroundremoval/archive/refs/tags/${pkgver}.tar.gz")
makedepends=("libobs-dev" "libcurl4-openssl-dev" "libssl-dev" "qt6-base-dev" "libgl1-mesa-dev" "ninja-build" "cmake")
breaks=("${pkgname}-git")
replaces=("${pkgname}")
arch=('amd64')
pkgdesc="OBS plugin to replace the background in portrait images and video"
sha256sums=("50687434e49c005a881977ea46877c00da974a10810db2ee23b0b3fbeed7d6aa")
maintainer=("Zahrun <zahrunAtmurenaDotio>")

incompatible=('*:jammy' '*:focal' '*:bionic' '*:buster' '*:bullseye')

build() {
  cd "${pkgname}~${pkgver}"
  cmake --preset linux-x86_64 -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build_x86_64 --parallel
}

package() {
  cd "${pkgname}~${pkgver}"
  cmake --install build_x86_64 --prefix "${pkgdir}"/usr
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

pkgname="obs-backgroundremoval"
repology=("project: obs-backgroundremoval")
pkgver="1.3.5"
source=("@${pkgname}~${pkgver}::https://github.com/royshil/obs-backgroundremoval/archive/refs/tags/${pkgver}.tar.gz")
makedepends=("libobs-dev" "libcurl4-openssl-dev" "libssl-dev" "qt6-base-dev" "libgl1-mesa-dev" "ninja-build" "cmake" "libopencv-dev" "pkg-config")
pacdeps=("onnxruntime-bin")
breaks=("${pkgname}-git")
replaces=("${pkgname}")
arch=('amd64')
pkgdesc="OBS plugin to replace the background in portrait images and video"
sha256sums=("787f427e306abf9561f1a6686cd0e0a9228af1b429a991676d11235fd0ad98d1")
maintainer=("Zahrun <zahrunAtmurenaDotio>")

incompatible=('*:noble' '*:jammy' '*:focal' '*:bionic' '*:buster' '*:bullseye')

build() {
  cd "${pkgname}~${pkgver}"
  cmake --preset ubuntu-x86_64 -DVCPKG_TARGET_TRIPLET="" -DUSE_PKGCONFIG=ON -DUSE_SYSTEM_ONNXRUNTIME=ON -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build_x86_64 --parallel
}

package() {
  cd "${pkgname}~${pkgver}"
  cmake --install build_x86_64 --prefix "${pkgdir}"/usr
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

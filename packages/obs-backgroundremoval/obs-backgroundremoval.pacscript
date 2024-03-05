name="obs-backgroundremoval"
repology=("project: obs-backgroundremoval")
pkgver="1.1.10"
source=("https://github.com/royshil/obs-backgroundremoval/archive/refs/tags/${pkgver}.tar.gz")
makedepends=("libobs-dev" "libcurl4-openssl-dev" "libssl-dev" "qt6-base-dev" "libgl1-mesa-dev" "ninja-build" "cmake")
breaks=("${name}-git")
replaces=("${name}")
arch=('amd64')
pkgdesc="OBS plugin to replace the background in portrait images and video"
hash=("7372ba4d996322bee82de1a934ff83c085a4532ab64537959145be3535f45da3")
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

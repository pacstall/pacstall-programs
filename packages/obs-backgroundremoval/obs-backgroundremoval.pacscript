name="obs-backgroundremoval"
repology=("project: obs-backgroundremoval")
pkgver="1.1.6"
url="https://github.com/royshil/obs-backgroundremoval/archive/refs/tags/${pkgver}.tar.gz"
makedepends=("libobs-dev" "libcurl4-openssl-dev" "libssl-dev" "qt6-base-dev" "libgl1-mesa-dev" "ninja-build")
pacdeps=("cmake-deb")
breaks=("${name}-git")
replace=("${name}")
arch=('amd64')
pkgdesc="OBS plugin to replace the background in portrait images and video"
hash="9c6c0e37c0b938d1ab7112c073ab97d61fa393a79d3bd4d77fb8b61387fa2fbe"
maintainer="Zahrun <Zahrun@github.com>"

incompatible=('*:focal' '*:bionic' '*:buster' '*:bullseye')

build() {
  cmake --preset linux-x86_64 -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build_x86_64 --parallel
}

package() {
  sudo cmake --install build_x86_64 --prefix "${pkgdir}"/usr
  sudo install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${name}"
}

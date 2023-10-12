name="obs-backgroundremoval"
repology=("project: obs-backgroundremoval")
pkgver="1.1.7"
url="https://github.com/royshil/obs-backgroundremoval/archive/refs/tags/${pkgver}.tar.gz"
makedepends=("libobs-dev" "libcurl4-openssl-dev" "libssl-dev" "qt6-base-dev" "libgl1-mesa-dev" "ninja-build")
pacdeps=("cmake-deb")
breaks=("${name}-git")
replace=("${name}")
arch=('amd64')
pkgdesc="OBS plugin to replace the background in portrait images and video"
hash="13339a44ef3ddd8e343f0d22a4fa4c5ee0c8622bea34b8d1f3df1b4656ad6d25"
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

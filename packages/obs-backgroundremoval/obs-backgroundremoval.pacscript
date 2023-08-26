name="obs-backgroundremoval"
repology=("project: obs-backgroundremoval")
pkgver="1.1.3"
url="https://github.com/royshil/obs-backgroundremoval/archive/refs/tags/${pkgver}.tar.gz"
makedepends=("libobs-dev" "libcurl4-openssl-dev" "libssl-dev" "qt6-base-dev" "libsimde-dev" "ninja-build")
pacdeps=("cmake-deb")
breaks=("${name}-git")
replace=("${name}")
arch=('amd64')
pkgdesc="OBS plugin to replace the background in portrait images and video"
hash="a3bcca2ad66f86d4d0b793895f517b1b5ffc7046655ca17baf3859d7a79fc75c"
maintainer="Zahrun <Zahrun@github.com>"

incompatible=('*:jammy' '*:focal' '*:bionic' '*:buster' '*:bullseye')

build() {
  mkdir build_x86_64 && cd build_x86_64 || return 1
  cmake --preset linux-x86_64 -DCMAKE_INSTALL_PREFIX:PATH="${pkgdir}"/usr .. > /dev/null
  cmake --build . -j"${NCPU}" > /dev/null
}

package() {
  cd build_x86_64 || return 1
  sudo cmake --install . > /dev/null
  sudo mkdir -p "${pkgdir}"/usr/lib/x86_64-linux-gnu
  sudo mv "${pkgdir}"/usr/lib/obs-plugins "${pkgdir}"/usr/lib/x86_64-linux-gnu/
  sudo install -Dm644 "../LICENSE" -t "${pkgdir}/usr/share/licenses/${name}"
}

pkgname="soundux"
pkgver="0.2.7"
source=("https://github.com/Soundux/Soundux/releases/download/${pkgver}/soundux-${pkgver}.tar.gz")
makedepends=("cmake" "libx11-dev" "libxi-dev" "libwebkit2gtk-4.0-dev" "libappindicator3-1" "libappindicator3-dev" "libssl-dev" "libpulse-dev" "libpipewire-0.3-dev")
pkgdesc="A cross-platform soundboard"
sha256sums=("017003fc96f49df30575975f3904c0d8a500e325a9d2bca8c3dc69fed0cab0a7")
maintainer=("D3SOX <d3sox@protonmail.com>")
# libindicator3-dev does not exist on debian
incompatible=('debian:*')
repology=("project: soundux")

build() {
  cd "${_archive}"
  mkdir -p build
  cd build || exit 1
  cmake ..
  cmake --build . --config Release -j"${NCPU}"
}

package() {
  cd "${_archive}"
  cd build/
  make install DESTDIR="${pkgdir}"

  # install doc
  install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "../README.md"
  # install license
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "../LICENSE"
}

post_remove() {
  sudo rm -rf "/usr/share/doc/${pkgname}"
  sudo rm -rf "/usr/share/licenses/${pkgname}"
}

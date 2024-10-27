pkgname="qt6-style-kvantum"
pkgdesc="Kvantum style engine (binaries, localization and themes)"
url="https://github.com/tsujan/Kvantum"
license=("GPL-3.0-or-later")
_qt5="qt5-style-kvantum"
conflicts=("${_qt5}" "${_qt5}-themes" "${_qt5}-l10n" "${pkgname}-themes" "${pkgname}-l10n")
arch=("any")
pkgver="1.1.2"
source=("https://github.com/tsujan/Kvantum/releases/download/V${pkgver}/Kvantum-${pkgver}.tar.xz")
sha256sum=("6d3ce7f535d7d08ffe59b04dd3f04a8ab83fe35024fe34cf56995b94f40d12a2")
compatible=(
  "ubuntu:oracular"
  "debian:testing"
  "debian:sid"
  "neon:*"
)
makedepends=("cmake" "g++" "libx11-dev" "libxext-dev" "qt6-base-dev" "qt6-svg-dev" "libkf6windowsystem-dev" "qt6-base-dev-tools")
depends=("libc6" "libgcc-s1" "libkf6windowsystem6" "libqt6core6t64" "libqt6gui6" "libqt6svg6" "libqt6widgets6" "libstdc++6" "libx11-6")
maintainer=("bibelin <balian1belin@yandex.ru>")

build() {
  cd "Kvantum-${pkgver}/Kvantum"
  mkdir build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make -j"${NCPU}"
}

package() {
  cd "Kvantum-${pkgver}/Kvantum/build"
  make install DESTDIR="${pkgdir}"
}

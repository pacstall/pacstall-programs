pkgname="keepassxc"
pkgver="2.7.6"
pkgdesc="Cross-platform community-driven port of Keepass password manager"
repology=("project: keepassxc")
source=("https://github.com/keepassxreboot/keepassxc/releases/download/${pkgver}/keepassxc-${pkgver}-src.tar.xz")
sha256sums=("a58074509fa8e90f152c6247f73e75e126303081f55eedb4ea0cbb6fa980d670")
maintainer=("Oren Klopfer <oren@taumoda.com>")
gives="org.freedesktop.secrets"
breaks=("${pkgname}" "${pkgname}-bin" "${pkgname}-git" "${pkgname}-deb")

depends=("argon2" "botan" "curl" "hicolor-icon-theme" "libxtst6" "minizip" "libpcsclite1" "qrencode" "libqt5x11extras5" "libqt5svg5" "libminizip1" "libqrencode4" "qt5-qmake" "qtbase5-dev" "qtchooser" "qt5-qmake" "qtbase5-dev-tools")
makedepends=("cmake" "asciidoctor" "libqrencode-dev" "libbotan-2-dev" "libargon2-dev" "libpcsclite-dev" "libminizip-dev" "libusb-1.0-0-dev" "libreadline-dev" "libqt5x11extras5-dev" "libqt5svg5-dev" "zlib1g-dev" "libxtst-dev" "qtbase5-private-dev" "qttools5-dev" "qtbase5-dev" "qt5-qmake" "qtbase5-dev-tools" "qtdeclarative5-dev")
optdepends=("xclip: keepassxc-cli clipboard support under X server"
  "wl-clipboard: keepassxc-cli clipboard support under Wayland")

build() {
  cd "${_archive}"
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DWITH_XC_ALL=ON \
    -DWITH_XC_UPDATECHECK=OFF
  cmake --build build --parallel "${NCPU}"
}

package() {
  cd "${_archive}"
  cmake --build build --target install -- DESTDIR="${pkgdir}"
}

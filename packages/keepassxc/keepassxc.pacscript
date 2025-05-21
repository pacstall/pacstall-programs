pkgname="keepassxc"
arch=("any")
pkgver="2.7.10"
pkgdesc="Cross-platform community-driven port of Keepass password manager"
repology=("project: keepassxc")
source=("@${pkgname}~${pkgver}::https://github.com/keepassxreboot/keepassxc/releases/download/${pkgver}/keepassxc-${pkgver}-src.tar.xz")
sha256sums=("5ce76d6440986c24842585f019d5f3cadc166fa71fc911a4fe97b8bbc4819dfa")
maintainer=("Oren Klopfer <oren@taumoda.com>" "Medaey <medaey@github.com>")
gives="org.freedesktop.secrets"
breaks=("${pkgname}" "${pkgname}-bin" "${pkgname}-git" "${pkgname}-deb")

depends=("argon2" "botan" "curl" "hicolor-icon-theme" "libxtst6" "minizip" "libpcsclite1" "qrencode" "libqt5x11extras5" "libqt5svg5" "libminizip1" "libqrencode4" "qt5-qmake" "qtbase5-dev" "qtchooser" "qt5-qmake" "qtbase5-dev-tools")
makedepends=("cmake" "asciidoctor" "libqrencode-dev" "libbotan-2-dev" "libargon2-dev" "libpcsclite-dev" "libminizip-dev" "libusb-1.0-0-dev" "libreadline-dev" "libqt5x11extras5-dev" "libqt5svg5-dev" "zlib1g-dev" "libxtst-dev" "qtbase5-private-dev" "qttools5-dev" "qtbase5-dev" "qt5-qmake" "qtbase5-dev-tools" "qtdeclarative5-dev")
optdepends=("xclip: keepassxc-cli clipboard support under X server"
  "wl-clipboard: keepassxc-cli clipboard support under Wayland")

build() {
  cd "${pkgname}~${pkgver}"
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DWITH_XC_ALL=ON \
    -DWITH_XC_UPDATECHECK=OFF
  cmake --build build --parallel "${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  cmake --build build --target install -- DESTDIR="${pkgdir}"
}

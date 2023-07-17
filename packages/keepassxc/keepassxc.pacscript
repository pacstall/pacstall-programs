name="keepassxc"
version="2.7.5"
description="Cross-platform community-driven port of Keepass password manager"
repology=("project: keepassxc")
url="https://github.com/keepassxreboot/keepassxc/releases/download/${version}/keepassxc-${version}-src.tar.xz"
hash="ede24800901816c49569aa4f8bc7180a40cb8b554617fa2a2a2653caac13000c"
maintainer="Marie Piontek <marie@kaifa.ch>"
gives="org.freedesktop.secrets"
breaks=("${name}" "${name}-bin" "${name}-git" "${name}-deb")

depends=("argon2" "botan" "curl" "hicolor-icon-theme" "libxtst6" "minizip" "libpcsclite1" "qrencode" "libqt5x11extras5" "libqt5svg5" "libminizip1" "libqrencode4" "qt5-qmake" "qtbase5-dev" "qtchooser" "qt5-qmake" "qtbase5-dev-tools")
build_depends=("cmake" "asciidoctor" "libqrencode-dev" "libbotan-2-dev" "libargon2-dev" "libpcsclite-dev" "libminizip-dev" "libusb-1.0-0-dev" "libreadline-dev" "libqt5x11extras5-dev" "libqt5svg5-dev" "zlib1g-dev" "libxtst-dev" "qtbase5-private-dev" "qttools5-dev" "qtbase5-dev" "qt5-qmake" "qtbase5-dev-tools" "qtdeclarative5-dev")
optdepends=("xclip: keepassxc-cli clipboard support under X server"
  "wl-clipboard: keepassxc-cli clipboard support under Wayland")

build() {
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DWITH_XC_ALL=ON \
    -DWITH_XC_UPDATECHECK=OFF
  cmake --build build
}

package() {
  sudo cmake --build build --target install -- DESTDIR="${pkgdir}"
}

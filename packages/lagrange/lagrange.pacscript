pkgname="lagrange"
arch=("any")
pkgver="1.18.5"
license=("BSD-2-Clause")
source=("@${pkgname}~${pkgver}::https://git.skyjake.fi/gemini/lagrange/releases/download/v1.18.5/lagrange-1.18.5.tar.gz")
makedepends=("git" "cmake" "libsdl2-dev" "libssl-dev" "libpcre3-dev" "zlib1g-dev" "libunistring-dev" "libmpg123-dev")
pkgdesc="A Beautiful Gemini Client"
sha256sums=("1dded64803eef8ff162e79025fd6db60f4a19bac5f9b804f46d79e07cbda5c65")

prepare() {
  cd "${pkgname}~${pkgver}"
  mkdir build
}

build() {
  cd "${pkgname}~${pkgver}"
  cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" -DENABLE_123=ON
}

package() {
  cd "${pkgname}~${pkgver}"
  cmake --build . --target install -- -j "${NCPU}"
}

post_install() {
  sudo glib-compile-schemas /usr/share/glib-2.0/schemas
  sudo update-desktop-database -q /usr/share/applications
  sudo gtk-update-icon-cache -qtf /usr/share/icons/hicolor
}

post_remove() {
  sudo update-desktop-database -q /usr/share/applications
}

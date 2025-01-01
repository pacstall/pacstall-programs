pkgname="lagrange"
arch=("any")
pkgver="1.3.4"
license="BSD-2"
source=("@${pkgname}~${pkgver}::https://git.skyjake.fi/gemini/lagrange/releases/download/v1.3.4/lagrange-1.3.4.tar.gz")
depends=("git" "cmake" "libsdl2-dev" "libssl-dev" "libpcre3-dev" "zlib1g-dev" "libunistring-dev" "libmpg123-dev")
pkgdesc="A Beautiful Gemini Client"
sha256sums=("0602bf65d79a1495818ab64717951d1c99057ed20e8c7bb621c8d5b693420b81")

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

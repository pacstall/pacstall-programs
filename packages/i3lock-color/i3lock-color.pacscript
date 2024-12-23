pkgname="i3lock-color"
arch=("any")
pkgver="2.13.c.5"
source=("@${pkgname}~${pkgver}::https://github.com/Raymo111/i3lock-color/archive/refs/tags/${pkgver}.tar.gz")
makedepends=("autoconf" "gcc" "pkg-config" "libpam0g-dev" "libcairo2-dev" "libfontconfig1-dev" "libxcb-composite0-dev" "libev-dev" "libx11-xcb-dev" "libxcb-xkb-dev" "libxcb-xinerama0-dev" "libxcb-randr0-dev" "libxcb-image0-dev" "libxcb-util0-dev" "libxcb-xrm-dev" "libxkbcommon-dev" "libxkbcommon-x11-dev" "libjpeg-dev")
depends=("libxcb-composite0-dev" "libpam0g-dev" "libev-dev" "libcairo2-dev" "libxkbcommon-x11-dev" "libjpeg-dev" "libxcb-xrm-dev" "pkg-config")
gives="i3lock"
breaks=("i3lock")
replaces=("i3lock")
pkgdesc="The world's most popular non-default computer lockscreen."
sha256sums=("46f15cbbf339873266e014f70b5e1ec02177f0295302b615a7bd85bef40d8ad2")
maintainer=("Harshwardhan Mehrotra <abrakadabra18262@protonmail.com>")

build() {
  cd "${pkgname}~${pkgver}"
  ./build.sh
}

package() {
  cd "${pkgname}~${pkgver}"
  cd build
  make install DESTDIR="${pkgdir}"

}

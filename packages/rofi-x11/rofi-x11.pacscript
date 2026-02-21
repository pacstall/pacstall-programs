pkgname="rofi-x11"
gives="rofi"
pkgver="2.0.0"
arch=("any")
url='https://github.com/davatorium/rofi'
license=("MIT")
pkgdesc="Window switcher, application launcher, and dmenu replacement for x11"
depends=(
  "libcairo2"
  "libgdk-pixbuf-2.0-0"
  "libglib2.0-0>=2.72"
  "libpango-1.0-0>=1.50"
  "libpangocairo-1.0-0"
  "libstartup-notification0>=0.11"
  "libxcb-cursor0"
  "libxcb-ewmh2"
  "libxcb-icccm4"
  "libxcb-randr0"
  "libxcb-util1"
  "libxcb-xinerama0"
  "libxcb-xkb1"
  "libxcb1"
  "libxkbcommon-x11-0"
  "libxkbcommon0>=0.4.1"
)
makedepends=(
  "gcc"
  "meson"
  "bison"
  "flex>=2.5.39"
  "libcairo2-dev"
  "libgdk-pixbuf-2.0-dev"
  "libglib2.0-dev"
  "libpango1.0-dev"
  "libstartup-notification0-dev"
  "libxcb-cursor-dev"
  "libxcb-ewmh-dev"
  "libxcb-icccm4-dev"
  "libxcb-keysyms1-dev"
  "libxcb-randr0-dev"
  "libxcb-util-dev"
  "libxcb-xinerama0-dev"
  "libxcb-xkb-dev"
  "libxcb1-dev"
  "libxkbcommon-dev"
  "libxkbcommon-x11-dev"
  "pkg-config"
)
replaces=("${gives}" "${gives}-wayland")
conflicts=("rofi-dev")
source=("https://github.com/davatorium/rofi/releases/download/${pkgver}/${gives}-${pkgver}.tar.gz")
maintainer=("Don Alfons <donnisnoni@outlook.com>" "aKqir24 <aKqir24@github.com>")

prepare() {
  cd "${gives}-${pkgver}"
  meson setup build/ --buildtype=release --prefix=/usr -Dwayland=disabled
}

build() {
  cd "${gives}-${pkgver}"
  ninja -C build/ -j"${NCPU}"
}

package() {
  cd "${gives}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build/ install
}

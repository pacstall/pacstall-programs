pkgname="rofi"
pkgver="2.0.0"
arch=("any")
url='https://github.com/davatorium/rofi'
license=("MIT")
pkgdesc="A window switcher, application launcher, and dmenu replacement for wayland and x11."
depends=(
  "libglib2.0-0"
  "libpango-1.0-0"
  "libpangocairo-1.0-0"
  "libcairo2"
  "libgdk-pixbuf-2.0-0"
  "libxkbcommon0"
  "libwayland-client0"
  "libwayland-cursor0"
  "libwayland-egl1"
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
  "ninja-build"
  "pkg-config"
  "flex>=2.5.39"
  "bison"
  "libwayland-dev"
  "libglib2.0-dev"
  "libpango1.0-dev"
  "libcairo2-dev"
  "libgdk-pixbuf-2.0-dev"
  "libxkbcommon-dev"
  "wayland-protocols"
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
  "libxkbcommon-x11-dev"
  "pkg-config"
)
source=("https://github.com/davatorium/rofi/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("f81659b175306ff487e35d88d6b36128e85a793bfb56b64fa22c62eb54c4abd0")
maintainer=("Don Alfons <donnisnoni@outlook.com>" "aKqir24 <aKqir24@github.com>")

prepare() {
  cd "${pkgname}-${pkgver}"
  meson setup build/ --buildtype=release --prefix=/usr
}

build() {
  cd "${pkgname}-${pkgver}"
  ninja -C build/ -j"${NCPU}"
}

package() {
  cd "${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build/ install
}

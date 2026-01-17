pkgname="rofi-wayland"
gives="rofi"
pkgver="2.0.0"
arch=("any")
url='https://github.com/davatorium/rofi'
license=("MIT")
pkgdesc="Window switcher, application launcher, and dmenu replacement for wayland"
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
)
makedepends=(
  "gcc"
  "meson"
  "ninja-build"
  "pkg-config"
  "flex>=2.5.39"
  "bison"
  "check"
  "libwayland-dev"
  "libglib2.0-dev"
  "libpango1.0-dev"
  "libcairo2-dev"
  "libgdk-pixbuf-2.0-dev"
  "libxkbcommon-dev"
  "wayland-protocols"
)
replaces=("${gives}" "${gives}-x11")
conflicts=("rofi-dev")
source=("https://github.com/davatorium/rofi/releases/download/${pkgver}/${gives}-${pkgver}.tar.gz")
maintainer=("aKqir24 <aKqir24@github.com>")

prepare() {
  cd "${gives}-${pkgver}"
  meson setup build/ --buildtype=release --prefix=/usr -Dxcb=disabled
}

build() {
  cd "${gives}-${pkgver}"
  ninja -C build/ -j"${NCPU}"
}

package() {
  cd "${gives}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build/ install
}

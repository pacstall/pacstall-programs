pkgname="wlrobs"
repology=("project: ${pkgname}")
pkgver="1.2"
arch=('any')
makedepends=(
  "libwayland-dev"
  "libobs-dev"
  "pkg-config"
  "meson"
  "libwlroots-0.18"
  "ninja-build")
source=("https://hg.sr.ht/~scoopta/wlrobs/archive/v${pkgver}.tar.gz")
conflicts=("${pkgname}")
depends=("obs-studio")
pkgdesc="Obs-studio plugin that allows you to screen capture on wlroots based wayland compositors"
maintainer=("akqir24 <aKqir24@github.com>")

prepare() {
  cd "${pkgname}-v${pkgver}"
  export CFLAGS="-Wno-error"
  meson setup build -Dwerror=false
}

build() {
  cd "${pkgname}-v${pkgver}"
  ninja -C build/ -j"${NCPU}"
}

package() {
  cd "${pkgname}-v${pkgver}"
  mkdir -p "${pkgdir}"/usr/lib/obs-plugins
  install -D -m 0644 build/libwlrobs.so "${pkgdir}"/usr/lib/obs-plugins/wlrobs.so
}

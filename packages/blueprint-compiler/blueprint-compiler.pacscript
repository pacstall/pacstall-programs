pkgname="blueprint-compiler"
arch=("any")
pkgver="0.16.0"
pkgdesc='A markup language for GTK user interfaces'
url='https://jwestman.pages.gitlab.gnome.org/blueprint-compiler/'
license=("LGPL-3.0-or-later")
depends=("python3-gi")
makedepends=("meson")
source=("https://gitlab.gnome.org/jwestman/blueprint-compiler/-/archive/v${pkgver}/blueprint-compiler-v${pkgver}.tar.gz")
sha256sums=('a4950c16feab4b70ef852ec24b4645b41e01edfd3265bea56b95e340281bbd18')
maintainer=("Oren Klopfer <oren@taumoda.com>")

build() {
  meson "${pkgname}-v${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}

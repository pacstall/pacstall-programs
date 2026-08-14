pkgname="blueprint-compiler"
arch=("any")
pkgver="0.20.4"
pkgdesc='Markup language for GTK user interfaces'
url='https://jwestman.pages.gitlab.gnome.org/blueprint-compiler/'
license=("LGPL-3.0-or-later")
depends=("python3-gi")
makedepends=("meson")
source=("https://gitlab.gnome.org/jwestman/blueprint-compiler/-/archive/v${pkgver}/blueprint-compiler-v${pkgver}.tar.gz")
sha256sums=('6f0f72fbce0919045047f30b56590e71cd82c66b890c37fe765a40494fd34feb')
repology=("project: ${pkgname}")
maintainer=("Oren Klopfer <oren@taumoda.com>")

build() {
  meson "${pkgname}-v${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}

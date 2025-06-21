pkgname="blueprint-compiler"
arch=("any")
pkgver="0.16.0"
pkgdesc='A markup language for GTK user interfaces'
url='https://jwestman.pages.gitlab.gnome.org/blueprint-compiler/'
license=("LGPL-3.0-or-later")
depends=("python3-gi")
makedepends=("meson")
source=("https://gitlab.gnome.org/jwestman/blueprint-compiler/-/archive/v${pkgver}/blueprint-compiler-v${pkgver}.tar.gz")
sha256sums=('01feb8263fe7a450b0a9fed0fd54cf88947aaf00f86cc7da345f8b39a0e7bd30')
maintainer=("Oren Klopfer <oren@taumoda.com>")

build() {
  meson "${pkgname}-v${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}

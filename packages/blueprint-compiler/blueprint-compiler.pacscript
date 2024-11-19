pkgname="blueprint-compiler"
arch=("any")
pkgver="0.12.0"
pkgdesc='A markup language for GTK user interfaces'
url='https://jwestman.pages.gitlab.gnome.org/blueprint-compiler/'
license=("LGPL-3.0-or-later")
depends=("python3-gi")
makedepends=("meson")
source=("https://gitlab.gnome.org/jwestman/blueprint-compiler/-/archive/v${pkgver}/blueprint-compiler-v${pkgver}.tar.gz")
sha256sums=('6dbb4ea851cec164030abded5949ea77ff92032e23527e1c0597d7efe0c36a81')
maintainer=("Oren Klopfer <oren@taumoda.com>")

build() {
  meson "${pkgname}-v${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}

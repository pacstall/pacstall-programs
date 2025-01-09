pkgname="paper-icon-theme"
arch=("all")
pkgver="1.5.0"
maintainer=("aranym <aranym1@pm.me>")
source=("@${pkgname}~${pkgver}::https://github.com/snwh/paper-icon-theme/archive/refs/tags/v.1.5.0.tar.gz")
makedepends=("meson" "ninja-build")
pkgdesc="Paper is an open source desktop theme and icon project by Sam Hewitt"
sha256sums=("62f21dfe95ece481e5c635480f32347f1ad27ea66b2ef0526fe799090b298ece")

build() {
  cd "${pkgname}~${pkgver}"
  meson "build" --prefix="${pkgdir}/usr"
}

package() {
  cd "${pkgname}~${pkgver}"
  ninja -C "build" install > /dev/null
}

pkgname="nofetch"
arch=("all")
pkgver="1.0"
source=("@${pkgname}~${pkgver}::https://github.com/jnats/nofetch/archive/refs/tags/v${pkgver}.zip")
pkgdesc="The simple man's fetch tool"
breaks=("foo")
sha256sums=("92e1d4b047b2f5c5ba99d2afa922a65004321cd7930027183ee8c57d393cbb78")

package() {
  cd "${pkgname}~${pkgver}"
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x nofetch
  mv nofetch "${pkgdir}/usr/bin"
}

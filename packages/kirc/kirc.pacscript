pkgname="kirc"
repology=("project: ${pkgname}")
arch=("any")
pkgver="0.3.3"
source=("@${pkgname}~${pkgver}::https://github.com/mcpcpc/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
makedepends=("automake")
breaks=("${pkgname}-git")
replaces=("${pkgname}")
pkgdesc="A tiny IRC client written in POSIX C99"
sha256sums=("c76e545efc400486401f387ef266260d4508f9b6265df7f61c0d5b002fec164b")
maintainer=("WRM-42 <y8bsbahy@anonaddy.me>")

build() {
  cd "${pkgname}~${pkgver}"
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  make install DESTDIR="${pkgdir}"
}

pkgname="kirc"
repology=("project: ${pkgname}")
arch=("any")
pkgver="0.3.2"
source=("@${pkgname}~${pkgver}::https://github.com/mcpcpc/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
makedepends=("automake")
breaks=("${pkgname}-git")
replaces=("${pkgname}")
pkgdesc="A tiny IRC client written in POSIX C99"
sha256sums=("a45172198873fb34c64150262be4515a7be268a5c00566c79f03a8ea2dd7900e")
maintainer=("WRM-42 <y8bsbahy@anonaddy.me>")

build() {
  cd "${pkgname}~${pkgver}"
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  make install DESTDIR="${pkgdir}"
}

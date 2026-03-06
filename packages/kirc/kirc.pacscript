pkgname="kirc"
repology=("project: ${pkgname}")
arch=("any")
pkgver="1.2.2"
source=("@${pkgname}~${pkgver}::https://github.com/mcpcpc/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
makedepends=("automake")
breaks=("${pkgname}-git")
replaces=("${pkgname}")
pkgdesc="A tiny IRC client written in POSIX C99"
sha256sums=("a54bc4d1a644f6fcb610f702454affc241b26da7fbde51951e0ec59133fa7b1d")
maintainer=("WRM-42 <y8bsbahy@anonaddy.me>")

build() {
  cd "${pkgname}~${pkgver}"
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  make install DESTDIR="${pkgdir}"
}

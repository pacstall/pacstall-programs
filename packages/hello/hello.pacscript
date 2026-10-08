pkgname="hello"
repology=("project: ${pkgname}")
arch=("all")
pkgver="2.12.3"
source=("@${pkgname}~${pkgver}::https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz")
makedepends=("build-essential")
depends=("libc6")
breaks=("${pkgname}-git" "${pkgname}-traditional")
replaces=("${pkgname}")
pkgdesc="GNU implementation of the classic program that prints 'Hello, world!' when you run it"
sha256sums=("0d5f60154382fee10b114a1c34e785d8b1f492073ae2d3a6f7b147687b366aa0")
maintainer=("WRM-42 <y8bsbahy@anonaddy.me>")

build() {
  cd "${pkgname}~${pkgver}"
  ./configure
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  make install DESTDIR="${pkgdir}"
}

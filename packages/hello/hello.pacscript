pkgname="hello"
repology=("project: ${pkgname}")
arch=("all")
pkgver="2.12.1"
source=("@${pkgname}~${pkgver}::https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz")
makedepends=("build-essential")
depends=("libc6")
breaks=("${pkgname}-git" "${pkgname}-traditional")
replaces=("${pkgname}")
pkgdesc="GNU implementation of the classic program that prints 'Hello, world!' when you run it"
sha256sums=("8d99142afd92576f30b0cd7cb42a8dc6809998bc5d607d88761f512e26c7db20")
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

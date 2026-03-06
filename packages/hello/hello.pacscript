pkgname="hello"
repology=("project: ${pkgname}")
arch=("all")
pkgver="2.12.2"
source=("@${pkgname}~${pkgver}::https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz")
makedepends=("build-essential")
depends=("libc6")
breaks=("${pkgname}-git" "${pkgname}-traditional")
replaces=("${pkgname}")
pkgdesc="GNU implementation of the classic program that prints 'Hello, world!' when you run it"
sha256sums=("5a9a996dc292cc24dcf411cee87e92f6aae5b8d13bd9c6819b4c7a9dce0818ab")
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

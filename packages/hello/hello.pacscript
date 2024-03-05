name="hello"
repology=("project: ${name}")
pkgver="2.12.1"
source=("https://ftp.gnu.org/gnu/${name}/${name}-${pkgver}.tar.gz")
makedepends=("build-essential")
depends=("libc6")
breaks=("${name}-git" "${name}-traditional")
replaces=("${name}")
pkgdesc="GNU implementation of the classic program that prints 'Hello, world!' when you run it"
hash=("8d99142afd92576f30b0cd7cb42a8dc6809998bc5d607d88761f512e26c7db20")
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

build() {
  ./configure
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}

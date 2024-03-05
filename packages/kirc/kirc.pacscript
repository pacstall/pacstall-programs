name="kirc"
repology=("project: ${name}")
pkgver="0.3.2"
source=("https://github.com/mcpcpc/${name}/archive/refs/tags/${pkgver}.tar.gz")
makedepends=("automake")
breaks=("${name}-git")
replaces=("${name}")
pkgdesc="A tiny IRC client written in POSIX C99"
hash=("a45172198873fb34c64150262be4515a7be268a5c00566c79f03a8ea2dd7900e")
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

build() {
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}

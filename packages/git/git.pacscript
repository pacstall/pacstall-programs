pkgname="git"
replaces=("${pkgname}")
repology=("project: git")
breaks=("${pkgname}-${pkgname}")
arch=("any")
pkgver="2.47.0"
source=("https://www.kernel.org/pub/software/scm/${pkgname}/${pkgname}-${pkgver}.tar.gz")
makedepends=("dh-autoreconf" "cmake" "gcc" "libcurl4-gnutls-dev" "libexpat1-dev" "gettext" "libz-dev" "libssl-dev" "asciidoc" "xmlto" "docbook2x" "install-info" "zlib1g-dev" "zlib1g")
pkgdesc="git is a fast, scalable, distributed revision control system with an unusually rich command set that provides both high-level operations and full access to internals"
sha256sums=("a84a7917e0ab608312834413f01fc01edc7844f9f9002ba69f3b4f4bcb8d937a")
maintainer=("Oren Klopfer <oren@taumoda.com>")

prepare() {
  cd "${_archive}"
  make configure
}

build() {
  cd "${_archive}"
  ./configure
  make -j"${NCPU}"
}

package() {
  cd "${_archive}"
  make install DESTDIR="${pkgdir}"
}

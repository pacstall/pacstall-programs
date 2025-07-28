pkgname="git"
replaces=("${pkgname}")
repology=("project: git")
breaks=("${pkgname}-${pkgname}")
arch=("any")
pkgver="2.50.1"
source=("@${pkgname}~${pkgver}::https://www.kernel.org/pub/software/scm/${pkgname}/${pkgname}-${pkgver}.tar.gz")
makedepends=("dh-autoreconf" "cmake" "gcc" "libcurl4-gnutls-dev" "libexpat1-dev" "gettext" "libz-dev" "libssl-dev" "asciidoc" "xmlto" "docbook2x" "install-info" "zlib1g-dev" "zlib1g")
pkgdesc="git is a fast, scalable, distributed revision control system with an unusually rich command set that provides both high-level operations and full access to internals"
sha256sums=("522d1635f8b62b484b0ce24993818aad3cab8e11ebb57e196bda38a3140ea915")
maintainer=("Oren Klopfer <oren@taumoda.com>")

prepare() {
  cd "${pkgname}~${pkgver}"
  make configure
}

build() {
  cd "${pkgname}~${pkgver}"
  ./configure
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  make install DESTDIR="${pkgdir}"
}

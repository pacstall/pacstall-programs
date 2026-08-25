pkgname="git"
replaces=("${pkgname}")
repology=("project: git")
breaks=("${pkgname}-${pkgname}")
arch=("any")
pkgver="2.55.0"
source=("@${pkgname}~${pkgver}::https://www.kernel.org/pub/software/scm/${pkgname}/${pkgname}-${pkgver}.tar.gz")
makedepends=("dh-autoreconf" "cmake" "gcc" "libcurl4-gnutls-dev" "libexpat1-dev" "gettext" "libz-dev" "libssl-dev" "asciidoc" "xmlto" "docbook2x" "install-info" "zlib1g-dev" "zlib1g" "cargo")
pkgdesc="git is a fast, scalable, distributed revision control system with an unusually rich command set that provides both high-level operations and full access to internals"
sha256sums=("0842dc384a23ac33ba3e570c4f3a8ded85963ee4713b1cd21153c3db41813d1e")
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

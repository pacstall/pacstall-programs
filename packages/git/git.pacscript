name="git"
replace=("${name}")
repology=("project: git")
breaks=("${name}-${name}")
pkgver="2.43.0"
url="https://www.kernel.org/pub/software/scm/${name}/${name}-${pkgver}.tar.gz"
makedepends=("dh-autoreconf" "cmake" "gcc" "libcurl4-gnutls-dev" "libexpat1-dev" "gettext" "libz-dev" "libssl-dev" "asciidoc" "xmlto" "docbook2x" "install-info" "zlib1g-dev" "zlib1g")
pkgdesc="git is a fast, scalable, distributed revision control system with an unusually rich command set that provides both high-level operations and full access to internals"
hash="ed238f5c72a014f238cc49fe7df4c6883732a3881111b381c105e2c5be77302f"
maintainer="Oren Klopfer <oren@taumoda.com>"

prepare() {
  make configure
}

build() {
  ./configure
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}

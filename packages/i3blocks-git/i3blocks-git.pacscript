pkgname="i3blocks-git"
gives="i3blocks"
pkgdesc="A feed generator for text based status bars"
source=("https://github.com/vivien/${gives}.git")
pkgver="1.5"
makedepends=("autoconf" "gcc" "make" "pkgconf")
breaks=("${gives}")
maintainer=("Lanius <laniusone@pm.me>")

prepare() {
  cd "${_archive}"
  ./autogen.sh && ./configure
}

build() {
  cd "${_archive}"
  make -j"${NCPU}"
}

package() {
  cd "${_archive}"
  # Install i3blocks
  make install DESTDIR="${pkgdir}"
}

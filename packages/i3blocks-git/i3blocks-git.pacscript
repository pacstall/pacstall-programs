pkgname="i3blocks-git"
gives="i3blocks"
pkgdesc="A feed generator for text based status bars"
source=("https://github.com/vivien/${gives}.git")
arch=("any")
pkgver="1.5"
makedepends=("autoconf" "gcc" "make" "pkgconf")
breaks=("${gives}")
maintainer=("Lanius <laniusone@pm.me>")

prepare() {
  cd "i3blocks"
  ./autogen.sh && ./configure
}

build() {
  cd "i3blocks"
  make -j"${NCPU}"
}

package() {
  cd "i3blocks"
  # Install i3blocks
  make install DESTDIR="${pkgdir}"
}

name="i3blocks-git"
pkgname="i3blocks"
pkgdesc="A feed generator for text based status bars"
source=("https://github.com/vivien/${pkgname}.git")
pkgver="1.5"
makedepends=("autoconf" "gcc" "make" "pkgconf")
breaks=("${pkgname}")
maintainer="Lanius <laniusone@pm.me>"

prepare() {
  ./autogen.sh && ./configure
}

build() {
  make -j"${NCPU}"
}

package() {
  # Install i3blocks
  sudo make install DESTDIR="${pkgdir}"
}

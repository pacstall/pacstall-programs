name="i3blocks-git"
pkgname="i3blocks"
pkgdir="${STOWDIR}/${name}"
description="A feed generator for text based status bars"
url="https://github.com/vivien/${pkgname}.git"
depends="autoconf gcc make pkgconf"
breaks="${pkgname}"
maintainer="Lanius <laniusone@pm.me>"

pkgver() {
    git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

prepare() {
  ./autogen.sh && ./configure
}

build() {
  make -j"$(nproc)"
}

install() {
  # Install i3blocks
  sudo make install DESTDIR=$pkgdir
}

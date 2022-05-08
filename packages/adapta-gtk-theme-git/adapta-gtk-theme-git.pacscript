name="adapta-gtk-theme-git"
gives="adapta-gtk-theme"
breaks="adapta"
url="https://github.com/adapta-project/${gives}.git"
build_depends="parallel autoconf automake inkscape libgdk-pixbuf2.0-dev libglib2.0-dev libxml2-utils pkg-config sassc"
description="An adaptive Gtk+ theme based on Material Design Guidelines"
maintainer="TwilightBlood <hwengerstickel@pm.me>"

pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

prepare() {
  ./autogen.sh --prefix=/usr --enable-parallel
}

build() {
  make -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="/usr/src/pacstall/${gives}"
}

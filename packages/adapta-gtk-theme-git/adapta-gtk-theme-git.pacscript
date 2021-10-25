name="adapta-gtk-theme-git"
gives="adapta-gtk-theme"
version="1.0"
url="https://github.com/adapta-project/adapta-gtk-theme.git"
license="CC-BY-SA"
build_depends="parallel autoconf automake inkscape libgdk-pixbuf2.0-dev libglib2.0-dev libxml2-utils pkg-config sassc"
gives="adapta-gtk-theme"
breaks="adapta"
description="An adaptive Gtk+ theme based on Material Design Guidelines"
maintainer="TwilightBlood <hwengerstickel@pm.me>"

prepare() {
          ./autogen.sh --prefix=/usr --enable-parallel
}

build() {
        make -j$(nproc)
}

install() {
          sudo make install DESTDIR=/usr/src/pacstall/adapta-gtk-theme
}

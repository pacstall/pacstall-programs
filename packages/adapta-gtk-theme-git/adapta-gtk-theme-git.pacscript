name="adapta-gtk-theme-git"
gives="adapta-gtk-theme"
breaks=("adapta")
source=("https://github.com/adapta-project/${gives}.git")
pkgver="3.95.0.11"
makedepends=("parallel" "autoconf" "automake" "inkscape" "libgdk-pixbuf2.0-dev" "libglib2.0-dev" "libxml2-utils" "pkg-config" "sassc")
pkgdesc="An adaptive Gtk+ theme based on Material Design Guidelines (Legacy)"
maintainer="Elsie19 <elsie19@pm.me>"

prepare() {
  ./autogen.sh --prefix=/usr --enable-parallel
}

build() {
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}

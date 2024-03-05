name="fsearch-git"
gives="fsearch"
pkgdesc="FSearch is a fast file search utility, inspired by Everything Search Engine. It's written in C and based on GTK3."
source=("https://github.com/cboxdoerfer/${gives}.git")
pkgver="0.2.2"
makedepends=("git" "build-essential" "automake" "autopoint" "autoconf" "libtool" "pkg-config" "intltool" "autoconf-archive" "libicu-dev" "libpcre3-dev" "libglib2.0-dev" "libgtk-3-dev" "libxml2-utils")

prepare() {
  ./autogen.sh
}

build() {
  ./configure
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}

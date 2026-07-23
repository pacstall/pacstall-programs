pkgname="fsearch-git"
gives="fsearch"
pkgdesc="FSearch is a fast file search utility, inspired by Everything Search Engine. It's written in C and based on GTK3."
source=("https://github.com/cboxdoerfer/${gives}.git")
arch=("any")
pkgver="0.3.1"
makedepends=("git" "build-essential" "meson" "ninja-build" "pkg-config" "gettext" "itstool" "libicu-dev" "libpcre2-dev" "libglib2.0-dev" "libgtk-3-dev")

build() {
  cd "fsearch"
  meson setup build --prefix=/usr
  meson compile -C build
}

package() {
  cd "fsearch"
  DESTDIR="${pkgdir}" meson install -C build
}

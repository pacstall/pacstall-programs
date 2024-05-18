pkgname="apx-git"
gives="apx"
source=("https://github.com/Vanilla-OS/apx.git")
pkgver="2.4.0"
makedepends=("golang-go")
pacdeps=("distrobox")
breaks=("${gives}")
pkgdesc="Package manager meant to be simple to use, but also powerful with support to installing packages from multiple sources without altering the root filesystem"
maintainer=("Zahrun <Zahrun@github.com>")
incompatible=("debian:bullseye")

prepare() {
  cd "${_archive}"
  sed -i "s;/usr/share/apx/distrobox/distrobox;/usr/bin/distrobox;" config/apx.json
  sed -i "/distrobox/d" Makefile
  sed -i "s|install: build|install:|" Makefile
}

build() {
  cd "${_archive}"
  make build
}

package() {
  cd "${_archive}"
  make install{,-manpages} DESTDIR="${pkgdir}"
}

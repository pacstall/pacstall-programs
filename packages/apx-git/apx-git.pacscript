name="apx-git"
pkgname="apx"
url="https://github.com/Vanilla-OS/apx.git"
pkgver="2.4.0"
makedepends=("golang-go")
pacdeps=("distrobox")
breaks=("${pkgname}")
pkgdesc="Package manager meant to be simple to use, but also powerful with support to installing packages from multiple sources without altering the root filesystem"
maintainer="Zahrun <Zahrun@github.com>"
pkgver() {
  git ls-remote "${url}" main | cut -f1 | cut -c1-8
}
incompatible=("debian:bullseye")

prepare() {
  sed -i "s;/usr/share/apx/distrobox;/usr/bin/distrobox;" config/apx.json
  sed -i "/distrobox/d" Makefile
}

build() {
  make build
}

package() {
  sudo make install{,-manpages} DESTDIR="${pkgdir}"
}

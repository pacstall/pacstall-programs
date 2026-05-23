pkgname="apx-git"
gives="apx"
source=("https://github.com/Vanilla-OS/apx.git")
arch=("any")
pkgver="2.4.3"
makedepends=("golang-1.22-go")
pacdeps=("distrobox")
breaks=("${gives}")
pkgdesc="Package manager meant to be simple to use, but also powerful with support to installing packages from multiple sources without altering the root filesystem"
maintainer=("Zahrun <zahrunAtmurenaDotio>")
external_connection=true
incompatible=('*:bullseye' '*:bookworm')

prepare() {
  cd "apx"
  sed -i "s;/usr/share/apx/distrobox/distrobox;/usr/bin/distrobox;" config/apx.json
  sed -i "/distrobox/d" Makefile
  sed -i "s|install: build|install:|" Makefile

}

build() {
  cd "apx"
  export PATH=/usr/lib/go-1.22/bin:${PATH}
  make build
}

package() {
  cd "apx"
  make install{,-manpages} DESTDIR="${pkgdir}"
}

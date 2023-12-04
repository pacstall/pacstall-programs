name="apx-git"
gives="apx"
url="https://github.com/Vanilla-OS/apx.git"
pkgver="2.0.0"
makedepends=("golang-go")
pacdeps=("distrobox")
breaks=("${gives}")
pkgdesc="Package manager meant to be simple to use, but also powerful with support to installing packages from multiple sources without altering the root filesystem"
maintainer="Zahrun <Zahrun@github.com>"
pkgver() {
  git ls-remote "${url}" v2 | cut -f1 | cut -c1-8
}
incompatible=("debian:bullseye")

prepare() {
  sed -i "s;/usr/share/apx/distrobox;/usr/bin/distrobox;" config/apx.json
}

build() {
  go build
}

package() {
  sudo install -Dm755 "apx" "${pkgdir}/usr/bin/apx"
  sudo install -Dm644 "config/config.json" -t "${pkgdir}/etc/apx/"
  sudo install -Dm644 "man/apx.1" -t "${pkgdir}/usr/share/man/man1"
  sudo install -Dm644 "man/es/apx.1" -t "${pkgdir}/usr/share/man/es/man1"
  sudo install -Dm644 "COPYING.md" -t "${pkgdir}/usr/share/licenses/${name}"
}

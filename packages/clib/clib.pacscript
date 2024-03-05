#!/usr/bin/bash
# shellcheck disable=2034,2032,2033
#-*- mode: sh-*-
name="clib"
pkgver="2.8.3"
pkgdesc="C package manager-ish"
source=("https://github.com/clibs/${name}/archive/refs/tags/${pkgver}.tar.gz")
makedepends=("gcc" "libcurl4-gnutls-dev")
hash=("0ad8262d13ef138a12452e67e081e3eb31a264e2040cfce09417e8f7eed4e1f5")
repology=("project: ${name}")

build() {
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}" PREFIX="${pkgdir}/usr/local/"
  sudo install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${name}"
}

post_remove() {
  sudo rm -rf "/usr/share/licenses/${name}"
}
# vim:set ft=sh ts=2 sw=2 et:

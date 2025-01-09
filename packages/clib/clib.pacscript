#!/usr/bin/bash
# shellcheck disable=2034,2032,2033
#-*- mode: sh-*-
pkgname="clib"
arch=("any")
pkgver="2.8.3"
pkgdesc="C package manager-ish"
source=("@${pkgname}~${pkgver}::https://github.com/clibs/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
makedepends=("gcc" "libcurl4-gnutls-dev")
sha256sums=("0ad8262d13ef138a12452e67e081e3eb31a264e2040cfce09417e8f7eed4e1f5")
repology=("project: ${pkgname}")

build() {
  cd "${pkgname}~${pkgver}"
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  make install DESTDIR="${pkgdir}" PREFIX="${pkgdir}/usr/local/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ft=sh ts=2 sw=2 et:

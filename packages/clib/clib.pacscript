#!/usr/bin/bash
# shellcheck disable=2034,2032,2033
#-*- mode: sh-*-
pkgname="clib"
arch=("any")
pkgver="2.8.7"
pkgdesc="C package manager-ish"
source=("@${pkgname}~${pkgver}::https://github.com/clibs/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
makedepends=("gcc" "libcurl4-gnutls-dev")
sha256sums=("83d5767e363c3ed4b4271000b9ce63b6e11b6c4740df910e0074f844fb34258e")
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

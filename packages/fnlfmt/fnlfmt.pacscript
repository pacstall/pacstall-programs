#!/bin/bash
# shellcheck disable=2034
# shellcheck disable=2154
# shellcheck disable=2032
# shellcheck disable=2033
#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="fnlfmt"
arch=("all")
pkgver="0.3.2"
pkgdesc="A formatter for fennel source code"
source=("@${pkgname}~${pkgver}::https://git.sr.ht/~technomancy/fnlfmt/archive/${pkgver}.tar.gz")
breaks=("${pkgname}-bin" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
depends=("lua5.3")
makedepends=("lua5.3")
sha256sums=("646c9033481a70c4430ced7397f6bc04b1d214fd35bee1579dd4c7901b81ac94")
repology=("project: fnlfmt")

build() {
  cd "${pkgname}~${pkgver}"
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  install -D "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ft=sh ts=2 sw=2 et:

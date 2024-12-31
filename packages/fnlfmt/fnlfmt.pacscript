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
pkgver="0.3.0"
pkgdesc="A formatter for fennel source code"
source=("@${pkgname}~${pkgver}::https://git.sr.ht/~technomancy/fnlfmt/archive/${pkgver}.tar.gz")
breaks=("${gives}-bin" "${gives}-git" "${gives}-deb" "${gives}-app")
depends=("lua5.3")
makedepends=("lua5.3")
sha256sums=("8baa2f5ed98f449139f6bd8b4859575c4cfeacc60c0a8884ecaa27bc94e69156")
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

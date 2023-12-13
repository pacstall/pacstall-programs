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
maintainer="wizard-28 <wiz28@pm.me>"

name="fnlfmt"
pkgver="0.3.0"
pkgdesc="A formatter for fennel source code"
url="https://git.sr.ht/~technomancy/fnlfmt/archive/${pkgver}.tar.gz"
gives="${pkgname}"
breaks=("${pkgname}-bin" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
depends=("lua5.3")
makedepends=("lua5.3")
hash="8baa2f5ed98f449139f6bd8b4859575c4cfeacc60c0a8884ecaa27bc94e69156"
repology=("project: fnlfmt")

build() {
  make -j"${NCPU}"
}

package() {
  sudo install -D "${name}" "${pkgdir}/usr/bin/${name}"
}

# vim:set ft=sh ts=2 sw=2 et:

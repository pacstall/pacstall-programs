#!/usr/bin/bash
#-*- mode: sh-*-
#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="pacup-bin"
pkgname="pacup"
gives="pacup"
pkgver="2.0.0"
pkgdesc="Help maintainers update pacscripts"
url="https://github.com/pacstall/pacup/releases/download/${pkgver}/pacup"
breaks=("${pkgname}" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
hash="12414c914ef7021f804be8786d316542202f2680f69190a2a0b98f82bf5e9804"

package() {
  sudo install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
# vim:set ft=sh ts=2 sw=2 et:

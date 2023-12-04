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
gives="pacup"
pkgver="2.1.0"
pkgdesc="Help maintainers update pacscripts"
url="https://github.com/pacstall/pacup/releases/download/${pkgver}/pacup"
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
hash="dddf7a6ceb6d9b652c85c04bf3b8b10d0b1a8fb881505f82efc1b0b21e2a26d1"

package() {
  sudo install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
# vim:set ft=sh ts=2 sw=2 et:

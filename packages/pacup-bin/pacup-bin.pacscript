#!/usr/bin/bash
#-*- mode: sh-*-
#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="pacup-bin"
gives="pacup"
pkgver="2.1.1"
pkgdesc="Help maintainers update pacscripts"
source=("https://github.com/pacstall/pacup/releases/download/${pkgver}/pacup")
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
sha256sums=("ccb753ef785b0ad38a3b090c7fdaba023f4f31634a93ce8158d1d12fa5457f36")

package() {
  cd "${_archive}"
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
# vim:set ft=sh ts=2 sw=2 et:

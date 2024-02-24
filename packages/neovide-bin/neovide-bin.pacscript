#!/usr/bin/bash
#-*- mode: sh-*-
#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="neovide-bin"
gives="neovide"
pkgver="0.12.2"
pkgdesc="No nonsense neovim client in Rust"
url="https://github.com/neovide/neovide/releases/download/${pkgver}/neovide-linux-x86_64.tar.gz"
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
hash="f2e13a9d1941ea8418b5fde5a884892202657aff0b8fcddcf540b7d4caa69c24"
repology=("project: neovide")

package() {
  sudo install -vDm755 "${gives}" -t "${pkgdir}/usr/bin"
}
# vim:set ft=sh ts=2 sw=2 et:

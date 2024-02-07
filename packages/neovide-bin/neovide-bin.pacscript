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
pkgver="0.11.1"
pkgdesc="No nonsense neovim client in Rust"
url="https://github.com/neovide/neovide/releases/download/${pkgver}/neovide-linux-x86_64.tar.gz"
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
hash="d79373654c89f3cf5b8eaedd65ee443513521c69816cc6c41289a874fe817a07"
repology=("project: neovide")

package() {
  sudo install -vDm755 "${gives}" -t "${pkgdir}/usr/bin"
}

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
pkgname="neovide"
version="0.10.3"
description="No nonsense neovim client in Rust"
url="https://github.com/neovide/neovide/releases/download/${version}/neovide.tar.gz"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
hash="0fc0593a0f55e99fa8398e8137ac89632ea7fc97a90cbd32d8c2a69afc1eff6f"
repology=("project: neovide")

install() {
  sudo install -vDm755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
# vim:set ft=sh ts=2 sw=2 et:

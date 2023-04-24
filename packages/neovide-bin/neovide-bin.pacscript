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
version="0.10.4"
description="No nonsense neovim client in Rust"
url="https://github.com/neovide/neovide/releases/download/${version}/neovide.tar.gz"
breaks=("${pkgname}" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
hash="ea7e27af14245813b9412c4b0d3a18ab278eacaf07ea93fa2cbb9bea7ce3cd0e"
repology=("project: neovide")

install() {
  sudo install -vDm755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
# vim:set ft=sh ts=2 sw=2 et:

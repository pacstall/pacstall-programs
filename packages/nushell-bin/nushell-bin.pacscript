#!/usr/bin/bash
#-*- mode: sh-*-
#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="nushell-bin"
pkgname="nushell"
version="0.75.0"
description="A new type of shell"
url="https://github.com/nushell/nushell/releases/download/${version}/nu-${version}-x86_64-unknown-linux-musl.tar.gz"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
hash="3598dd0319bcb9aaa82005fa3beacbd3cb24c0199951057a7a2cf5072784d570"
repology=("project: nushell")

install() {
  # binaries
  find ./ \
    -maxdepth 1 \
    -executable \
    -type f \
    -name "nu*" \
    -exec sudo install -vDm755 -t "${pkgdir}/usr/bin" "{}" +

  # documentation
  sudo install -vDm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.txt

  # license
  sudo install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
# vim:set ft=sh ts=2 sw=2 et:

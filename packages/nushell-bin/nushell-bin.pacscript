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
version="0.73.0"
description="A new type of shell"
url="https://github.com/nushell/nushell/releases/download/${version}/nu-${version}-x86_64-unknown-linux-musl.tar.gz"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
hash="aae67aab03db25625b1c3fe30fe309ac1a0d5d97e4be27f1d1882c47fbd99ec2"
repology=("project: nushell")

install() {
  # binaries
  find ./ \
    -maxdepth 1 \
    -executable \
    -type f \
    -name "nu*" \
    -exec sudo install -vDm755 -t "$pkgdir/usr/bin" "{}" +

  # documentation
  sudo install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.txt

  # license
  sudo install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
# vim:set ft=sh ts=2 sw=2 et:

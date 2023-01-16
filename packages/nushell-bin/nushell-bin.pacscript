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
version="0.74.0"
description="A new type of shell"
url="https://github.com/nushell/nushell/releases/download/${version}/nu-${version}-x86_64-unknown-linux-musl.tar.gz"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
hash="32b5b88124b498161159513fee293bfb0e8a93238f52f78e013941d578732bfe"
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

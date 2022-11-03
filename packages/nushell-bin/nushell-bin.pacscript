#!/usr/bin/bash
#-*- mode: sh-*-#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="nushell-bin"
pkgname="nushell"
version="0.70.0"
description="A new type of shell"
url="https://github.com/nushell/nushell/releases/download/${version}/nu-${version}-x86_64-unknown-linux-musl.tar.gz"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
hash="40ba6ca04d19be072eec28499ce8b83711ef7bd8aa213c2d6ecf611b2e6da81e"
repology=("project: nushell")

prepare() {
  true
}

build() {
  true
}

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

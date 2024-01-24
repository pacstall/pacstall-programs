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
pkgver="0.89.0"
pkgdesc="A new type of shell"
breaks=("${pkgname}" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
repology=("project: nushell")
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="236c14f850051974f9ee803a17b41250f9af02666b46d1ae56848797b1218bd1"
  gnuarch="aarch64"
else
  hash="3e9c9a238dce63010b2115b870db8ef40bf9e67fadb5e7e820eb576d41c85815"
  gnuarch="x86_64"
fi
url="https://github.com/nushell/nushell/releases/download/${pkgver}/nu-${pkgver}-${gnuarch}-unknown-linux-gnu.tar.gz"

package() {
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

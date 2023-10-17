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
pkgver="0.86.0"
pkgdesc="A new type of shell"
breaks=("${pkgname}" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
repology=("project: nushell")
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="24d43d007b7471a98389010e2717173d699c0fa84dce444986d10cc3e839eccc"
  gnuarch="aarch64"
else
  hash="5666b4017bcb08f4ed42411a5cbad937f63a92c1eab3077bb20458b1cfe5e54c"
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

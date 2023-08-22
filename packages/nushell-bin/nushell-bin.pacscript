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
pkgver="0.83.1"
pkgdesc="A new type of shell"
breaks=("${pkgname}" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
repology=("project: nushell")
if [[ ${CARCH} == "arm64" ]]; then
  hash="510754cfa66371699971bc3ddfd89eb473026f6c2241b914f5dc05f29de7426c"
  arch=('arm64')
  gnuarch="aarch64"
else
  hash="56604841e522bf969429a5d1e68d4763c38d89eeda4d0e3ee715a75a5a31ca78"
  arch=('amd64')
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

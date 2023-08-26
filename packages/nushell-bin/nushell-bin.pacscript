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
pkgver="0.84.0"
pkgdesc="A new type of shell"
breaks=("${pkgname}" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
repology=("project: nushell")
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="47c7af24ba2f27ffec5b4c5d70832789f6a5474e0f3e7753c5f801e21761d446"
  gnuarch="aarch64"
else
  hash="4225292afa446f8f9141dd53ac2a6e94f2de0a143f84c0542b0b627322bab624"
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

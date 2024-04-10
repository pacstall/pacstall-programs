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
pkgver="0.92.1"
pkgdesc="A new type of shell"
breaks=("${pkgname}" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
repology=("project: nushell")
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="493e95907ddb1f34dca060e6bcbde835f7acb63153404ac3a76da3d45ac6e85a"
  gnuarch="aarch64"
else
  hash="6c88ff80fd446572acb25e81f209deb895468c6d754b3fbc7354248e9fc4a0af"
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

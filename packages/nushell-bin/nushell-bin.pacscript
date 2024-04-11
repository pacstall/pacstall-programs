#!/usr/bin/bash
#-*- mode: sh-*-
#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="nushell-bin"
gives="nushell"
pkgver="0.92.1"
pkgdesc="A new type of shell"
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
repology=("project: nushell")
arch=('arm64' 'amd64')
sha256sums_arm64=("493e95907ddb1f34dca060e6bcbde835f7acb63153404ac3a76da3d45ac6e85a")
sha256sums_amd64=("6c88ff80fd446572acb25e81f209deb895468c6d754b3fbc7354248e9fc4a0af")
if [[ ${CARCH} == arm64 ]]; then
  gnuarch="aarch64"
else
  gnuarch="x86_64"
fi
source=("https://github.com/nushell/nushell/releases/download/${pkgver}/nu-${pkgver}-${gnuarch}-unknown-linux-gnu.tar.gz")

package() {
  cd "${_archive}"
  # binaries
  find ./ \
    -maxdepth 1 \
    -executable \
    -type f \
    -name "nu*" \
    -exec install -vDm755 -t "${pkgdir}/usr/bin" "{}" +

  # documentation
  install -vDm644 -t "${pkgdir}/usr/share/doc/${gives}" README.txt

  # license
  install -vDm644 -t "${pkgdir}/usr/share/licenses/${gives}" LICENSE
}
# vim:set ft=sh ts=2 sw=2 et:

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
fake_gives="nushell"
pkgver="0.101.0"
pkgdesc="A new type of shell"
breaks=("${fake_gives}" "${fake_gives}-git" "${fake_gives}-deb" "${fake_gives}-app")
repology=("project: nushell")
arch=('arm64' 'amd64')
sha256sums_arm64=("0b6a5f4c95c11452d8d54b3efdb1b38f7599a40ea09bb5cdd9f0faf98c022a40")
sha256sums_amd64=("7149728c779b5d7e7f86e34f36fd31332f7677df3e9a47b5744a1e1756d3ce76")
source_amd64=("@${pkgname}~${pkgver}::https://github.com/nushell/nushell/releases/download/${pkgver}/nu-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_arm64=("@${pkgname}~${pkgver}::https://github.com/nushell/nushell/releases/download/${pkgver}/nu-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")

package() {
  cd "${pkgname}~${pkgver}"
  # binaries
  find ./ \
    -maxdepth 1 \
    -executable \
    -type f \
    -name "nu*" \
    -exec install -vDm755 -t "${pkgdir}/usr/bin" "{}" +

  # documentation
  install -vDm644 -t "${pkgdir}/usr/share/doc/${fake_gives}" README.txt

  # license
  install -vDm644 -t "${pkgdir}/usr/share/licenses/${fake_gives}" LICENSE
}
# vim:set ft=sh ts=2 sw=2 et:

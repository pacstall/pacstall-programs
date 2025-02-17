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
pkgver="0.102.0"
pkgdesc="A new type of shell"
breaks=("${fake_gives}" "${fake_gives}-git" "${fake_gives}-deb" "${fake_gives}-app")
repology=("project: nushell")
arch=('arm64' 'amd64')
sha256sums_arm64=("770ae9bf490fc3fd2a2f0eef5c605f41d3930da16aa5f2159fc2b1493739d322")
sha256sums_amd64=("8facc8575dc5cc1406d5f00625faf40556da986f8932e90c8f891241df7275a3")
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

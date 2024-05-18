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
pkgver="0.93.0"
pkgdesc="A new type of shell"
breaks=("${fake_gives}" "${fake_gives}-git" "${fake_gives}-deb" "${fake_gives}-app")
repology=("project: nushell")
arch=('arm64' 'amd64')
sha256sums_arm64=("eb01090d45555b74659086a73381c1e125b86cb038ffee809470af94bda5154f")
sha256sums_amd64=("016cfbcc8be52b26d387fce02d82eebcaf62304a306eb30a6f5974ac04e6972c")
source_amd64=("https://github.com/nushell/nushell/releases/download/${pkgver}/nu-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_arm64=("https://github.com/nushell/nushell/releases/download/${pkgver}/nu-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")

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
  install -vDm644 -t "${pkgdir}/usr/share/doc/${fake_gives}" README.txt

  # license
  install -vDm644 -t "${pkgdir}/usr/share/licenses/${fake_gives}" LICENSE
}
# vim:set ft=sh ts=2 sw=2 et:

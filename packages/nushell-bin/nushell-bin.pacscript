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
pkgver="0.106.0"
pkgdesc="A new type of shell"
breaks=("${fake_gives}" "${fake_gives}-git" "${fake_gives}-deb" "${fake_gives}-app")
repology=("project: nushell")
arch=('arm64' 'amd64')
sha256sums_arm64=("a441dfbb4e69ef9eced4549f05b4f1a83ba9651f291c5d18b3a3f23b67884b6d")
sha256sums_amd64=("ba0969d7172fd5ed87204593c2688fbb1c27bfe1fb606e6d443dfd6c44ef98c6")
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

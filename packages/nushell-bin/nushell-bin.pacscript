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
pkgver="0.105.1"
pkgdesc="A new type of shell"
breaks=("${fake_gives}" "${fake_gives}-git" "${fake_gives}-deb" "${fake_gives}-app")
repology=("project: nushell")
arch=('arm64' 'amd64')
sha256sums_arm64=("6f690338d5854b2db48599e786c0d0210fb7ec888a6ecbd02eed83542756868e")
sha256sums_amd64=("6501bc346e2ad6eecae3bcf7eee78ac21b1a03bdc4fda879a4d24793c1f08db7")
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

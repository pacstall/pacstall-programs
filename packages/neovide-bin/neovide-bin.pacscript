#!/usr/bin/bash
#-*- mode: sh-*-
#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="neovide-bin"
gives="neovide"
arch=("amd64")
pkgver="0.15.0"
pkgdesc="No nonsense neovim client in Rust"
source=(
  "@${pkgname}~${pkgver}::https://github.com/neovide/neovide/releases/download/${pkgver}/neovide-linux-x86_64.tar.gz"
  "${gives}.desktop::https://raw.githubusercontent.com/neovide/neovide/${pkgver}/assets/${gives}.desktop"
  "LICENSE::https://raw.githubusercontent.com/neovide/neovide/${pkgver}/LICENSE"
  "https://raw.githubusercontent.com/neovide/neovide/${pkgver}/assets/${gives}-16x16.png"
  "https://raw.githubusercontent.com/neovide/neovide/${pkgver}/assets/${gives}-32x32.png"
  "https://raw.githubusercontent.com/neovide/neovide/${pkgver}/assets/${gives}-48x48.png"
  "https://raw.githubusercontent.com/neovide/neovide/${pkgver}/assets/${gives}-256x256.png"
)
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
sha256sums=(
  "218b70f1e509ea249d036095b5f37f5225e5cbfedebb51d1b758279bef124446"
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
)
repology=("project: neovide")

package() {
  cd "${pkgname}~${pkgver}"
  install -vDm755 "${gives}" -t "${pkgdir}/usr/bin"
  for s in 16 32 48 256; do
    install -vDm755 "${srcdir}/${gives}-${s}x${s}.png" -t "${pkgdir}/usr/share/icons/hicolor/${s}x${s}/apps"
  done
  install -vDm755 "${srcdir}/${gives}.desktop" -t "${pkgdir}/usr/share/applications"
  install -vDm755 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/neovide"
}
# vim:set ft=sh ts=2 sw=2 et:

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
pkgver="0.12.2"
pkgrel="2"
pkgdesc="No nonsense neovim client in Rust"
source=(
  "https://github.com/neovide/neovide/releases/download/${pkgver}/neovide-linux-x86_64.tar.gz"
  "${gives}.desktop::https://raw.githubusercontent.com/neovide/neovide/${pkgver}/assets/${gives}.desktop"
  "LICENSE::https://raw.githubusercontent.com/neovide/neovide/${pkgver}/LICENSE"
)
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
sha256sums=(
  "f2e13a9d1941ea8418b5fde5a884892202657aff0b8fcddcf540b7d4caa69c24"
  "SKIP"
  "SKIP"
)
repology=("project: neovide")

prepare() {
  cd "${_archive}"
  for s in 16 32 48 256; do
    wget -q "https://raw.githubusercontent.com/neovide/neovide/${pkgver}/assets/${gives}-${s}x${s}.png"
  done
}

package() {
  cd "${_archive}"
  sudo install -vDm755 "${gives}" -t "${pkgdir}/usr/bin"
  for s in 16 32 48 256; do
    sudo install -vDm755 "${gives}-${s}x${s}.png" -t "${pkgdir}/usr/share/icons/hicolor/${s}x${s}/apps"
  done
  sudo install -vDm755 "${srcdir}/${gives}.desktop" -t "${pkgdir}/usr/share/applications"
  sudo install -vDm755 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/neovide"
}
# vim:set ft=sh ts=2 sw=2 et:

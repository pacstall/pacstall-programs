#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="mold-bin"
gives="mold"
pkgver="2.3.1"
arch=("amd64" "arm64")
case "${CARCH}" in
  amd64)
    url="https://github.com/rui314/mold/releases/download/v${pkgver}/mold-${pkgver}-x86_64-linux.tar.gz"
    hash="17e7ed0fd4877fbf24d13a830bd325ce3ebd05434800af9296b6c576fcc0414e"
    ;;
  arm64)
    url="https://github.com/rui314/mold/releases/download/v${pkgver}/mold-${pkgver}-aarch64-linux.tar.gz"
    hash="dd4a967aadc9f03f7777f7dac74349c8ff453c46967484e041044beb11d4dde9"
    ;;
  *) return 1 ;;
esac
pkgdesc="A modern linker"
breaks=("${gives}-git" "${name}")
repology=("project: mold")

package() {
  sudo mkdir -p "${pkgdir}/usr/"
  sudo mv ./* "${pkgdir}/usr/"
}
# vim:set ft=sh ts=2 sw=2 et:

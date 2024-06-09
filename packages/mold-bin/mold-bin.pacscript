#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="mold-bin"
gives="mold"
pkgver="2.32.0"
arch=("amd64" "arm64")
source_amd64=("https://github.com/rui314/mold/releases/download/v${pkgver}/mold-${pkgver}-x86_64-linux.tar.gz")
sha256sums_amd64=("2e69989cc1c0041ecfcb31fec57b2a5caa7802848d9468ffa5b1b348b26e4982")
source_arm64=("https://github.com/rui314/mold/releases/download/v${pkgver}/mold-${pkgver}-aarch64-linux.tar.gz")
sha256sums_arm64=("c75d17c1c530dee4b9ca811aaacca782a9fe8538ae8c68ce619f198a58e2b0e7")

pkgdesc="A modern linker"
breaks=("${gives}-git" "${pkgname}")
repology=("project: mold")

package() {
  cd "${_archive}"
  mkdir -p "${pkgdir}/usr/"
  mv ./* "${pkgdir}/usr/"
}
# vim:set ft=sh ts=2 sw=2 et:

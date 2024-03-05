#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="mold-bin"
gives="mold"
pkgver="2.4.1"
arch=("amd64" "arm64")
source_amd64=("https://github.com/rui314/mold/releases/download/v${pkgver}/mold-${pkgver}-x86_64-linux.tar.gz")
source_arm64=("https://github.com/rui314/mold/releases/download/v${pkgver}/mold-${pkgver}-aarch64-linux.tar.gz")
hash_amd64=("9e9ee98bf3bedf42bc17488f32f73279af7d31a4636e0460ebb0e12ce354e9c7")
hash_arm64=("09cff2e6bc8ccb429b0ad512453225c8db43c8121a9a5e818efefc7ebab5301f")
pkgdesc="A modern linker"
breaks=("${gives}-git" "${name}")
repology=("project: mold")

package() {
  sudo mkdir -p "${pkgdir}/usr/"
  sudo mv ./* "${pkgdir}/usr/"
}
# vim:set ft=sh ts=2 sw=2 et:

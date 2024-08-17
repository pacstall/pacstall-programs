#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="mold-bin"
gives="mold"
pkgver="2.33.0"
arch=("amd64" "arm64")
source_amd64=("https://github.com/rui314/mold/releases/download/v${pkgver}/mold-${pkgver}-x86_64-linux.tar.gz")
sha256sums_amd64=("e169f7aaec6fbbad5e02ce8d705f59ed9372179ea180afb3fc967c3941ab2c16")
source_arm64=("https://github.com/rui314/mold/releases/download/v${pkgver}/mold-${pkgver}-aarch64-linux.tar.gz")
sha256sums_arm64=("20ba9736a3dc0e0c9d5df177f375ad9c9d2a88864727e80a3e21d71abc7874e4")

pkgdesc="A modern linker"
breaks=("${gives}-git" "${pkgname}")
repology=("project: mold")

package() {
  cd "${_archive}"
  mkdir -p "${pkgdir}/usr/"
  mv ./* "${pkgdir}/usr/"
}
# vim:set ft=sh ts=2 sw=2 et:

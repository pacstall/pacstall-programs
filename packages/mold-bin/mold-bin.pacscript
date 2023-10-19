#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="mold-bin"
gives="mold"
pkgver="2.3.0"
arch=("amd64" "arm64")
case "${CARCH}" in
  amd64)
    url="https://github.com/rui314/mold/releases/download/v${pkgver}/mold-${pkgver}-x86_64-linux.tar.gz"
    hash="7a1a9f025b1701def92015abce41580ed352dabf33d80f0344d0e1e7e70cd796"
    ;;
  arm64)
    url="https://github.com/rui314/mold/releases/download/v${pkgver}/mold-${pkgver}-aarch64-linux.tar.gz"
    hash="db938d01aa70d3d4685052d646ede9e16b507ba26135475d8251b9ce2e96cb64"
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

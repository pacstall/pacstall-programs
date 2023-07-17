#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="mold-bin"
gives="mold"
version="1.11.0"
arch=("amd64" "arm64")
case "${CARCH}" in
  amd64)
    url="https://github.com/rui314/mold/releases/download/v${version}/mold-${version}-x86_64-linux.tar.gz"
    hash="bf788940db4a9ac19e7745c821bf6ee18ff4d75441a803d84f86c9f3b0aa2a5e"
    ;;
  arm64)
    url="https://github.com/rui314/mold/releases/download/v${version}/mold-${version}-aarch64-linux.tar.gz"
    hash="4d7f0cc976ed1dfde1ceeaadd16829427a477eba1b49ff82dd490395f32eb78c"
    ;;
  *) return 1 ;;
esac
description="A modern linker"
breaks=("${name}-git" "${name}")
repology=("project: mold")

package() {
  sudo mkdir -p "${pkgdir}/usr/"
  sudo mv ./* "${pkgdir}/usr/"
}
# vim:set ft=sh ts=2 sw=2 et:

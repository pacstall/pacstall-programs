#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="mold-bin"
gives="mold"
pkgver="2.3.2"
arch=("amd64" "arm64")
case "${CARCH}" in
  amd64)
    url="https://github.com/rui314/mold/releases/download/v${pkgver}/mold-${pkgver}-x86_64-linux.tar.gz"
    hash="2f0d694f81fa39f5e4947bd62cd39d34fe74a4dda330e80838f65e1798043c1d"
    ;;
  arm64)
    url="https://github.com/rui314/mold/releases/download/v${pkgver}/mold-${pkgver}-aarch64-linux.tar.gz"
    hash="851d67b22cae36db718112734308a244e98bf3ea9f94aeca36bbd641f3c3d806"
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

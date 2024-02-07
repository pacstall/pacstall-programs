#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="mold-bin"
gives="mold"
pkgver="2.4.0"
arch=("amd64" "arm64")
case "${CARCH}" in
  amd64)
    url="https://github.com/rui314/mold/releases/download/v${pkgver}/mold-${pkgver}-x86_64-linux.tar.gz"
    hash="666354f7dbd00982591257cf3729cb7f7967387b7576ac5f0e33262dc6c985ce"
    ;;
  arm64)
    url="https://github.com/rui314/mold/releases/download/v${pkgver}/mold-${pkgver}-aarch64-linux.tar.gz"
    hash="08959d33d0149519fdeb9104b61dc17aa6200f1c6889c343e6b83ffb4833204b"
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

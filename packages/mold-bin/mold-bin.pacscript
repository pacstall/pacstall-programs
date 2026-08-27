#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="mold-bin"
gives="mold"
pkgver="2.42.0"
url='https://github.com/rui314/mold'
arch=("amd64" "arm64" "armhf" "ppc64el" "riscv64" "s390x")
source_amd64=("@${pkgname}~${pkgver}::${url}/releases/download/v${pkgver}/mold-${pkgver}-x86_64-linux.tar.gz")
source_arm64=("@${pkgname}~${pkgver}::${url}/releases/download/v${pkgver}/mold-${pkgver}-aarch64-linux.tar.gz")
source_armhf=("@${pkgname}~${pkgver}::${url}/releases/download/v${pkgver}/mold-${pkgver}-arm-linux.tar.gz")
source_ppc64el=("@${pkgname}~${pkgver}::${url}/releases/download/v${pkgver}/mold-${pkgver}-ppc64le-linux.tar.gz")
source_riscv64=("@${pkgname}~${pkgver}::${url}/releases/download/v${pkgver}/mold-${pkgver}-riscv64-linux.tar.gz")
source_s390x=("@${pkgname}~${pkgver}::${url}/releases/download/v${pkgver}/mold-${pkgver}-s390x-linux.tar.gz")
sha256sums_amd64=("f5ed2f6e31d1ada4f07fe766fe0de7a73104d1c5cdc59086fcecc16a43720b6d")
sha256sums_arm64=("3c9a0a3624aac8a2007569ae50c33b3129a0f0ae8bcc974aeee2f8939d295190")
sha256sums_armhf=("3c9a0a3624aac8a2007569ae50c33b3129a0f0ae8bcc974aeee2f8939d295190")
sha256sums_ppc64el=("3c9a0a3624aac8a2007569ae50c33b3129a0f0ae8bcc974aeee2f8939d295190")
sha256sums_riscv64=("3c9a0a3624aac8a2007569ae50c33b3129a0f0ae8bcc974aeee2f8939d295190")
sha256sums_s390x=("3c9a0a3624aac8a2007569ae50c33b3129a0f0ae8bcc974aeee2f8939d295190")

pkgdesc="A modern linker"
breaks=("${gives}-git" "${pkgname}")
repology=("project: mold")

package() {
  cd "${pkgname}~${pkgver}"
  mkdir -p "${pkgdir}/usr/"
  mv ./* "${pkgdir}/usr/"
}
# vim:set ft=sh ts=2 sw=2 et:

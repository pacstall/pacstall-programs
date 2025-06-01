#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="mold-bin"
gives="mold"
pkgver="2.40.0"
url="https://github.com/rui314/mold"
arch=("amd64" "arm64" "armhf" "ppc64el" "riscv64" "s390x")
source_amd64=("@${pkgname}~${pkgver}::${url}/releases/download/v${pkgver}/mold-${pkgver}-x86_64-linux.tar.gz")
source_arm64=("@${pkgname}~${pkgver}::${url}/releases/download/v${pkgver}/mold-${pkgver}-aarch64-linux.tar.gz")
source_armhf=("@${pkgname}~${pkgver}::${url}/releases/download/v${pkgver}/mold-${pkgver}-arm-linux.tar.gz")
source_ppc64el=("@${pkgname}~${pkgver}::${url}/releases/download/v${pkgver}/mold-${pkgver}-ppc64le-linux.tar.gz")
source_riscv64=("@${pkgname}~${pkgver}::${url}/releases/download/v${pkgver}/mold-${pkgver}-riscv64-linux.tar.gz")
source_s390x=("@${pkgname}~${pkgver}::${url}/releases/download/v${pkgver}/mold-${pkgver}-s390x-linux.tar.gz")
sha256sums_amd64=("143e9d9624a2a7ffa25565a8bd3818479029c83b4f5913ed11dd2acaace3fab3")
sha256sums_arm64=("56442e2e5ee2a23bf1a8bd0d90bc21be5fffa226c96a62c35f225ebd6c9452ab")
sha256sums_armhf=("56442e2e5ee2a23bf1a8bd0d90bc21be5fffa226c96a62c35f225ebd6c9452ab")
sha256sums_ppc64el=("56442e2e5ee2a23bf1a8bd0d90bc21be5fffa226c96a62c35f225ebd6c9452ab")
sha256sums_riscv64=("56442e2e5ee2a23bf1a8bd0d90bc21be5fffa226c96a62c35f225ebd6c9452ab")
sha256sums_s390x=("56442e2e5ee2a23bf1a8bd0d90bc21be5fffa226c96a62c35f225ebd6c9452ab")

pkgdesc="A modern linker"
breaks=("${gives}-git" "${pkgname}")
repology=("project: mold")

package() {
  cd "${pkgname}~${pkgver}"
  mkdir -p "${pkgdir}/usr/"
  mv ./* "${pkgdir}/usr/"
}
# vim:set ft=sh ts=2 sw=2 et:

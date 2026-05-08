#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="mold-bin"
gives="mold"
pkgver="2.41.0"
url='https://github.com/rui314/mold'
arch=("amd64" "arm64" "armhf" "ppc64el" "riscv64" "s390x")
source_amd64=("@${pkgname}~${pkgver}::${url}/releases/download/v${pkgver}/mold-${pkgver}-x86_64-linux.tar.gz")
source_arm64=("@${pkgname}~${pkgver}::${url}/releases/download/v${pkgver}/mold-${pkgver}-aarch64-linux.tar.gz")
source_armhf=("@${pkgname}~${pkgver}::${url}/releases/download/v${pkgver}/mold-${pkgver}-arm-linux.tar.gz")
source_ppc64el=("@${pkgname}~${pkgver}::${url}/releases/download/v${pkgver}/mold-${pkgver}-ppc64le-linux.tar.gz")
source_riscv64=("@${pkgname}~${pkgver}::${url}/releases/download/v${pkgver}/mold-${pkgver}-riscv64-linux.tar.gz")
source_s390x=("@${pkgname}~${pkgver}::${url}/releases/download/v${pkgver}/mold-${pkgver}-s390x-linux.tar.gz")
sha256sums_amd64=("a3696680d99e692970590a178bc3a33d78d60d1c6dc9db7a11b557b02b751f5d")
sha256sums_arm64=("946de2774b06a71346bd59b55fddba610b65b8d93c3a4a1559cc84e103472710")
sha256sums_armhf=("946de2774b06a71346bd59b55fddba610b65b8d93c3a4a1559cc84e103472710")
sha256sums_ppc64el=("946de2774b06a71346bd59b55fddba610b65b8d93c3a4a1559cc84e103472710")
sha256sums_riscv64=("946de2774b06a71346bd59b55fddba610b65b8d93c3a4a1559cc84e103472710")
sha256sums_s390x=("946de2774b06a71346bd59b55fddba610b65b8d93c3a4a1559cc84e103472710")

pkgdesc="A modern linker"
breaks=("${gives}-git" "${pkgname}")
repology=("project: mold")

package() {
  cd "${pkgname}~${pkgver}"
  mkdir -p "${pkgdir}/usr/"
  mv ./* "${pkgdir}/usr/"
}
# vim:set ft=sh ts=2 sw=2 et:

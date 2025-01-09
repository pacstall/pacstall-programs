#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="mold-bin"
gives="mold"
pkgver="2.35.0"
url="https://github.com/rui314/mold"
arch=("amd64" "arm64" "armhf" "ppc64el" "riscv64" "s390x")
source_amd64=("@${pkgname}~${pkgver}::${url}/releases/download/v${pkgver}/mold-${pkgver}-x86_64-linux.tar.gz")
source_arm64=("@${pkgname}~${pkgver}::${url}/releases/download/v${pkgver}/mold-${pkgver}-aarch64-linux.tar.gz")
source_armhf=("@${pkgname}~${pkgver}::${url}/releases/download/v${pkgver}/mold-${pkgver}-arm-linux.tar.gz")
source_ppc64el=("@${pkgname}~${pkgver}::${url}/releases/download/v${pkgver}/mold-${pkgver}-ppc64le-linux.tar.gz")
source_riscv64=("@${pkgname}~${pkgver}::${url}/releases/download/v${pkgver}/mold-${pkgver}-riscv64-linux.tar.gz")
source_s390x=("@${pkgname}~${pkgver}::${url}/releases/download/v${pkgver}/mold-${pkgver}-s390x-linux.tar.gz")
sha256sums_amd64=("91a24cbf508aa8c50731dc4fb6cf5b5e09f186008029b3ab95bcd98b2b9a7972")
sha256sums_arm64=("321e28e981ad0ea9a14e429f077a736813c7d7f36adbe871010bb45c7f09af23")
sha256sums_armhf=("321e28e981ad0ea9a14e429f077a736813c7d7f36adbe871010bb45c7f09af23")
sha256sums_ppc64el=("321e28e981ad0ea9a14e429f077a736813c7d7f36adbe871010bb45c7f09af23")
sha256sums_riscv64=("321e28e981ad0ea9a14e429f077a736813c7d7f36adbe871010bb45c7f09af23")
sha256sums_s390x=("321e28e981ad0ea9a14e429f077a736813c7d7f36adbe871010bb45c7f09af23")

pkgdesc="A modern linker"
breaks=("${gives}-git" "${pkgname}")
repology=("project: mold")

package() {
  cd "${pkgname}~${pkgver}"
  mkdir -p "${pkgdir}/usr/"
  mv ./* "${pkgdir}/usr/"
}
# vim:set ft=sh ts=2 sw=2 et:

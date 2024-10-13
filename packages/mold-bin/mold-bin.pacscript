#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="mold-bin"
gives="mold"
pkgver="2.34.1"
url="https://github.com/rui314/mold"
arch=("amd64" "arm64" "armhf" "ppc64el" "riscv64" "s390x")
source_amd64=("${url}/releases/download/v${pkgver}/mold-${pkgver}-x86_64-linux.tar.gz")
source_arm64=("${url}/releases/download/v${pkgver}/mold-${pkgver}-aarch64-linux.tar.gz")
source_armhf=("${url}/releases/download/v${pkgver}/mold-${pkgver}-arm-linux.tar.gz")
source_ppc64el=("${url}/releases/download/v${pkgver}/mold-${pkgver}-ppc64le-linux.tar.gz")
source_riscv64=("${url}/releases/download/v${pkgver}/mold-${pkgver}-riscv64-linux.tar.gz")
source_s390x=("${url}/releases/download/v${pkgver}/mold-${pkgver}-s390x-linux.tar.gz")
sha256sums_amd64=("dafd02fe19c51818aa22c9d569393616b1a85a2220d6fb32ba3728d351074e59")
sha256sums_arm64=("ea5f1266b92aa17c262210766dfd7cfd6637a6a94ac4c75e5def50d534ca24c1")
sha256sums_armhf=("ea5f1266b92aa17c262210766dfd7cfd6637a6a94ac4c75e5def50d534ca24c1")
sha256sums_ppc64el=("ea5f1266b92aa17c262210766dfd7cfd6637a6a94ac4c75e5def50d534ca24c1")
sha256sums_riscv64=("ea5f1266b92aa17c262210766dfd7cfd6637a6a94ac4c75e5def50d534ca24c1")
sha256sums_s390x=("ea5f1266b92aa17c262210766dfd7cfd6637a6a94ac4c75e5def50d534ca24c1")

pkgdesc="A modern linker"
breaks=("${gives}-git" "${pkgname}")
repology=("project: mold")

package() {
  cd "${_archive}"
  mkdir -p "${pkgdir}/usr/"
  mv ./* "${pkgdir}/usr/"
}
# vim:set ft=sh ts=2 sw=2 et:

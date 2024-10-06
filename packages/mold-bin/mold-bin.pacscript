#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="mold-bin"
gives="mold"
pkgver="2.34.0"
url="https://github.com/rui314/mold"
arch=("amd64" "arm64" "armhf" "ppc64el" "riscv64" "s390x")
source_amd64=("${url}/releases/download/v${pkgver}/mold-${pkgver}-x86_64-linux.tar.gz")
source_arm64=("${url}/releases/download/v${pkgver}/mold-${pkgver}-aarch64-linux.tar.gz")
source_armhf=("${url}/releases/download/v${pkgver}/mold-${pkgver}-arm-linux.tar.gz")
source_ppc64el=("${url}/releases/download/v${pkgver}/mold-${pkgver}-ppc64le-linux.tar.gz")
source_riscv64=("${url}/releases/download/v${pkgver}/mold-${pkgver}-riscv64-linux.tar.gz")
source_s390x=("${url}/releases/download/v${pkgver}/mold-${pkgver}-s390x-linux.tar.gz")
sha256sums_amd64=("0405c58d9afb47dad44912faa21a8fc2f8835352434b458c3ae9665e6581d1cb")
sha256sums_arm64=("e1f5c611e2450e27ea936fa33824ae860f6cbb5c7db67e73e801cee38725946a")
sha256sums_armhf=("e1f5c611e2450e27ea936fa33824ae860f6cbb5c7db67e73e801cee38725946a")
sha256sums_ppc64el=("e1f5c611e2450e27ea936fa33824ae860f6cbb5c7db67e73e801cee38725946a")
sha256sums_riscv64=("e1f5c611e2450e27ea936fa33824ae860f6cbb5c7db67e73e801cee38725946a")
sha256sums_s390x=("e1f5c611e2450e27ea936fa33824ae860f6cbb5c7db67e73e801cee38725946a")

pkgdesc="A modern linker"
breaks=("${gives}-git" "${pkgname}")
repology=("project: mold")

package() {
  cd "${_archive}"
  mkdir -p "${pkgdir}/usr/"
  mv ./* "${pkgdir}/usr/"
}
# vim:set ft=sh ts=2 sw=2 et:

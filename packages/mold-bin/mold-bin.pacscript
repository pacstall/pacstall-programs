#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="mold-bin"
gives="mold"
pkgver="2.40.1"
url='https://github.com/rui314/mold'
arch=("amd64" "arm64" "armhf" "ppc64el" "riscv64" "s390x")
source_amd64=("@${pkgname}~${pkgver}::${url}/releases/download/v${pkgver}/mold-${pkgver}-x86_64-linux.tar.gz")
source_arm64=("@${pkgname}~${pkgver}::${url}/releases/download/v${pkgver}/mold-${pkgver}-aarch64-linux.tar.gz")
source_armhf=("@${pkgname}~${pkgver}::${url}/releases/download/v${pkgver}/mold-${pkgver}-arm-linux.tar.gz")
source_ppc64el=("@${pkgname}~${pkgver}::${url}/releases/download/v${pkgver}/mold-${pkgver}-ppc64le-linux.tar.gz")
source_riscv64=("@${pkgname}~${pkgver}::${url}/releases/download/v${pkgver}/mold-${pkgver}-riscv64-linux.tar.gz")
source_s390x=("@${pkgname}~${pkgver}::${url}/releases/download/v${pkgver}/mold-${pkgver}-s390x-linux.tar.gz")
sha256sums_amd64=("d8892f673602f6437c08fabf7643a98cae8db64544ea5b3071b3be8f6c31c67a")
sha256sums_arm64=("4ac50a967783ab03b835118de1d7001b3be4f1d21c1a40a55f844e0ce489cf79")
sha256sums_armhf=("4ac50a967783ab03b835118de1d7001b3be4f1d21c1a40a55f844e0ce489cf79")
sha256sums_ppc64el=("4ac50a967783ab03b835118de1d7001b3be4f1d21c1a40a55f844e0ce489cf79")
sha256sums_riscv64=("4ac50a967783ab03b835118de1d7001b3be4f1d21c1a40a55f844e0ce489cf79")
sha256sums_s390x=("4ac50a967783ab03b835118de1d7001b3be4f1d21c1a40a55f844e0ce489cf79")

pkgdesc="A modern linker"
breaks=("${gives}-git" "${pkgname}")
repology=("project: mold")

package() {
  cd "${pkgname}~${pkgver}"
  mkdir -p "${pkgdir}/usr/"
  mv ./* "${pkgdir}/usr/"
}
# vim:set ft=sh ts=2 sw=2 et:

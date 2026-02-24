pkgname="resticprofile-bin"
gives="resticprofile"
pkgver="0.32.0"
arch=('amd64' 'arm64' 'armhf' 'i386' 'mips64el' 'ppc64el' 'riscv64' 's390x')
depends=("restic")
sha256sums_amd64=("ee50dac5aac334fab1fe43fb44ad7ff3061c3095326c74539eea045e991cc421")
sha256sums_arm64=("350b4a71f5a9d34381a4ae655eb8713205b2b32c922792f8890d848d99818d1a")
sha256sums_armhf=("6c3dbea32216175353307eadaf21e712ed3ba767384ed8e862a1c2937ff73689")
sha256sums_i386=("dcdbb0b13e05dea9e5d94be242aace10875d3ca922384243699c1367c256cafc")
sha256sums_mips64el=("94339c9800ad12fb8193e14177c0c549dc14fa66dd599815163597e62f9f7e24")
sha256sums_ppc64el=("fc9657a4339a52cc359bc6aa5cef87b1d76273f96dd66a9aae96c4ee8546d27f")
sha256sums_riscv64=("ac531493dc22ab909fe79b5fb0bf2a864d0efb5b362a9a13384792f0cc6a0b56")
sha256sums_s390x=("f22ac18ccba1599a26ba48b857e1d470e7a1c8e1e1072b2e51b4a0946e60a3bd")
source_amd64=("https://github.com/creativeprojects/resticprofile/releases/download/v${pkgver}/resticprofile_${pkgver}_linux_amd64.tar.gz")
source_arm64=("https://github.com/creativeprojects/resticprofile/releases/download/v${pkgver}/resticprofile_${pkgver}_linux_arm64.tar.gz")
source_armhf=("https://github.com/creativeprojects/resticprofile/releases/download/v${pkgver}/resticprofile_${pkgver}_linux_armv7.tar.gz")
source_i386=("https://github.com/creativeprojects/resticprofile/releases/download/v${pkgver}/resticprofile_${pkgver}_linux_386.tar.gz")
source_mips64el=("https://github.com/creativeprojects/resticprofile/releases/download/v${pkgver}/resticprofile_${pkgver}_linux_mips64le.tar.gz")
source_ppc64el=("https://github.com/creativeprojects/resticprofile/releases/download/v${pkgver}/resticprofile_${pkgver}_linux_ppc64le.tar.gz")
source_riscv64=("https://github.com/creativeprojects/resticprofile/releases/download/v${pkgver}/resticprofile_${pkgver}_linux_riscv64.tar.gz")
source_s390x=("https://github.com/creativeprojects/resticprofile/releases/download/v${pkgver}/resticprofile_${pkgver}_linux_s390x.tar.gz")
pkgdesc="Configuration profiles manager for restic backup"
url='https://github.com/creativeprojects/resticprofile'
maintainer=("Eric Renfro <psi-jack@linux-help.org>")

package() {
  cd "${srcdir}"
  install -Dm755 "${gives}" "${pkgdir}/usr/bin/${gives}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${gives}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${gives}"
}

# vim:set ft=sh ts=2 sw=2 et:

pkgname="resticprofile-bin"
gives="resticprofile"
pkgver="0.26.0"
arch=('amd64' 'arm64' 'armhf' 'i386' 'mips64el' 'ppc64el' 'riscv64' 's390x')
depends=("restic")
sha256sums_amd64=("bb2b566185f684a55134035b3f4738c9f3f4605aa67b847bdcecd94bd311263f")
sha256sums_arm64=("9b3b1e027a29b3bfe2e4ad59b241f6e17b3896a05dc4f1b0cd35eddb62deafd5")
sha256sums_armhf=("3b14d7286eb34624b68d021d16f11eafa678f7b57bdd73c2a570d3bec5668fd7")
sha256sums_i386=("73658b69bf001556967b188e095ee2e166caeff89d6b317cb8d0d2d92655bfb0")
sha256sums_mips64el=("ec260a40ece9d8445317d1b3fe1242959790faa9e95a787c3a50e9b2a3f5ebe1")
sha256sums_ppc64el=("951562b30ce83e4a78d809700b2fb5957b072a0b41d47a1e113062bcafabed4b")
sha256sums_riscv64=("b5c8be8566a1b5cd503e328bd8511438015e2261a3dbf34aafe3ab342d803a91")
sha256sums_s390x=("54aea4a1294c7554078282824ebfe8a602852a19fa9445d510e90d1e1a233612")
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

pkgname="resticprofile-bin"
gives="resticprofile"
pkgver="0.31.0"
arch=('amd64' 'arm64' 'armhf' 'i386' 'mips64el' 'ppc64el' 'riscv64' 's390x')
depends=("restic")
sha256sums_amd64=("bcff7fa42b032f908eb20a0c3d65bc80e78cae05a33ab02a799f94391db7de2e")
sha256sums_arm64=("4a0b8ea222d20502d81c8d957114340727f3b49f0e3ffa56c12bed040379b44f")
sha256sums_armhf=("395910b7aaf60209feabe4c9c475c831d41304303778dff37d5687aea7e5a3a7")
sha256sums_i386=("efb171289627e5aa4e8741394649e1d52fd6c34d884c5b034f0cae057e2d1453")
sha256sums_mips64el=("2d89781d4cd7b421d8581932a641f4e063761c7ee20b7bfc28f5f08dff661097")
sha256sums_ppc64el=("fc7d49319ddc45aee5c8d95cdca711a6975c831d30821b784fd6418579aefd22")
sha256sums_riscv64=("37fb859bbb6f4879ad36bda88cd2e8118d2c6286c2cecd1d41c846b51ac60b46")
sha256sums_s390x=("3454ca0c209f2098fee937542cfd60999fdcc2d5e4d662c7cd44a1805fc0dff4")
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

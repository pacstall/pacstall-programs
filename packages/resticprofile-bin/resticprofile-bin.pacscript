pkgname="resticprofile-bin"
gives="resticprofile"
pkgver="0.33.1"
arch=('amd64' 'arm64' 'armhf' 'i386' 'ppc64el' 'riscv64' 's390x')
depends=("restic")
sha256sums_amd64=("5fecd20de21811a750a4d61e841b2258fdf018bbfffad136c96078df27b452df")
sha256sums_arm64=("0d547cc0c34a83a8c1d884271a70340da90fe8750ac4a2d7de8ed7aa1d9bb9c7")
sha256sums_armhf=("9b53976f2468e04866317b25af5f63020f014e149e7b3f011fde51a9ca49a8b4")
sha256sums_i386=("1728005c3cec76e652eaf59414f80500250ffe241ebe3c403c645f6c9a8766aa")
sha256sums_ppc64el=("16ea60d9bde6933edf66a6e7fec73828e4d679183b5e6f113e3199756a14afc0")
sha256sums_riscv64=("884a7bb9940d6ec358b18e5e942d41caab08867640a85ae3fb6b66c6495d5a51")
sha256sums_s390x=("da175970b7a5a3894cfbf71ec74222d580761ac2ff3220a5c5c64d11225807bf")
source_amd64=("https://github.com/creativeprojects/resticprofile/releases/download/v${pkgver}/resticprofile_${pkgver}_linux_amd64.tar.gz")
source_arm64=("https://github.com/creativeprojects/resticprofile/releases/download/v${pkgver}/resticprofile_${pkgver}_linux_arm64.tar.gz")
source_armhf=("https://github.com/creativeprojects/resticprofile/releases/download/v${pkgver}/resticprofile_${pkgver}_linux_armv7.tar.gz")
source_i386=("https://github.com/creativeprojects/resticprofile/releases/download/v${pkgver}/resticprofile_${pkgver}_linux_386.tar.gz")
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

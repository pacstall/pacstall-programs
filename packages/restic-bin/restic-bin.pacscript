pkgname="restic-bin"
gives="restic"
pkgver="0.16.4"
arch=('amd64' 'arm64' 'armhf' 'i386' 'mips64el' 'ppc64el' 'riscv64' 's390x')
sha256sums_amd64=("3d4d43c169a9e28ea76303b1e8b810f0dcede7478555fdaa8959971ad499e324")
sha256sums_arm64=("9d2f44538ea0c6309426cb290d3a6b8b0b85de5de7f1496ff40c843b36bf8a8d")
sha256sums_arm=("c4677e4eaf38ceda97841c8cae883883e026751970b41bb1a3f5e0610e07a5b1")
sha256sums_i386=("d40270cb6d23e194a1ecb483a41ed42d9edf803b6c207b7599ff5813036f5e5e")
sha256sums_mips64el=("4b2335364a62f3268581e6343b3b9243fa89ef6a48ca9b24ea2db1a949e91156")
sha256sums_ppc64el=("96fc55faff503465ff38e6bbbb21fc6365f11b52756d0b82db3a52b3f5487af7")
sha256sums_riscv64=("24125fd40e20be4c607e7ff58bdce302473460f5d31cba9172cdff2946878d1f")
sha256sums_s390x=("b168ad78533011155648042d2900398596b0b128d12aeab2314424eb8be06794")
source_amd64=("https://github.com/restic/restic/releases/download/v${pkgver}/restic_${pkgver}_linux_amd64.bz2")
source_arm64=("https://github.com/restic/restic/releases/download/v${pkgver}/restic_${pkgver}_linux_arm64.bz2")
source_arm=("https://github.com/restic/restic/releases/download/v${pkgver}/restic_${pkgver}_linux_arm.bz2")
source_i386=("https://github.com/restic/restic/releases/download/v${pkgver}/restic_${pkgver}_linux_i386.bz2")
source_mips64el=("https://github.com/restic/restic/releases/download/v${pkgver}/restic_${pkgver}_linux_mips64le.bz2")
source_ppc64el=("https://github.com/restic/restic/releases/download/v${pkgver}/restic_${pkgver}_linux_ppc64le.bz2")
source_riscv64=("https://github.com/restic/restic/releases/download/v${pkgver}/restic_${pkgver}_linux_riscv64.bz2")
source_s390x=("https://github.com/restic/restic/releases/download/v${pkgver}/restic_${pkgver}_linux_s390x.bz2")
optdepends=('fuse: mount archive support')
pkgdesc="Fast, secure, efficient backup program"
url='https://github.com/restic/restic'
maintainer=("Eric Renfro <psi-jack@linux-help.org>")

package() {
  install -Dm755 "${gives}_${pkgver}_linux_${CARCH}" "${pkgdir}/usr/bin/${gives}"
}

# vim:set ft=sh ts=2 sw=2 et:

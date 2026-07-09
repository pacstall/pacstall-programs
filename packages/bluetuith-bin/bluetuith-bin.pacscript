pkgname="bluetuith-bin"
gives="bluetuith"
repology=("project: ${pkgname}")
pkgver='0.2.7'
source_amd64=("https://github.com/bluetuith-org/bluetuith/releases/download/v${pkgver}/bluetuith_${pkgver}_Linux_x86_64.tar.gz")
source_i386=("https://github.com/bluetuith-org/bluetuith/releases/download/v${pkgver}/bluetuith_${pkgver}_Linux_i386.tar.gz")
source_arm64=("https://github.com/bluetuith-org/bluetuith/releases/download/v${pkgver}/bluetuith_${pkgver}_Linux_arm64.tar.gz")
source_arm=("https://github.com/bluetuith-org/bluetuith/releases/download/v${pkgver}/bluetuith_${pkgver}_Linux_armv7.tar.gz")
pkgdesc='TUI bluetooth manager for Linux'
sha256sums_amd64=('145888f0e3959d29832c7395403c2327e0f03b9591e4cdd3f712741cf0f934e9')
sha256sums_i386=('4d5577e3fa67f31951cb25137ce87b8ec3cb7ff17b78bbba9908f30126a046cb')
sha256sums_arm64=('45c001c0320306178c3fc17d0927b34c48886c4235b032ad9ca73f4b358c7237')
sha256sums_arm=('bc2a86074d76bda44736d9ff9fbb91bf07857b962a5843a028a69c5bb7cc6e80')
depends=('bluez' 'bluetooth' 'obexftp' 'bluez-tools')
arch=('amd64' 'i386' 'arm64' 'armhf')

package() {
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}

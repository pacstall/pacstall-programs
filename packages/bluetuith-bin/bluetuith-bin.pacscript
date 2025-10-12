pkgname="bluetuith-bin"
gives="bluetuith"
repology=("project: ${pkgname}")
pkgver='0.2.5'
source=("https://github.com/bluetuith-org/bluetuith/releases/download/v${pkgver}/bluetuith_${pkgver}_Linux_x86_64.tar.gz")
pkgdesc='TUI bluetooth manager for Linux'
sha256sums=('844211fb057ea2c4e6efd0b01bc21b5ec41c5b2db6af57819d19f04d44624af7')
depends=('bluez' 'bluetooth' 'obexftp' 'bluez-tools')
arch=('amd64')
maintainer=("aKqir24 <aKqir24@github.com>")

package() {
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}

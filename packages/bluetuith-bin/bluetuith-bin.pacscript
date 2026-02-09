pkgname="bluetuith-bin"
gives="bluetuith"
repology=("project: ${pkgname}")
pkgver='0.2.6'
source=("https://github.com/bluetuith-org/bluetuith/releases/download/v${pkgver}/bluetuith_${pkgver}_Linux_${AARCH}.tar.gz")
pkgdesc='TUI bluetooth manager for Linux'
sha256sums_amd64=('f206731d16c446ade39907dc88f961ed3ef07a12911cf7432a2b768aefa62717')
sha256sums_i386=('5feece622f7af5e86dcb4d6207f7b33499af9c7408d223fe59defc73af2d98f8')
sha256sums_arm64=('63af4aae960c1754f8931c9022d926a29e9da6f82269c181d1726aad61312d92')
depends=('bluez' 'bluetooth' 'obexftp' 'bluez-tools')
arch=('amd64' 'i386' 'arm64')
maintainer=("aKqir24 <aKqir24@github.com>")

package() {
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}

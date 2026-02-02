pkgname="bluetuith-bin"
gives="bluetuith"
repology=("project: ${pkgname}")
pkgver='0.2.6'
source=("https://github.com/bluetuith-org/bluetuith/releases/download/v${pkgver}/bluetuith_${pkgver}_Linux_${AARCH}.tar.gz")
pkgdesc='TUI bluetooth manager for Linux'
sha256sums=(
  'f206731d16c446ade39907dc88f961ed3ef07a12911cf7432a2b768aefa62717'
  '5feece622f7af5e86dcb4d6207f7b33499af9c7408d223fe59defc73af2d98f8'
  '63af4aae960c1754f8931c9022d926a29e9da6f82269c181d1726aad61312d92'
  'dc48b9e1edbae8358db940ad5972e902a509996fbd66c9d4619adab5b3e4a681'
  '317b3ddffd4f368b5bdf0bf6f5e80995d7a77b985415d2b8bc35444b6314e0d4'
  'f443c29f465b2dc655becbc1e258c2525ad080bb2b390c2e2cf5b3e407df6629'

)
depends=('bluez' 'bluetooth' 'obexftp' 'bluez-tools')
arch=('amd64' 'i386' 'arm64')
maintainer=("aKqir24 <aKqir24@github.com>")

package() {
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}

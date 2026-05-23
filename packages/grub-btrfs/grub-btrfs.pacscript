pkgname="grub-btrfs"
arch=("any")
pkgver="4.14"
pkgdesc='Include btrfs snapshots at boot options'
url='https://github.com/Antynea/grub-btrfs'
license=('GPL-3.0-only')
depends=('btrfs-progs' 'grub2-common')
optdepends=(
  'snapper: For snapper support'
  'inotify-tools: For grub-btrfsd daemon'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('361fabb41e603f84af096925db7498e24ff68436b9f32cc6d1fe81dd4db58826d02052181d577b6484290016c11009d0b138c4187fcedb76848ef7a52b55222f')
maintainer=("Eric Renfro <psi-jack@linux-help.org>" "Tianyu Lu <tianyu@lu.fm>")

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" GRUB_UPDATE_EXCLUDE=true install
}

# vim:set ts=2 sw=2 et:

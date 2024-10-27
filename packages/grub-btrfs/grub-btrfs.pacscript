pkgname="grub-btrfs"
arch=("any")
pkgver="4.13"
pkgdesc='Include btrfs snapshots in GRUB boot options'
url='https://github.com/Antynea/grub-btrfs'
license=('GPL-3.0-only')
depends=('btrfs-progs' 'grub2-common')
optdepends=(
  'snapper: For snapper support'
  'inotify-tools: For grub-btrfsd daemon'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
b2sums=('e2f11a0a8282e3ec8ff8223e3bad70b5d5c5e81b4d740a1bf3554db412dbe48a8a0f216f4e6c65ae1d11c01a27b8b92bae9b470c60d2389505ce089511536e1a')
maintainer=("Eric Renfro <psi-jack@linux-help.org")

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" GRUB_UPDATE_EXCLUDE=true install
}

# vim:set ts=2 sw=2 et:

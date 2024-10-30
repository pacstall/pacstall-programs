pkgname="snapper-rollback-git"
gives="snapper-rollback"
arch=("any")
pkgver="1.0"
pkgdesc='Rollback snapper snapshots
https://wiki.archlinux.org/index.php/Snapper#Suggested_filesystem_layout'
license=('GPL-3.0-only')
url='https://github.com/jrabinow/snapper-rollback'
depends=('coreutils' 'python3' 'btrfs-progs' 'python3-btrfsutil')
makedepends=('git')
provides=('snapper-rollback')
install=snapper-rollback.install
source=("https://github.com/jrabinow/snapper-rollback.git")
sha256sums=('SKIP')
maintainer=("Eric Renfro <psi-jack@linux-help.org>")

package() {
  cd "${gives}"
  install -Dm644 "snapper-rollback.conf" -t "${pkgdir}/etc/"
  install -Dm755 "snapper-rollback.py" "${pkgdir}/usr/sbin/snapper-rollback"
}

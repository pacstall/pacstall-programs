pkgname="btrfs-assistant"
pkgver="2.1.1"
pkgdesc="Manage BTRFS subvolumes and snapper snapshots"
arch=('amd64' 'arm64')
url='https://gitlab.com/btrfs-assistant/btrfs-assistant'
license=('GPL-3.0-only')
depends=('libqt6svg6' 'fonts-noto' 'pkexec' 'util-linux' 'btrfs-progs' 'diffutils')
optdepends=(
  'snapper: BtrFS Snapshots'
  'btrfsmaintenance: BtrFS Maintenance'
)
makedepends=('git' 'cmake' 'g++' 'fonts-noto' 'qt6-tools-dev' 'qt6-svg-dev' 'libbtrfs-dev' 'libbtrfsutil-dev' 'pkexec')
incompatible=('debian:buster' 'debian:bullseye' 'ubuntu:bionic' 'ubuntu:focal')
backup=(etc/btrfs-assistant.conf)
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('cabc3824651606bd37db1809d7d2eeeaa724180d138613bff3490362751b9594')
maintainer=("Eric Renfro <psi-jack@linux-help.org")

build() {
  cd "${srcdir}"
  cmake -B build -S "${pkgname}-${pkgver}" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE='Release'
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}

# vim:set ft=sh ts=2 sw=2 et:

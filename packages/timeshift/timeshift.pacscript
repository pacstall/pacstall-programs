name="timeshift"
repology=("project: timeshift")
pkgver="22.11.2"
maintainer="Paul Cosma (saenai) <paul.cosma97@gmail.com>"
url="https://github.com/linuxmint/timeshift/archive/refs/tags/${pkgver}.zip"
hash="7a8b8a328272cbfd9b33364d578cdf10fb1b7c2b9a73f97fcde0d903fef2d42e"
makedepends=("debhelper" "autotools-dev" "gzip" "valac" "libgtk-3-dev" "libgee-0.8-dev" "libjson-glib-dev" "libvte-2.91-dev")
depends=("rsync" "btrfs-progs")
breaks=("${name}-git" "${name}-deb" "${name}-bin" "${name}-app")
replace=("timeshift-btrfs")
pkgdesc="Timeshift is a system restore utility which takes snapshots of the system at regular intervals. These snapshots can be restored at a later date to undo system changes. Creates incremental snapshots using rsync or BTRFS snapshots using BTRFS tools."

build() {
  make -j"${NCPU}" all
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}

pkgname="timeshift"
repology=("project: timeshift")
arch=("any")
pkgver="24.06.6"
pkgrel="2"
maintainer=("Paul Cosma (saenai) <paul.cosma97@gmail.com>")
source=("@${pkgname}~${pkgver}::https://github.com/linuxmint/timeshift/archive/refs/tags/${pkgver}.zip")
sha256sums=("775e30bb6c5eaa8741c1aabbd4a5a06c7964c4bff14ee680be87bb8484761391")
makedepends=("debhelper" "autotools-dev" "gzip" "valac" "libgtk-3-dev" "libgee-0.8-dev" "libjson-glib-dev" "libvte-2.91-dev" "libxapp-dev" "meson" "ninja-build" "help2man")
depends=("rsync" "btrfs-progs")
breaks=("${pkgname}-git" "${pkgname}-deb" "${pkgname}-bin" "${pkgname}-app")
replaces=("timeshift-btrfs")
pkgdesc="System restore utility that takes snapshots at regular intervals using rsync or BTRFS."

build() {
  cd "${pkgname}~${pkgver}"
  meson setup build
  ninja -C build -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
  # FIX: workaround broken pkexec usage from upstream
  #
  # shellcheck disable=2016
  sed -i 's/pkexec \${app/pkexec env DISPLAY=\$DISPLAY XAUTHORITY=\$XAUTHORITY \${app/g' "${pkgdir}/usr/local/bin/timeshift-launcher"
}

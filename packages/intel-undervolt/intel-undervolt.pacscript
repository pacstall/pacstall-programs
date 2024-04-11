pkgname="intel-undervolt"
pkgver="1.7"
source=("https://github.com/kitsunyan/intel-undervolt/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("29a7ebaee4830d65d0b5cefa6d497887d4f23f34659876dfe944f3a020cf33ff")
makedepends=("pkg-config")
maintainer=("Elsie19 <elsie19@pm.me>")
pkgdesc="Tool for undervolting and throttling limits alteration for Intel CPUs"

prepare() {
  cd "${_archive}"
  # other flags are '--enable-systemd', '--enable-slogind', '--enable-openrc'
  ./configure
}

build() {
  cd "${_archive}"
  make -j"${NCPU}"
}

package() {
  cd "${_archive}"
  make install DESTDIR="${pkgdir}"
}

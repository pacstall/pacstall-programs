pkgname="intel-undervolt"
arch=("any")
pkgver="1.7"
source=("@${pkgname}~${pkgver}::https://github.com/kitsunyan/intel-undervolt/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("29a7ebaee4830d65d0b5cefa6d497887d4f23f34659876dfe944f3a020cf33ff")
makedepends=("pkg-config")
maintainer=("Elsie19 <elsie19@pm.me>")
pkgdesc="Tool for undervolting and throttling limits alteration for Intel CPUs"

prepare() {
  cd "${pkgname}~${pkgver}"
  # other flags are '--enable-systemd', '--enable-slogind', '--enable-openrc'
  ./configure
}

build() {
  cd "${pkgname}~${pkgver}"
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  make install DESTDIR="${pkgdir}"
}

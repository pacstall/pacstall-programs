pkgname="htop"
gives="htop"
arch=("any")
pkgver="3.4.1"
source=("@${pkgname}~${pkgver}::https://github.com/htop-dev/htop/archive/refs/tags/${pkgver}.tar.gz")
makedepends=("dh-autoreconf" "libncurses5-dev" "libncursesw5-dev")
replaces=("htop")
pkgdesc="htop is a cross-platform interactive process viewer."
sha256sums=("af9ec878f831b7c27d33e775c668ec79d569aa781861c995a0fbadc1bdb666cf")
prepare() {
  cd "${pkgname}~${pkgver}"
  ./autogen.sh
  ./configure
}

build() {
  cd "${pkgname}~${pkgver}"
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  make install DESTDIR="${pkgdir}"
  install -Dm755 htop.desktop -t "${pkgdir}/usr/share/applications"
}

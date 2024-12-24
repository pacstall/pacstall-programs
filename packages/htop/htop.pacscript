pkgname="htop"
gives="htop"
arch=("any")
pkgver="3.2.2"
source=("@${pkgname}~${pkgver}::https://github.com/htop-dev/htop/archive/refs/tags/${pkgver}.tar.gz")
makedepends=("dh-autoreconf" "libncurses5-dev" "libncursesw5-dev")
replaces=("htop")
pkgdesc="htop is a cross-platform interactive process viewer."
sha256sums=("3829c742a835a0426db41bb039d1b976420c21ec65e93b35cd9bfd2d57f44ac8")
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

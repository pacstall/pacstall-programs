pkgname="htop"
gives="htop"
arch=("any")
pkgver="3.5.2"
source=("@${pkgname}~${pkgver}::https://github.com/htop-dev/htop/archive/refs/tags/${pkgver}.tar.gz")
makedepends=("dh-autoreconf" "libncurses5-dev" "libncursesw5-dev")
replaces=("htop")
pkgdesc="htop is a cross-platform interactive process viewer."
sha256sums=("a66a62bbd1eba59889c68f868b643e53320eea93da19f43ba13c822a826d82ba")
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

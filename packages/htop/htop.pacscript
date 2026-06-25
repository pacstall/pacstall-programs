pkgname="htop"
gives="htop"
arch=("any")
pkgver="3.5.1"
source=("@${pkgname}~${pkgver}::https://github.com/htop-dev/htop/archive/refs/tags/${pkgver}.tar.gz")
makedepends=("dh-autoreconf" "libncurses5-dev" "libncursesw5-dev")
replaces=("htop")
pkgdesc="htop is a cross-platform interactive process viewer."
sha256sums=("dfc4a09845e9bc86f466a722e62b8f87d59028ff39689077ff2257a6a605061d")
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

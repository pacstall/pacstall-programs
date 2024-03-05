name="htop"
pkgname="htop"
pkgver="3.2.2"
source=("https://github.com/htop-dev/htop/archive/refs/tags/${pkgver}.tar.gz")
makedepends=("dh-autoreconf" "libncurses5-dev" "libncursesw5-dev")
replaces=("htop")
pkgdesc="htop is a cross-platform interactive process viewer."
hash=("3829c742a835a0426db41bb039d1b976420c21ec65e93b35cd9bfd2d57f44ac8")
prepare() {
  ./autogen.sh
  ./configure
}

build() {
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
  sudo install -Dm755 htop.desktop -t "${pkgdir}/usr/share/applications"
}

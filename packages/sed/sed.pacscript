pkgname="sed"
arch=("any")
pkgver="4.9"
source=("@${pkgname}~${pkgver}::https://ftp.gnu.org/gnu/sed/sed-${pkgver}.tar.xz")
makedepends=("autoconf" "automake")
depends=("libselinux1" "libc6" "libacl1")
replaces=("sed")
pkgdesc="sed (stream editor) is a non-interactive command-line text editor."
sha256sums=("6e226b732e1cd739464ad6862bd1a1aba42d7982922da7a53519631d24975181")

build() {
  cd "${pkgname}~${pkgver}"
  ./configure
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  make install DESTDIR="${pkgdir}"
}

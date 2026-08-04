pkgname="sed"
arch=("any")
pkgver="4.10"
source=("@${pkgname}~${pkgver}::https://ftp.gnu.org/gnu/sed/sed-${pkgver}.tar.xz")
makedepends=("autoconf" "automake")
depends=("libselinux1" "libc6" "libacl1")
replaces=("sed")
pkgdesc="sed (stream editor) is a non-interactive command-line text editor."
sha256sums=("b8e72182b2ec96a3574e2998c47b7aaa64cc20ce000d8e9ac313cc07cecf28c7")

build() {
  cd "${pkgname}~${pkgver}"
  ./configure
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  make install DESTDIR="${pkgdir}"
}

pkgname="sed"
pkgver="4.8"
source=("https://ftp.gnu.org/gnu/sed/sed-${pkgver}.tar.xz")
makedepends=("autoconf" "automake")
depends=("libselinux1" "libc6" "libacl1")
replaces=("sed")
pkgdesc="sed (stream editor) is a non-interactive command-line text editor."
sha256sums=("f79b0cfea71b37a8eeec8490db6c5f7ae7719c35587f21edb0617f370eeff633")

build() {
  cd "${_archive}"
  ./configure
  make -j"${NCPU}"
}

package() {
  cd "${_archive}"
  make install DESTDIR="${pkgdir}"
}

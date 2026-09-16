pkgname="fetch-git"
gives="fetch"
pkgdesc="Animated 3D fetch tool for your terminal"
url='https://github.com/areofyl/fetch'
maintainer=("CiccioBro17 <203853964+CiccioBro17@users.noreply.github.com>")
pkgver="2.3.0"
arch=("any")
license=('ISC')
source=("git+https://github.com/areofyl/fetch.git")
makdepends=(
  "make"
  "gcc"
)

build() {
  make -C "${srcdir}/fetch" "-j${NCPU}"
}

package() {
  make DESTDIR="${pkgdir}" -C "${srcdir}/fetch" install
}

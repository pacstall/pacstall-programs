pkgname="fetch-git"
gives="fetch"
pkgdesc="Animated 3D fetch tool for your terminal"
url='https://github.com/areofyl/fetch'
pkgver="0.r0"
arch=("any")
source=("git+https://github.com/areofyl/fetch.git")
makdepends=(
  "make"
  "gcc"
)

build() {
  cd "${srcdir}/fetch"
  make
}

package() {
  cd "${srcdir}/fetch"

  make DESTDIR="${pkgdir}" install
}

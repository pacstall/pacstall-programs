pkgname="pap"
pkgver="0.15.0"
source=("https://github.com/talwat/pap/archive/v${pkgver}.tar.gz")
pkgdesc="Swiss army knife for minecraft servers"
maintainer=("Talwat <talwat321@gmail.com>")
makedepends=("golang-go")
sha256sums=("743fd7d6d8f6e5fcd198ee75fcc54fd77ce272c77009cfa2c28c0eb6aec5121c")
incompatible=('debian:bullseye')
repology=("project: ${pkgname}")

build() {
  cd "${_archive}"
  make -j"${NCPU}"
}

package() {
  cd "${_archive}"
  make install PREFIX="${pkgdir}/usr"
}

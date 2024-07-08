pkgname="hwinfo-git"
gives="hwinfo"
pkgver="21.82"
pkgdesc="hwinfo/libhd are used to probe for the hardware present in the system (git version)"
arch=('amd64')
url='https://github.com/openSUSE/hwinfo'
provides=("libhd")
depends=("libxml-parser-perl" "libxml-writer-perl")
makedepends=("flex" "uuid-dev" "libsysfs-dev")
if [[ ${CDISTRO#*:} != "trixie" ]]; then
  makedepends+=("libx86emu-dev")
  depends+=("libx86emu3")
else
  pacdeps=("libx86emu")
fi
source=("git+https://github.com/openSUSE/hwinfo.git")
sha256sums=('SKIP')
maintainer=("xdavius <xdavius@github.com>")

build() {
  cd "${srcdir}"/"${gives}"
  make
}

package() {
  cd "${srcdir}"/"${gives}"
  make install DESTDIR="${pkgdir}"
}

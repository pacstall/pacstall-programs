name="qt6pas"
gives="libqt6pas-dev"
pkgver="6.2.7"
_lazarus_tag="3_0"
_lazarus_version="3.0.0"
url="https://gitlab.com/freepascal.org/lazarus/lazarus/-/archive/lazarus_${_lazarus_tag}/lazarus-lazarus_${_lazarus_tag}.tar.bz2"
arch=("amd64")
makedepends=('qt6-base-dev' 'qmake6' 'libgl-dev')
provides=('libqt6pas1')
hash="053ebb9d703162617a6c5bbd26e78aacb45e439d9a9964aa3197eaada2aa8c2e"
pkgdesc="Free Pascal Qt6 binding library updated by lazarus IDE"
maintainer="Xdavius <xdavius@github.com>"

build() {
  cd "${srcdir}"/lcl/interfaces/qt6/cbindings
  qmake6
  make -j"${NCPU}"
}

package() {
  cd "${srcdir}"/lcl/interfaces/qt6/cbindings
  sudo make INSTALL_ROOT="${pkgdir}" install
}

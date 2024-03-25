Maintainer="BlackIkeEagle <ike DOT devolder AT gmail DOT com>"
name="qt6pas"
pkgname="qt6pas"
_lazarus_tag="3_0"
_lazarus_version="3.0.0"
pkgver="6.2.7"
pkgrel="1"
pkgdesc="Free Pascal Qt6 binding library updated by lazarus IDE"
arch="amd64"
homepage="https://gitlab.com/freepascal.org/lazarus/lazarus/-/tree/main/lcl/interfaces/qt6/cbindings"
license=('LGPL3')
makedepends=('qt6-base-dev' 'qmake6' 'libgl-dev')
gives="libqt6pas6-dev"
provides="libqt6pas6"
options=(libtool staticlibs)
url="https://gitlab.com/freepascal.org/lazarus/lazarus/-/archive/lazarus_${_lazarus_tag}/lazarus-lazarus_${_lazarus_tag}.tar.bz2"
hash="053ebb9d703162617a6c5bbd26e78aacb45e439d9a9964aa3197eaada2aa8c2e"

build() {
    cd "${srcdir}"/lcl/interfaces/qt6/cbindings
    qmake6
    make -j"${NCPU}"
}

package() {
    cd "${srcdir}"/lcl/interfaces/qt6/cbindings
    sudo make INSTALL_ROOT="${pkgdir}" install
}

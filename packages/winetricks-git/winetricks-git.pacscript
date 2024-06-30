pkgname="winetricks-git"
gives="winetricks"
breaks=("${gives}-deb" "${gives}-bin" "${gives}-app" "${gives}")
pkgver="20240105"
pkgdesc="Winetricks is an easy way to work around problems in Wine"
url="https://github.com/Winetricks/winetricks"
source=("https://github.com/Winetricks/winetricks.git")
sha512sums=('SKIP')
buildeps=("make")
maintainer=("Xdavius <xdavius@github.com>")

package() {
  cd "${_archive}"
  make install DESTDIR=${pkgdir}
}

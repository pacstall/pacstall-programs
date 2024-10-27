pkgname="winetricks-git"
gives="winetricks"
breaks=("${gives}-deb" "${gives}-bin" "${gives}-app" "${gives}")
arch=("any")
pkgver="20240105"
pkgdesc="Winetricks is an easy way to work around problems in Wine"
url='https://github.com/Winetricks/winetricks'
source=("https://github.com/Winetricks/winetricks.git")
sha512sums=('SKIP')
makedepends=("make")
maintainer=("xdavius <xdavius@github.com>")
repology=("project: winetricks")

package() {
  cd "${gives}"
  make install DESTDIR="${pkgdir}"
}

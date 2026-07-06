pkgname="rhino-pkg-git"
gives="${pkgname%-git}"
source=("https://github.com/rhino-linux/rhino-pkg.git")
arch=("all")
pkgver="2.0.5"
makedepends=("make")
depends=("aptitude")
pacdeps=("nutext-bin")
pkgdesc="Rhino-pkg wrapper script"
maintainer=("Elsie19 <elsie19@pm.me>" "Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${gives}"
  DESTDIR="${pkgdir}" make install
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/usr/bin/${gives}" "${pkgdir}/usr/bin/rpk"
}

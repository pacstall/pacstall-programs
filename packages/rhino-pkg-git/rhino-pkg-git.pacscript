pkgname="rhino-pkg-git"
gives="${pkgname%-git}"
source=("https://github.com/rhino-linux/rhino-pkg.git")
arch=("all")
pkgver="2.0.3"
makedepends=("make")
depends=("aptitude")
pacdeps=("nutext-bin")
pkgdesc="Rhino-pkg wrapper script"
maintainer=("Oren Klopfer <oren@taumoda.com>" "Elsie19 <elsie19@pm.me>")

package() {
  cd "${gives}"
  DESTDIR="${pkgdir}" make install
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/usr/bin/${gives}" "${pkgdir}/usr/bin/rpk"
}

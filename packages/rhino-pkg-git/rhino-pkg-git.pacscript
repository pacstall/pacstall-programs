pkgname="rhino-pkg-git"
source=("https://github.com/rhino-linux/rhino-pkg.git")
arch=("all")
pkgver="0.1.2"
pkgrel="2"
gives="rhino-pkg"
makedepends=("make" "gettext")
depends=("gettext")
pkgdesc="Rhino-pkg wrapper script"
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${gives}"
  DESTDIR="${pkgdir}" make install
  mkdir -p "${pkgdir}/usr/bin"
  install -Dm755 "${gives}" "${pkgdir}/usr/bin/${gives}"
  ln -sf "/usr/bin/${gives}" "${pkgdir}/usr/bin/rpk"
}

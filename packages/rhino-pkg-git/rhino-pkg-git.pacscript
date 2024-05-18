pkgname="rhino-pkg-git"
source=("https://github.com/rhino-linux/rhino-pkg.git")
pkgver="0.1.2"
gives="rhino-pkg"
makedepends=("make" "gettext")
depends=("gettext")
pkgdesc="Rhino-pkg wrapper script"
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${_archive}"
  DESTDIR="${pkgdir}" make install
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/usr/bin/rhino-pkg" "${pkgdir}/usr/bin/rpk"
}

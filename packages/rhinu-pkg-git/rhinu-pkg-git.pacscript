pkgname="rhinu-pkg-git"
gives="${pkgname%-git}"
source=("${gives}::https://github.com/rhino-linux/rhino-pkg.git#branch=nushell")
arch=("all")
pkgver="2.0.0"
makedepends=("make")
pacdeps=("nutext-bin")
pkgdesc="Rhino-pkg wrapper script - Nushell rewrite"
maintainer=("Oren Klopfer <oren@taumoda.com>" "Elsie19 <elsie19@pm.me>")

package() {
  cd "${gives}"
  DESTDIR="${pkgdir}" make install
  mkdir -p "${pkgdir}/usr/bin"
  install -Dm755 "rhino-pkg" "${pkgdir}/usr/bin/${gives}"
  ln -sf "/usr/bin/${gives}" "${pkgdir}/usr/bin/rpk2"
}

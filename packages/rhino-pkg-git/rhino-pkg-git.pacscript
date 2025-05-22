pkgname="rhino-pkg-git"
source=("https://github.com/rhino-linux/rhino-pkg.git#branch=nushell")
arch=("all")
pkgver="2.0.0"
gives="rhino-pkg"
makedepends=("make")
pacdeps=("nutext-bin")
pkgdesc="Rhino-pkg wrapper script"
maintainer=("Oren Klopfer <oren@taumoda.com>" "Elsie19 <elsie19@pm.me>")

package() {
  cd "${gives}"
  DESTDIR="${pkgdir}" make install
  mkdir -p "${pkgdir}/usr/bin"
  install -Dm755 "${gives}" "${pkgdir}/usr/bin/${gives}"
  ln -sf "/usr/bin/${gives}" "${pkgdir}/usr/bin/rpk"
}

pkgname="rhino-plymouth-theme-git"
gives="rhino-plymouth-theme"
maintainer=("Oren Klopfer <oren@taumoda.com>")
pkgdesc="Rhino Linux Plymouth theme"
source=("https://github.com/rhino-linux/plymouth.git")
arch=("all")
provides=("plymouth-theme")
pkgver="0.0.1"
pkgrel="2"

package() {
  cd "plymouth"
  install -Dm644 ./* -t "${pkgdir}/usr/share/plymouth/themes/rhino-spinner/"
}

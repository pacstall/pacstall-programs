name="rhino-plymouth-theme-git"
gives="rhino-plymouth-theme"
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgdesc="Rhino Linux Plymouth theme"
source=("https://github.com/rhino-linux/plymouth.git")
pkgver="0.0.1"

package() {
  sudo install -Dm644 ./* -t "${pkgdir}/usr/share/plymouth/themes/rhino-spinner/"
}

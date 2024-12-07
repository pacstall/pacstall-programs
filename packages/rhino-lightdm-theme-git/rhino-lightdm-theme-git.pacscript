pkgname="rhino-lightdm-theme-git"
gives="rhino-lightdm-theme"
maintainer=("Oren Klopfer <oren@taumoda.com>")
pkgdesc="Rhino Linux Lightdm theme"
source=("https://github.com/rhino-linux/lightdm.git")
arch=("all")
pkgver="0.0.1"

package() {
  cd "lightdm"
  install -Dm644 rhino-blur.png -t "${pkgdir}/usr/share/pixmaps/"
  install -Dm644 lightdm-gtk-greeter.conf -t "${pkgdir}/etc/lightdm/"
}

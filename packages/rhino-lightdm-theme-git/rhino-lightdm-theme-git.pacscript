name="rhino-lightdm-theme-git"
gives="rhino-lightdm-theme"
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgdesc="Rhino Linux Lightdm theme"
source=("https://github.com/rhino-linux/lightdm.git")
pkgver="0.0.1"

package() {
  sudo install -Dm644 rhino-blur.png -t "${pkgdir}/usr/share/pixmaps/"
  sudo install -Dm644 lightdm-gtk-greeter.conf -t "${pkgdir}/etc/lightdm/"
}

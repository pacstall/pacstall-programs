name="rhino-lightdm-theme-git"
gives="rhino-lightdm-theme"
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgdesc="Rhino Linux Lightdm theme"
url="https://github.com/rhino-linux/lightdm.git"
pkgver="0.0.1"
pkgver() {
  git ls-remote "${url}" main | cut -f1 | cut -c1-8
}

package() {
  sudo install -Dm644 rhino-blur.png -t "${pkgdir}/usr/share/pixmaps/"
  sudo install -Dm644 lightdm-gtk-greeter.conf -t "${pkgdir}/etc/lightdm/"
}

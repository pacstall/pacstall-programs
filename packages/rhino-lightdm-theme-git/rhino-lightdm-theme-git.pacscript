name="rhino-lightdm-theme-git"
gives="rhino-lightdm-theme"
maintainer="Henryws <hwengerstickel@pm.me>"
description="Rhino Linux Lightdm theme"
url="https://github.com/rhino-linux/lightdm.git"
pkgver() {
  git ls-remote "${url}" main | cut -f1 | cut -c1-8
}
version="$(pkgver)"

install() {
  sudo install -Dm644 rhino-blur.png -t "${pkgdir}/usr/share/pixmaps/"
  sudo install -Dm644 lightdm-gtk-greeter.conf -t "${pkgdir}/etc/lightdm/"
}

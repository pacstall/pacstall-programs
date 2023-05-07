name="rhino-lightdm-theme-git"
gives="rhino-lightdm-theme"
maintainer="Henryws <hwengerstickel@pm.me>"
description="Rhino Linux Lightdm theme"
url="https://github.com/rhino-linux/lightdm.git"
pkgver() {
  git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b main .
}
version="$(pkgver)"

install() {
  sudo install -Dm644 rhino-blur.png -t "${pkgdir}/usr/share/pixmaps/"
  sudo install -Dm644 lightdm-gtk-greeter.conf -t "${pkgdir}/etc/lightdm/"
}

name="rhino-lightdm-theme-git"
gives="rhino-lightdm-theme"
maintainer="Henryws <hwengerstickel@pm.me>"
description="Rhino Linux Lightdm theme"
url="https://github.com/rhino-linux/lightdm.git"
pkgver() {
  sudo mkdir tempcount && sudo chown "${PACSTALL_USER}" tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b main . && git log --format=%ct.%h && sudo rm -r ../tempcount && cd ..
}
version="$(pkgver)"

install() {
  sudo install -Dm644 rhino-blur.png -t "${pkgdir}/usr/share/pixmaps/"
  sudo install -Dm644 lightdm-gtk-greeter.conf -t "${pkgdir}/etc/lightdm/"
}

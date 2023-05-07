name="rhino-plymouth-theme-git"
gives="rhino-plymouth-theme"
maintainer="Henryws <hwengerstickel@pm.me>"
description="Rhino Linux Plymouth theme"
url="https://github.com/rhino-linux/plymouth.git"
pkgver() {
  sudo mkdir tempcount && sudo chown "${PACSTALL_USER}" tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b main . && git log --format=%ct.%h && sudo rm -r ../tempcount && cd ..
}
version="$(pkgver)"

install() {
  sudo install -Dm644 ./* -t "${pkgdir}/usr/share/plymouth/themes/rhino-spinner/"
}

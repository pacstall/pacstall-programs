name="rhino-plymouth-theme-git"
gives="rhino-plymouth-theme"
maintainer="Henryws <hwengerstickel@pm.me>"
description="Rhino Linux Plymouth theme"
url="https://github.com/rhino-linux/plymouth.git"
pkgver() {
  mkdir /tmp/count/ && cd /tmp/count && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b main . && git log --format=%ct.%h && rm -r /tmp/count/
}
version="$(pkgver)"

install() {
  sudo install -Dm644 ./* -t "${pkgdir}/usr/share/plymouth/themes/rhino-spinner/"
}

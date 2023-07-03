name="rhino-plymouth-theme-git"
gives="rhino-plymouth-theme"
maintainer="Elsie19 <hwengerstickel@pm.me>"
description="Rhino Linux Plymouth theme"
url="https://github.com/rhino-linux/plymouth.git"
pkgver() {
  git ls-remote "${url}" main | cut -f1 | cut -c1-8
}
version="$(pkgver)"

package() {
  sudo install -Dm644 ./* -t "${pkgdir}/usr/share/plymouth/themes/rhino-spinner/"
}

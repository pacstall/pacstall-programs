name="bes2600-firmware-git"
gives="bes2600-firmware"
pkgver="0.0.1"
pkgdesc="firmware files for BES2600 WLAN/BT combo chip"
url="https://gitlab.com/pine64-org/bes2600-firmware.git"
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgver() {
  git ls-remote "${url}" main | cut -f1 | cut -c1-8
}

package() {
  sudo install firmware -t "${pkgdir}/usr/lib/firmware"
}


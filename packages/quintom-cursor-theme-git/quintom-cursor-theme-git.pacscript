name="quintom-cursor-theme-git"
gives="quintom-cursor-theme"
url="https://gitlab.com/Burning_Cube/quintom-cursor-theme.git"
description="A cursor theme designed to look decent"
maintainer="Henryws <hwengerstickel@pm.me>"

pkgver() {
  mkdir /tmp/count/ && cd /tmp/count && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && rm -r /tmp/count/
}
version="$(pkgver)"

install() {
  sudo mkdir -p "${pkgdir}/usr/share/icons"
  sudo cp -r 'Quintom_Ink Cursors/Quintom_Ink' "${pkgdir}/usr/share/icons"
  sudo cp -r 'Quintom_Snow Cursors/Quintom_Snow' "${pkgdir}/usr/share/icons"
}

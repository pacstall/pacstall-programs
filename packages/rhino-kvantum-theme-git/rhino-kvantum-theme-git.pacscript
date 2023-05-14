name="rhino-kvantum-theme-git"
gives="rhino-kvantum-theme"
depends=("qt5-style-kvantum")
maintainer="Henryws <hwengerstickel@pm.me>"
description="Rhino Linux Kvantum theme"
url="https://github.com/rhino-linux/KvRhino.git"
pkgver() {
  mkdir /tmp/count/ && cd /tmp/count && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b main . && git log --format=%ct.%h && rm -r /tmp/count/
}
version="$(pkgver)"

install() {
  sudo mkdir -p "${pkgdir}/etc/skel/.config/Kvantum"
  sudo mv KvRhino{,Dark} "${pkgdir}/etc/skel/.config/Kvantum"
}

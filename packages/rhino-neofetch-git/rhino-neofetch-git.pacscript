name="rhino-neofetch-git"
url="https://github.com/oklopfer/neofetch-rhino.git"
gives="rhino-neofetch"
provides=('neofetch')
replace=("neofetch")
description="neofetch branded for Rhino Linux"
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgver() {
  mkdir /tmp/count/ && cd /tmp/count && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && rm -r /tmp/count/
}
version="$(pkgver)"

install() {
  sudo DESTDIR="${pkgdir}" make install
}

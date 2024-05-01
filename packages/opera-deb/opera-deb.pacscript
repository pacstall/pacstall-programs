maintainer=("Oren Klopfer <oren@taumoda.com>")
pkgname="opera-deb"
gives="opera-stable"
replaces=("${gives}")
pkgver="106.0.4998.52"
source=("https://deb.opera.com/opera/pool/non-free/o/opera-stable/${gives}_${pkgver}_amd64.deb")
pkgdesc="Multi-platform web browser developed by its namesake company Opera"
sha256sums=("2539ca8caf9c70c01e7ff559b83a564be1450eaea5a257a7d2995c91c3c0fbdc")
arch=('amd64')
repology=("project: opera")

# vim:set ft=sh ts=2 sw=2 et:

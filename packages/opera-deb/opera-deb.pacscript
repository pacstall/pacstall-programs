maintainer=("Oren Klopfer <oren@taumoda.com>")
pkgname="opera-deb"
gives="opera-stable"
replaces=("${gives}")
pkgver="118.0.5461.60"
source=("https://deb.opera.com/opera/pool/non-free/o/opera-stable/${gives}_${pkgver}_amd64.deb")
pkgdesc="Multi-platform web browser developed by its namesake company Opera"
sha256sums=("480a55aab31e3aba70f460ccc01829c4c7d280c5c94b5615d9b3f1f8a5c163fe")
arch=('amd64')
repology=("project: opera")

# vim:set ft=sh ts=2 sw=2 et:

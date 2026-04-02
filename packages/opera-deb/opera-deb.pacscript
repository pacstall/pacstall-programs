maintainer=("Oren Klopfer <oren@taumoda.com>")
pkgname="opera-deb"
gives="opera-stable"
replaces=("${gives}")
pkgver="127.0.5778.76"
source=("https://deb.opera.com/opera/pool/non-free/o/opera-stable/${gives}_${pkgver}_amd64.deb")
pkgdesc="Multi-platform web browser developed by its namesake company Opera"
sha256sums=("06bfd8c3f52f0a9f9f383eb263a5507713b5690af9646304b5e3cd61446daa9d")
arch=('amd64')
repology=("project: opera")

# vim:set ft=sh ts=2 sw=2 et:

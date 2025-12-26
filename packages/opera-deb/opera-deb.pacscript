maintainer=("Oren Klopfer <oren@taumoda.com>")
pkgname="opera-deb"
gives="opera-stable"
replaces=("${gives}")
pkgver="120.0.5543.161"
source=("https://deb.opera.com/opera/pool/non-free/o/opera-stable/${gives}_${pkgver}_amd64.deb")
pkgdesc="Multi-platform web browser developed by its namesake company Opera"
sha256sums=("37b910edaf3580e5a30efc62d85303909e1fdaf73aaf78574b10e43b04d98060")
arch=('amd64')
repology=("project: opera")

# vim:set ft=sh ts=2 sw=2 et:

maintainer=("Oren Klopfer <oren@taumoda.com>")
pkgname="opera-deb"
gives="opera-stable"
replaces=("${gives}")
pkgver="120.0.5543.93"
source=("https://deb.opera.com/opera/pool/non-free/o/opera-stable/${gives}_${pkgver}_amd64.deb")
pkgdesc="Multi-platform web browser developed by its namesake company Opera"
sha256sums=("5d59d6cf3f7e7eb1d16bd83db244a5bfbb81cdf2add58537837ee0d547a16aaa")
arch=('amd64')
repology=("project: opera")

# vim:set ft=sh ts=2 sw=2 et:

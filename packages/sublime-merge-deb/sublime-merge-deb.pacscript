pkgname="sublime-merge-deb"
gives="sublime-merge"
replaces=("${gives}")
pkgver="2110"
source=("https://download.sublimetext.com/${gives}_build-${pkgver}_amd64.deb")
pkgdesc="Sublime text like Git GUI Client"
sha256sums=("c3180600c51c2ea9c46dd8924a222e9eaf768312c3adc4fbc5a8ae9210b68d3d")
arch=('amd64')
maintainer=("Oren Klopfer <oren@taumoda.com>")
repology=("project: ${gives}")
# vim:set ft=sh ts=2 sw=2 et:

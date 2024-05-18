pkgname="sublime-merge-deb"
gives="sublime-merge"
replaces=("${gives}")
pkgver="2096"
source=("https://download.sublimetext.com/${gives}_build-${pkgver}_amd64.deb")
pkgdesc="Sublime text like Git GUI Client"
sha256sums=("81459fa0779b431c1fa50fd983343cbbfa28cc0791ec384ba952035818ba4d1a")
arch=('amd64')
maintainer=("Oren Klopfer <oren@taumoda.com>")
repology=("project: ${gives}")
# vim:set ft=sh ts=2 sw=2 et:

pkgname="sublime-merge-deb"
gives="sublime-merge"
replaces=("${gives}")
pkgver="2102"
source=("https://download.sublimetext.com/${gives}_build-${pkgver}_amd64.deb")
pkgdesc="Sublime text like Git GUI Client"
sha256sums=("adbf53c6c95c9f6156463bb03ceeb88e231ce9aa990db01322fc0418ae25e55e")
arch=('amd64')
maintainer=("Oren Klopfer <oren@taumoda.com>")
repology=("project: ${gives}")
# vim:set ft=sh ts=2 sw=2 et:

pkgname="sublime-merge-deb"
gives="sublime-merge"
replaces=("${gives}")
pkgver="2108"
source=("https://download.sublimetext.com/${gives}_build-${pkgver}_amd64.deb")
pkgdesc="Sublime text like Git GUI Client"
sha256sums=("57e88ecf5eeb7f408d7c312a7f8799d8fe585ea213cad5cc39595687e0ba5caf")
arch=('amd64')
maintainer=("Oren Klopfer <oren@taumoda.com>")
repology=("project: ${gives}")
# vim:set ft=sh ts=2 sw=2 et:

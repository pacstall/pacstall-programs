pkgname="sublime-text-deb"
gives="sublime-text"
replaces=("${gives}")
pkgver="4200"
source=("https://download.sublimetext.com/${gives}_build-${pkgver}_amd64.deb")
pkgdesc="Sublime text light text editor for programmers"
sha256sums=("79a687ffd749004eb4360243dc2133a68bbc8243f890ff3f8f5b00835870c7ea")
arch=('amd64')
maintainer=("Oren Klopfer <oren@taumoda.com>")
repology=("project: ${gives}")
# vim:set ft=sh ts=2 sw=2 et:

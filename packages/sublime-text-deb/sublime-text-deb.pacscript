pkgname="sublime-text-deb"
gives="sublime-text"
replaces=("${gives}")
pkgver="4192"
source=("https://download.sublimetext.com/${gives}_build-${pkgver}_amd64.deb")
pkgdesc="Sublime text light text editor for programmers"
sha256sums=("c13284ffdf52054abad9fa48a35b75ac140f19293275738a1c11a736a1197951")
arch=('amd64')
maintainer=("Oren Klopfer <oren@taumoda.com>")
repology=("project: ${gives}")
# vim:set ft=sh ts=2 sw=2 et:

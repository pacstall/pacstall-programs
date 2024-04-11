pkgname="sublime-text-deb"
gives="sublime-text"
replaces=("${gives}")
pkgver="4169"
source=("https://download.sublimetext.com/${gives}_build-${pkgver}_amd64.deb")
pkgdesc="Sublime text light text editor for programmers"
sha256sums=("e1bac169546317f246cc58adbdd20264c78486f12112b3c9ee303aa863c38f7f")
arch=('amd64')
maintainer=("Oren Klopfer <oren@taumoda.com>")
repology=("project: ${gives}")
# vim:set ft=sh ts=2 sw=2 et:

pkgname="sublime-text-deb"
gives="sublime-text"
replaces=("${gives}")
pkgver="4180"
source=("https://download.sublimetext.com/${gives}_build-${pkgver}_amd64.deb")
pkgdesc="Sublime text light text editor for programmers"
sha256sums=("a5460f6f9bd82ab5962a1efd6213eef3ca0ac7705d103c2f3d2eb74671f035d4")
arch=('amd64')
maintainer=("Oren Klopfer <oren@taumoda.com>")
repology=("project: ${gives}")
# vim:set ft=sh ts=2 sw=2 et:

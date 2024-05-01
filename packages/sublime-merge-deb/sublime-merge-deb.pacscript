pkgname="sublime-merge-deb"
gives="sublime-merge"
replaces=("${gives}")
pkgver="2092"
source=("https://download.sublimetext.com/${gives}_build-${pkgver}_amd64.deb")
pkgdesc="Sublime text like Git GUI Client"
sha256sums=("8711a06674c011a6793f6f0f7c8f9fe2062f75227cb926e1c9c9ae6de3ca8d5e")
arch=('amd64')
maintainer=("Oren Klopfer <oren@taumoda.com>")
repology=("project: ${gives}")
# vim:set ft=sh ts=2 sw=2 et:

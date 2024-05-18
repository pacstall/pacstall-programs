pkgname="komorebi-fork-deb"
gives="komorebi"
replaces=("${gives}")
pkgver="2.2.1"
source=("https://github.com/Komorebi-Fork/${gives}/releases/download/v${pkgver}/${gives}_${pkgver}-1_amd64.deb")
pkgdesc="A beautiful and customizable wallpaper manager for Linux"
sha256sums=("86ef373fb2fb645cdf72af192916dbe278d886283e1ee534843b6d259f3c08ab")
arch=('amd64')
maintainer=("0x262D <pacstall@copypaste.anonaddy.me>")
repology=("project: komorebi-fork")
# vim:set ft=sh ts=2 sw=2 et:

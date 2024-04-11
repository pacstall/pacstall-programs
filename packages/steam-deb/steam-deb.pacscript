pkgname="steam-deb"
gives="steam"
pkgver="1.0.0.78"
pacdeps=("steam-launcher-deb")
breaks=("${gives}-bin" "${gives}-app")
replaces=("${gives}")
source=("https://repo.${gives}powered.com/${gives}/archive/stable/${gives}_${pkgver}_i386.deb")
pkgdesc="Steam is a video game digital distribution service by Valve"
sha256sums=("e177e195b6ccdb9ddd57151e6689c1f0e73b900197bd586cdb6d7187a9efd762")
repology=("project: ${gives}")
arch=('amd64')
maintainer=("Oren Klopfer <oren@taumoda.com>")
prepare() {
  cd "${_archive}"
  dpkg --add-architecture i386
  apt-get update
}

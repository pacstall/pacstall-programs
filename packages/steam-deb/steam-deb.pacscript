name="steam-deb"
gives="steam"
pkgver="1.0.0.75"
pacdeps=("steam-launcher-deb")
breaks=("${gives}-bin" "${gives}-app")
replace=("${gives}")
url="https://repo.${gives}powered.com/${gives}/archive/stable/${gives}_${pkgver}_i386.deb"
pkgdesc="Steam is a video game digital distribution service by Valve"
hash="c4cb5ac75f185fb82a79f07ca2a9b68a9f14547b7f679268e9ca5ddda8728cc9"
repology=("project: ${gives}")

prepare() {
  sudo dpkg --add-architecture i386
  sudo apt-get update
}

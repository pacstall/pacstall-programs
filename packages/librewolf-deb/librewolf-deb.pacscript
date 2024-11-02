pkgname="librewolf-deb"
gives="librewolf"
replaces=("${gives}")
pkgdesc="A fork of Firefox, focused on privacy, security and freedom"
breaks=("${gives}-app" "${gives}-bin" "${gives}-git")
repology=("project: librewolf")
maintainer=(
  "Oren Klopfer <oren@taumoda.com>"
  "James Ed Randson <jimedrand@disroot.org>"
)
incompatible=('debian:bullseye')
arch=("amd64" "arm64")
pkgver="132.0-1"
source_amd64=("https://repo.librewolf.net/pool/${gives}-${pkgver}-linux-x86_64-deb.deb")
sha256sums_amd64=("aa78fa19b98f4aedec7beb32754e332b289a0cb0e2a0db26764f9a3151407350")
source_arm64=("https://repo.librewolf.net/pool/${gives}-${pkgver}-linux-arm64-deb.deb")
sha256sums_arm64=("3b12f148440999b486c4d81eec12b5e6afa1757cf6c2bd79981a167456c26543")

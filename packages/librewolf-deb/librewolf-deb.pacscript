pkgname="librewolf-deb"
gives="librewolf"
replaces=("${gives}")
pkgdesc="A custom version of Firefox, focused on privacy, security and freedom."
breaks=("${gives}-app" "${gives}-bin" "${gives}-git")
repology=("project: librewolf")
maintainer=(
  "Oren Klopfer <oren@taumoda.com>"
  "James Ed Randson <jimedrand@disroot.org>"
)
incompatible=('debian:bullseye')
arch=("amd64" "arm64")
pkgver="130.0.1-1"
source_amd64=("https://repo.${gives}.net/pool/${gives}-${pkgver}-linux-x86_64-deb.deb")
sha256sums_amd64=("bfefd455dafea1d8629f668f272bd56bdf285079ff5cad814b25066837d4f8c6")
source_arm64=("https://repo.${gives}.net/pool/${gives}-${pkgver}-linux-arm64-deb.deb")
sha256sums_arm64=("7c09cbb32f7a368e9cd3ca7ca8e734a94505f84c2d2e42477eca39998fbcca9f")

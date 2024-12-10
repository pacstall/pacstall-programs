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
pkgver="133.0-1"
source_amd64=("https://repo.librewolf.net/pool/${gives}-${pkgver}-linux-x86_64-deb.deb")
sha256sums_amd64=("cec1840a81a334f9a0157656b71e4d5f0485fbc511c366c82e83b5c8fc50883e")
source_arm64=("https://repo.librewolf.net/pool/${gives}-${pkgver}-linux-arm64-deb.deb")
sha256sums_arm64=("2ea190fdc0f32914f1d32d88d669f0dff40da2652e71ff307cacf0d28c6b305f")

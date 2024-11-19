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
pkgver="132.0.1-1"
source_amd64=("https://repo.librewolf.net/pool/${gives}-${pkgver}-linux-x86_64-deb.deb")
sha256sums_amd64=("28c4b3eef308bbf81ed684a501eed275e4ae8f0893f6a2088db6c0ba62a6462b")
source_arm64=("https://repo.librewolf.net/pool/${gives}-${pkgver}-linux-arm64-deb.deb")
sha256sums_arm64=("eb782e88236ff7bc739d6dab7c474935a34c3981d2bda27cc351a8c1cf555fc3")

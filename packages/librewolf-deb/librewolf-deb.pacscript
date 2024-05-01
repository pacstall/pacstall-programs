pkgname="librewolf-deb"
gives="librewolf"
replaces=("${gives}")
pkgdesc="A fork of Firefox, focused on privacy, security and freedom"
breaks=("${gives}-app" "${gives}-bin" "${gives}-git")
repology=("project: librewolf")
maintainer=("Oren Klopfer <oren@taumoda.com>")
incompatible=('debian:bullseye')
arch=("amd64" "any")
if [[ ${CARCH} != "amd64" ]]; then
  pkgver="107.0.1-2"
  source=("https://deb.librewolf.net/pool/jammy/${gives}_${pkgver}_all.deb")
  sha256sums=("c66df74a6f466821ecbf5402d18d4537d513a4bcc25b25d99301dca6e07ad85e")
else
  pkgver="121.0-1"
  source=("https://deb.librewolf.net/pool/jammy/${gives}-${pkgver}.en-US.ubuntu22.x86_64.deb")
  sha256sums=("1b7105ba3b8ad8e084e02eb7bbe46377c178ef49543b4fad0d48f31c2df80ec6")
fi

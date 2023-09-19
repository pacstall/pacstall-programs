name="librewolf-deb"
gives="librewolf"
replace=("${gives}")
pkgdesc="A fork of Firefox, focused on privacy, security and freedom"
breaks=("${pkgname}-app" "${pkgname}-bin" "${pkgname}-git")
repology=("project: librewolf")
maintainer="Oren Klopfer <oren@taumoda.com>"
incompatible=('debian:bullseye')
arch=("amd64" "any")
if [[ ${CARCH} != "amd64" ]]; then
  pkgver="107.0.1-2"
  url="https://deb.librewolf.net/pool/jammy/${gives}_${pkgver}_all.deb"
  hash="c66df74a6f466821ecbf5402d18d4537d513a4bcc25b25d99301dca6e07ad85e"
else
  pkgver="117.0-1"
  url="https://deb.librewolf.net/pool/jammy/${gives}-${pkgver}.en-US.ubuntu22.x86_64.deb"
  hash="b315fa9bf63b9d99ec7034ab1a0e595bd0c5eb7b3b3103b2cef919a54f8be78a"
fi

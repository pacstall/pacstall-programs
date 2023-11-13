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
  pkgver="119.0.1-1"
  url="https://deb.librewolf.net/pool/jammy/${gives}-${pkgver}.en-US.ubuntu22.x86_64.deb"
  hash="63a7f4a516b5ab367ea11dd444a44f3515849f99793a1f061d6cd0d1ad59509a"
fi

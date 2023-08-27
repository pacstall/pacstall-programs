name="librewolf-deb"
gives="librewolf"
replace=("${gives}")
pkgdesc="A fork of Firefox, focused on privacy, security and freedom"
breaks=("${pkgname}-app" "${pkgname}-bin" "${pkgname}-git")
repology=("project: librewolf")
maintainer="Oren Klopfer <oren@taumoda.com>"
incompatible=('debian:bullseye')
case "${CARCH}" in
  amd64)
    pkgver="111.0.1-1"
    url="https://deb.librewolf.net/pool/jammy/${gives}-${pkgver}.en-US.ubuntu22.x86_64.deb"
    hash="01b0a8f90cd4c0238b5c3513c1340bfcf94d2e3f11d06011fbf151c3a790c7c1"
    arch=("amd64")
    ;;
  *)
    pkgver="107.0.1-2"
    url="https://deb.librewolf.net/pool/jammy/${gives}_${pkgver}_all.deb"
    hash="c66df74a6f466821ecbf5402d18d4537d513a4bcc25b25d99301dca6e07ad85e"
    arch=('any')
    ;;
esac

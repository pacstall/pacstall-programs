pkgname="virtualbox-deb"
gives="virtualbox-7.0"
repology=("project: ${gives}")
pkgver="7.0.18"
arch=('amd64')
breaks=("${gives}-bin")
pkgdesc="VirtualBox is a general-purpose full virtualizer for x86 hardware, targeted at server, desktop and embedded use"
release="162988"
source_bookworm=("https://download.virtualbox.org/virtualbox/${pkgver}/virtualbox-7.0_${pkgver}-${release}~Debian~bookworm_amd64.deb")
sha256sums_bookworm="a8a65f3b77ace18abf48440859ba0fcfe33cba02d745ab7f12eb19fc18338298"
source_ubuntu=("https://download.virtualbox.org/virtualbox/${pkgver}/virtualbox-7.0_${pkgver}-${release}~Ubuntu~jammy_amd64.deb")
sha256sums_ubuntu="9676421d588478d389d87dbc29bc0a259163c061ae9bd763e43ff807650bf9b6"
maintainer="Gianluca Mastrolonardo <gianlucamastrolonardo10@gmail.com>"
incompatible=("debian:testing" "debian:sid" "ubuntu:mantic" "ubuntu:noble" "ubuntu:devel")
# vim:set ft=sh ts=2 sw=2 et:
#latest_version="$(curl -sL https://download.virtualbox.org/virtualbox/LATEST-STABLE.TXT)"

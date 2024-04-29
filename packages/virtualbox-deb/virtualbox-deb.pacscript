name="virtualbox-deb"
gives="virtualbox-7.0"
repology=("project: ${gives}")
pkgver="7.0.16"
arch=('amd64')
breaks=("${gives}-bin")
pkgdesc="VirtualBox is a general-purpose full virtualizer for x86 hardware, targeted at server, desktop and embedded use"
release="162802"
case "${DISTRO}" in
"debian:bookworm")
  url="https://download.virtualbox.org/virtualbox/${pkgver}/virtualbox-7.0_${pkgver}-${release}~Debian~bookworm_amd64.deb"
  hash="6aa43d4713d3a351aa2af5bc86fca452897f312ee7c8b9a26cf6e9a6924494de"
  ;;
"debian:bullseye")
  url="https://download.virtualbox.org/virtualbox/${pkgver}/virtualbox-7.0_${pkgver}-${release}~Debian~bullseye_amd64.deb"
  hash="001ea3bbdf06f7931bb64d7e6b556aef7fe2c3721c882054445580aaab5fc70c"
  ;;
"debian:buster")
  url="https://download.virtualbox.org/virtualbox/${pkgver}/virtualbox-7.0_${pkgver}-${release}~Debian~buster_amd64.deb"
  hash="5bccc51b1b0f0768872e0037eeae6330fc488a61969203a610c0005aeb2bd53d"
  ;;
"ubuntu:bionic")
  url="https://download.virtualbox.org/virtualbox/${pkgver}/virtualbox-7.0_${pkgver}-${release}~Ubuntu~bionic_amd64.deb"
  hash="a8cf2d9aecfba9170c67d39dd0368410ff19b57be25accc229be19bef1e759ae"
  ;;
"ubuntu:focal")
  url="https://download.virtualbox.org/virtualbox/${pkgver}/virtualbox-7.0_${pkgver}-${release}~Ubuntu~focal_amd64.deb"
  hash="466f7307f16fc105a9ab00479d18bbcf3476666a6be2e28b7afb2a5143d0406c"
  ;;
*)
  #Use Ubuntu~jammy
  url="https://download.virtualbox.org/virtualbox/${pkgver}/virtualbox-7.0_${pkgver}-${release}~Ubuntu~jammy_amd64.deb"
  hash="32c88448e26a7a19d87beea5333b61edb6e6b5cc4f66f941f5c081085708e33e"
  ;;
esac
maintainer="Gianluca Mastrolonardo <gianlucamastrolonardo10@gmail.com>"
incompatible=("ubuntu:mantic" "ubuntu:noble" "ubuntu:devel")
# vim:set ft=sh ts=2 sw=2 et:
#latest_version="$(curl -sL https://download.virtualbox.org/virtualbox/LATEST-STABLE.TXT)"

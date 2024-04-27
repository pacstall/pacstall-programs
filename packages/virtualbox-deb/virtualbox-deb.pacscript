name="virtualbox-deb"
gives="virtualbox"
repology=("project: ${gives}")
pkgver="7.0.16"
url="https://download.virtualbox.org/virtualbox/${pkgver}/virtualbox-7.0_${pkgver}-162802~Ubuntu~jammy_amd64.deb"
breaks=("${gives}-bin")
pkgdesc="VirtualBox is a general-purpose full virtualizer for x86 hardware, targeted at server, desktop and embedded use"
hash="32c88448e26a7a19d87beea5333b61edb6e6b5cc4f66f941f5c081085708e33e"
arch=('amd64')
maintainer="Gianluca Mastrolonardo <gianlucamastrolonardo10@gmail.com>"
incompatible=("debian:*" "ubuntu:mantic" "ubuntu:noble" "ubuntu:devel")

# vim:set ft=sh ts=2 sw=2 et:
#latest_version="$(curl -sL https://download.virtualbox.org/virtualbox/LATEST-STABLE.TXT)"

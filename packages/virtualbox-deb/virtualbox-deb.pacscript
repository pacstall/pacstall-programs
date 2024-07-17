pkgname="virtualbox-deb"
gives="virtualbox-7.0"
repology=("project: ${gives}")
pkgver="7.0.20"
release="163906"
arch=('amd64')
breaks=("${gives}-bin")
pkgdesc="VirtualBox is a general-purpose full virtualizer for x86 hardware, targeted at server, desktop and embedded use"
source_bookworm=("https://download.virtualbox.org/virtualbox/${pkgver}/virtualbox-7.0_${pkgver}-${release}~Debian~bookworm_amd64.deb")
sha256sums_bookworm="c017d5f7b043b1b12bface26b497129ac2e35e11adf0fba88b076bc8024fdcde"
source_jammy=("https://download.virtualbox.org/virtualbox/${pkgver}/virtualbox-7.0_${pkgver}-${release}~Ubuntu~jammy_amd64.deb")
sha256sums_jammy="fbc338b127a13bc49a0d14145faf98324cce245e8e0c18e1b1f642bd0d54f622"
source_noble=("https://download.virtualbox.org/virtualbox/${pkgver}/virtualbox-7.0_${pkgver}-${release}~Ubuntu~jammy_amd64.deb")
sha256sums_noble="f0aadadad827e02d73721e2d746a236bfa343598f0ae9b612a24960fe8b8d6ca"
maintainer="Gianluca Mastrolonardo <gianlucamastrolonardo10@gmail.com>"
incompatible=("debian:testing" "debian:sid" "ubuntu:mantic" "ubuntu:noble" "ubuntu:devel")
# vim:set ft=sh ts=2 sw=2 et:
#latest_version="$(curl -sL https://download.virtualbox.org/virtualbox/LATEST-STABLE.TXT)"

virtualbox-7.0_7.0.20-163906~Debian~bookworm_amd64.deb

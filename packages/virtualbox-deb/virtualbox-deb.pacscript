pkgname="virtualbox-deb"
gives="virtualbox"
repology=("project: ${gives}")
pkgver="7.0.14"
source=("https://download.virtualbox.org/virtualbox/${pkgver}/virtualbox-7.0_${pkgver}-161095~Ubuntu~jammy_amd64.deb")
breaks=("${gives}-bin")
pkgdesc="VirtualBox is a general-purpose full virtualizer for x86 hardware, targeted at server, desktop and embedded use"
sha256sums=("43aa0932f73433e7a6b450a82708d275ee5f2c98375cfa708a46ecf75b3d4edc")
arch=('amd64')
maintainer=("Gianluca Mastrolonardo <gianlucamastrolonardo10@gmail.com>")
incompatible=("debian:*" "ubuntu:mantic" "ubuntu:noble" "ubuntu:devel")

#latest_version="$(curl -sL https://download.virtualbox.org/virtualbox/LATEST-STABLE.TXT)"

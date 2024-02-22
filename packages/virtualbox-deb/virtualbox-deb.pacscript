name="virtualbox-deb"
gives="virtualbox"
repology=("project: ${gives}")
pkgver="7.0.14"
url="https://download.virtualbox.org/virtualbox/${pkgver}/virtualbox-7.0_${pkgver}-161095~Ubuntu~jammy_amd64.deb"
breaks=("${gives}-bin")
pkgdesc="VirtualBox is a general-purpose full virtualizer for x86 hardware, targeted at server, desktop and embedded use"
hash="d97f0f402bd65a9c26aa266246b0894c8d6762e82373377641ca779c46406299"
arch=('amd64')
maintainer="Gianluca Mastrolonardo <gianlucamastrolonardo10@gmail.com>"
incompatible=('debian:*')

#latest_version="$(curl -sL https://download.virtualbox.org/virtualbox/LATEST-STABLE.TXT)"

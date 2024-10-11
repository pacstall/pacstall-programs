pkgname="virtualbox-deb"
gives="virtualbox-7.1"
repology=("project: virtualbox")
pkgver="7.1.0"
release="164728"
arch=('amd64')
breaks=("${gives}-bin")
pkgdesc="VirtualBox is a general-purpose full virtualizer for x86 hardware, targeted at server, desktop and embedded use"
maintainer=("Gianluca Mastrolonardo <gianlucamastrolonardo10@gmail.com>" "xdavius <xdavius@github.com>")

source_bookworm=("https://download.virtualbox.org/virtualbox/${pkgver}/${gives}_${pkgver}-${release}~Debian~bookworm_amd64.deb")
sha256sums_bookworm="5dc2a38fec468b2af74ee20c986edfddcafef7701fd336e6c6d971cb3c621cc0"

source_jammy=("https://download.virtualbox.org/virtualbox/${pkgver}/${gives}_${pkgver}-${release}~Ubuntu~jammy_amd64.deb")
sha256sums_jammy="6c5c65fab5eed2f18c5689579004140abadd1f8e0b1af751dd58aa7eb3fbec8c"

source_noble=("https://download.virtualbox.org/virtualbox/${pkgver}/${gives}_${pkgver}-${release}~Ubuntu~noble_amd64.deb")
sha256sums_noble="56aefc0c12fd3d9a9efb336c08956e5c1a1c4cedca8f6e25193742d6b5932497"

incompatible=("debian:trixie" "debian:sid" "ubuntu:mantic" "ubuntu:oracular" "ubuntu:devel")

# vim:set ft=sh ts=2 sw=2 et:
#latest_version="$(curl -sL https://download.virtualbox.org/virtualbox/LATEST-STABLE.TXT)"

pkgname="virtualbox-deb"
gives="virtualbox-7.1"
repology=("project: virtualbox")
pkgver="7.1.4"
release="165100"
arch=('amd64')
breaks=("${gives}-bin")
pkgdesc="VirtualBox is a general-purpose full virtualizer for x86 hardware, targeted at server, desktop and embedded use"
maintainer=("Gianluca Mastrolonardo <gianlucamastrolonardo10@gmail.com>" "James Ed Randson <jimedrand@disroot.org>" "xdavius <xdavius@github.com>")
incompatible=("debian:trixie" "debian:sid" "ubuntu:mantic" "ubuntu:oracular" "ubuntu:plucky" "ubuntu:devel")

source_bullseye=("https://download.virtualbox.org/virtualbox/${pkgver}/${gives}_${pkgver}-${release}~Debian~bullseye_amd64.deb")
sha256sums_bullseye="c74ac1234299c3a5143c21f41871ab465f30ad907e31ea01e61c8e81feb5a98c"

source_bookworm=("https://download.virtualbox.org/virtualbox/${pkgver}/${gives}_${pkgver}-${release}~Debian~bookworm_amd64.deb")
sha256sums_bookworm="a180c568647611eb5c1df1ff37ad1591e7bce020dec4a69b90d6c5d4061c0e76"

source_jammy=("https://download.virtualbox.org/virtualbox/${pkgver}/${gives}_${pkgver}-${release}~Ubuntu~jammy_amd64.deb")
sha256sums_jammy="8e210c6e3e9ca8ff2af78238ab81af3d90b14628ffb2df31a629a38ce9307918"

source_noble=("https://download.virtualbox.org/virtualbox/${pkgver}/${gives}_${pkgver}-${release}~Ubuntu~noble_amd64.deb")
sha256sums_noble="54c25c941678198b0baf78f5e4cf468b990fd625ec4e7b231cf1e8a6bace3d1a"

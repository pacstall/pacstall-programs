pkgname="virtualbox-guest-iso"
gives="${pkgname}"
arch=('any')
pkgver="7.1.6"
pacdeps=("virtualbox-deb")
maintainer=("James Ed Randson <jimedrand@disroot.org>")
pkgdesc="ISO CD image version of the VirtualBox Guest Additions (for installation on the host)"
incompatible=("debian:trixie" "debian:sid" "ubuntu:mantic" "ubuntu:oracular" "ubuntu:plucky" "ubuntu:devel")
source=("https://download.virtualbox.org/virtualbox/${pkgver}/VBoxGuestAdditions_${pkgver}.iso")
sha256sums=("dbbda1645bc05c9260adfe9efc4949cb590ec5ec02680aff936375670cffcafc")

build() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/lib/virtualbox/additions"
}

package() {
  cd "${srcdir}"
  cp -r VBoxGuestAdditions_${pkgver}.iso/* "${srcdir}/lib/virtualbox/additions/VBoxGuestAdditions_${pkgver}.iso"
}

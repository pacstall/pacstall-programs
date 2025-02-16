pkgname="virtualbox-guest-iso"
arch=('any')
pkgver="7.1.6"
pacdeps=("virtualbox-deb")
maintainer=("James Ed Randson <jimedrand@disroot.org>")
pkgdesc="ISO CD image version of the VirtualBox Guest Additions (for installation on the host)"
source=("https://download.virtualbox.org/virtualbox/${pkgver}/VBoxGuestAdditions_${pkgver}.iso")
sha256sums=("dbbda1645bc05c9260adfe9efc4949cb590ec5ec02680aff936375670cffcafc")

package() {
  mkdir -p "${pkgdir}/lib/virtualbox/additions"
  install -Dm644 "${srcdir}/VBoxGuestAdditions_${pkgver}.iso" "${pkgdir}/usr/lib/virtualbox/additions/VBoxGuestAdditions_${pkgver}.iso"
}

pkgname="facetimehd-firmware"
pkgver="1.0.0"
pkgdesc="FacetimeHD firmware download and extraction tool"
arch=('amd64')
url='https://github.com/patjak/facetimehd-firmware'
source=("@${pkgname}~${pkgver}::https://github.com/patjak/${pkgname}/archive/refs/tags/v${pkgver}.zip")
sha256sums=("6883c3fefb372ccd78598eaca7fae97025ff3e543b096703667b296fbf45d7bd")
license=('GPL-2.0-only')
maintainer=("Dheeraj Reddy <dheerajre@proton.me>")
makedepends=(
  "xz-utils"
  "cpio"
  "curl"
  "make"
)
provides=('bcwc-pcie-firmware')
external_connection=true

build() {
  cd "${pkgname}~${pkgver}"/
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"/
  make DESTDIR="${pkgdir}" install
}

post_install() {
  echo 'Note: a reboot may be required after installing the modules before they will work (seems to be the case on MacBook Pro (13", late 2013).'
}

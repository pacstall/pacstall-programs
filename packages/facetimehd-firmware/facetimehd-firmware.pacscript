pkgname="facetimehd-firmware"
pkgver="1.0.0"
pkgrel="1"
arch=('any')
url='https://github.com/patjak/facetimehd-firmware'
source=(
  "@${pkgname}~${pkgver}::https://github.com/patjak/facetimehd-firmware/archive/refs/tags/v${pkgver}.zip"
)
pkgdesc="FacetimeHD firmware download and extraction tool"
maintainer=("Dheeraj Reddy <dheerajre@proton.me>")
sha256sum=("6883c3fefb372ccd78598eaca7fae97025ff3e543b096703667b296fbf45d7bd")
external_connection=true
makedepends=(
  "7zip"
  "curl"
  "xz-utils"
  "cpio"
)

build() {
  cd "${pkgname}~${pkgver}"
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  make DESTDIR="${pkgdir}" install
}

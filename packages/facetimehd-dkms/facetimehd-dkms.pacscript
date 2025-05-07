pkgname="facetimehd-dkms"
pkgver="0.6.13"
pkgdesc="Reverse engineered Linux driver for the FacetimeHD (Broadcom 1570) PCIe webcam"
arch=('amd64')
url='https://github.com/patjak/facetimehd'
maintainer=("Dheeraj Reddy <dheerajreddy.proton.me>")
license=('GPL-2.0-only')
source=("@${pkgname}~${pkgver}::https://github.com/patjak/facetimehd/archive/refs/tags/${pkgver}.zip")
sha256sums=("3a90ebb1cfe431ef7cfe33f5b60ccd35acb317b2edd3fb574a8f8d2eed6e772b")

depends=("linux-image>=4.4" "dkms")
makedepends=(
  "linux-headers-generic"
  "kmod"
  "libssl-dev"
  "make"
)
pacdeps=("facetimehd-firmware" "facetimehd-data")

package() {
  cd "${pkgname}~${pkgver}"/
  for FILE in dkms.conf Makefile *.[ch]; do
    install -Dm644 "${FILE}" "${pkgdir}/usr/src/facetimehd-${pkgver}/${FILE}"
  done
}

post_install() {
  dkms add -m facetimehd -v "${pkgver}"
  dkms build -m facetimehd -v "${pkgver}"
  dkms install -m facetimehd -v "${pkgver}"

  depmod
  modprobe facetimehd
}

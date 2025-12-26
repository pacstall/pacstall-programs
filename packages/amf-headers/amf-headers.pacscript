pkgname="amf-headers"
arch=("all")
pkgver="1.4.36"
url='https://github.com/GPUOpen-LibrariesAndSDKs/AMF/'
pkgdesc="Header files for AMD Advanced Media Framework"
maintainer=("Luis Garcia <pacstall@luigi311.com>")
license=('MIT')
repology=("project: ${pkgname}")
source=("@${pkgname}~${pkgver}::https://github.com/GPUOpen-LibrariesAndSDKs/AMF/releases/download/v${pkgver}/AMF-headers-v${pkgver}.tar.gz")
sha256sums=("ec07ee21b820a73f5bae224e92fd3c492f52732d4885f0637f48189afdd87564")
makedepends=('git')

package() {
  cd "${pkgname}~${pkgver}"
  install -dm 755 "${pkgdir}/usr/include/AMF"
  cp -dr --no-preserve=ownership ./* "${pkgdir}/usr/include/AMF/"
}

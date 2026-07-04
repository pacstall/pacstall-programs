pkgname="amf-headers"
arch=("all")
pkgver="1.5.2"
url='https://github.com/GPUOpen-LibrariesAndSDKs/AMF/'
pkgdesc="Header files for AMD Advanced Media Framework"
maintainer=("Luis Garcia <pacstall@luigi311.com>")
license=('MIT')
repology=("project: ${pkgname}")
source=("@${pkgname}~${pkgver}::https://github.com/GPUOpen-LibrariesAndSDKs/AMF/releases/download/v${pkgver}/AMF-headers-v${pkgver}.tar.gz")
sha256sums=("d3c12eb324edf05e214608b6a395a51dd95770ed9d45520185d6c3a206811c99")
makedepends=('git')

package() {
  cd "${pkgname}~${pkgver}"
  install -dm 755 "${pkgdir}/usr/include/AMF"
  cp -dr --no-preserve=ownership ./* "${pkgdir}/usr/include/AMF/"
}

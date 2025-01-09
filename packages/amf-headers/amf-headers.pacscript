pkgname="amf-headers"
gives="amf-headers"
arch=("all")
pkgver="1.4.34"
url='https://github.com/GPUOpen-LibrariesAndSDKs/AMF/'
pkgdesc="Header files for AMD Advanced Media Framework"
maintainer=("Luis Garcia <pacstall@luigi311.com>")
license=('MIT')

source=(
  "@${pkgname}~${pkgver}::https://github.com/GPUOpen-LibrariesAndSDKs/AMF/releases/download/v${pkgver}/AMF-headers.tar.gz"
)
sha256sums=(
  "5393759308f6d7bc9eb1ed8013c954e03aadb85f0ed6e96f969a5df447b0f79c"
)

makedepends=(
  'git'
)
depends=()
optdepends=()

package() {
  cd "${pkgname}~${pkgver}"
  install -dm 755 "${pkgdir}/usr/include/AMF"
  cp -dr --no-preserve=ownership ./* "${pkgdir}/usr/include/AMF/"
}

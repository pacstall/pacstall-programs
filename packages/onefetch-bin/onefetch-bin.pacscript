pkgname="onefetch-bin"
gives="onefetch"
arch=("amd64")
pkgver="2.24.0"
source=("@${pkgname}~${pkgver}::https://github.com/o2sh/onefetch/releases/download/${pkgver}/onefetch-linux.tar.gz")
pkgdesc="Git repository summary on your terminal"
sha256sums=("8459d6c36cc4306dbaa7fc6daee000d8384f384f5b8b79878391a0bdc2e69c76")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 onefetch -t "${pkgdir}/usr/bin"
}

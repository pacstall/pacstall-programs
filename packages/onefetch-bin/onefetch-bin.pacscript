pkgname="onefetch-bin"
gives="onefetch"
arch=("amd64")
pkgver="2.18.0"
source=("@${pkgname}~${pkgver}::https://github.com/o2sh/onefetch/releases/download/${pkgver}/onefetch-linux.tar.gz")
pkgdesc="Git repository summary on your terminal"
sha256sums=("414d166e55e045a18d3a908cbe719cca08dabe5bfde45fa8aefce71099305a16")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 onefetch -t "${pkgdir}/usr/bin"
}

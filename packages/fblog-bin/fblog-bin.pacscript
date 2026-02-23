pkgname=("fblog-bin")
arch=("amd64")
pkgver="4.17.0"
source=("https://github.com/brocode/fblog/releases/download/v${pkgver}/fblog")
sha256sums=("2bc0a97ae4f03ec8169f6ce1319099ac4b6f9901247f62ffc61178a7347a59e4")
conflicts=("fblog-deb")
pkgdesc="Small command-line JSON Log viewer"
maintainer=("Sarim <sarimbinwaseem@protonmaill.com>")
license=("WTFPL")

package() {
  cd "${srcdir}"
  install -Dm755 fblog "${pkgdir}/usr/bin/fblog"
}

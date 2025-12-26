pkgname=("fblog-bin")
arch=("amd64")
pkgver="4.14.0"
source=("https://github.com/brocode/fblog/releases/download/v${pkgver}/fblog")
sha256sums=("0fb91ef3639130547bca63c044fcfe467ac1aba828f1f1f8e41a8c2a556ecb38")
conflicts=("fblog-deb")
pkgdesc="Small command-line JSON Log viewer"
maintainer=("Sarim <sarimbinwaseem@protonmaill.com>")
license=("WTFPL")

package() {
  cd "${srcdir}"
  install -Dm755 fblog "${pkgdir}/usr/bin/fblog"
}

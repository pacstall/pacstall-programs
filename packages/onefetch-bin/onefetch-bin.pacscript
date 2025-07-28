pkgname="onefetch-bin"
gives="onefetch"
arch=("amd64")
pkgver="2.25.0"
repology=("project: ${gives}")
source=("https://github.com/o2sh/onefetch/releases/download/${pkgver}/onefetch-linux.tar.gz")
pkgdesc="Git repository summary on your terminal"
sha256sums=("8b805fc8aa5c355aeda6367cea5e01a29e9c559613fcc6dc03edd44b6b5b8f50")

package() {
  install -Dm755 onefetch -t "${pkgdir}/usr/bin"
}

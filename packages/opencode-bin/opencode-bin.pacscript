pkgname="opencode-bin"
arch=("amd64" "arm64")
gives="opencode"
pkgver="1.18.27"
url='https://github.com/anomalyco/opencode'
pkgdesc="AI coding agent built for the terminal"
project=("project: opencode")
depends=("ripgrep")
license=('MIT')
maintainer=("Christian F. Brinkmann <christian.brinkmann09@gmail.com>")
source_amd64=("https://github.com/anomalyco/${gives}/releases/download/v${pkgver}/${gives}-linux-x64.tar.gz")
sha256sums_amd64=("4af5494f9433f59db8c1e344198f0ee72a50c06ec009fb4a8aeab4c2d4abd702")
source_arm64=("https://github.com/anomalyco/${gives}/releases/download/v${pkgver}/${gives}-linux-arm64.tar.gz")
sha256sums_arm64=("8cbc134eb5e100baf61ee7196150f503e352056e703276e2d8637c38bafd2c39")

package() {
  install -Dm755 "${srcdir}/opencode" "${pkgdir}/usr/bin/opencode"
}

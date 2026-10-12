pkgname="opencode-bin"
arch=("amd64" "arm64")
gives="opencode"
pkgver="1.19.0"
url='https://github.com/anomalyco/opencode'
pkgdesc="AI coding agent built for the terminal"
project=("project: opencode")
depends=("ripgrep")
license=('MIT')
maintainer=("Christian F. Brinkmann <christian.brinkmann09@gmail.com>")
source_amd64=("https://github.com/anomalyco/${gives}/releases/download/v${pkgver}/${gives}-linux-x64.tar.gz")
sha256sums_amd64=("7bb9e61ad6feacf2e89c10a6a2c1840e3de4220bb50ba1fc7110f31806076aec")
source_arm64=("https://github.com/anomalyco/${gives}/releases/download/v${pkgver}/${gives}-linux-arm64.tar.gz")
sha256sums_arm64=("e9841d43d3e1a8f36ed2691592d3b8b4fb097e606c8b559a277a1b845840e26b")

package() {
  install -Dm755 "${srcdir}/opencode" "${pkgdir}/usr/bin/opencode"
}

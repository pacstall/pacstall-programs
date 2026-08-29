pkgname="opencode-bin"
arch=("amd64" "arm64")
gives="opencode"
pkgver="1.18.23"
url='https://github.com/anomalyco/opencode'
pkgdesc="AI coding agent built for the terminal"
project=("project: opencode")
depends=("ripgrep")
license=('MIT')
maintainer=("Christian F. Brinkmann <christian.brinkmann09@gmail.com>")
source_amd64=("https://github.com/anomalyco/${gives}/releases/download/v${pkgver}/${gives}-linux-x64.tar.gz")
sha256sums_amd64=("ab7015cd8113e011a461f30a0c2b77d8299a144ff688cb62e93e8802835d7288")
source_arm64=("https://github.com/anomalyco/${gives}/releases/download/v${pkgver}/${gives}-linux-arm64.tar.gz")
sha256sums_arm64=("86d3afaf4e8784f9adab189be2a315c12b27ec40a04b70defbe70595c3cc7c65")

package() {
  install -Dm755 "${srcdir}/opencode" "${pkgdir}/usr/bin/opencode"
}

pkgname="opencode-bin"
arch=("amd64" "arm64")
gives="opencode"
pkgver="1.18.33"
url='https://github.com/anomalyco/opencode'
pkgdesc="AI coding agent built for the terminal"
project=("project: opencode")
depends=("ripgrep")
license=('MIT')
maintainer=("Christian F. Brinkmann <christian.brinkmann09@gmail.com>")
source_amd64=("https://github.com/anomalyco/${gives}/releases/download/v${pkgver}/${gives}-linux-x64.tar.gz")
sha256sums_amd64=("e546123213ae47909a4268692aa4b94950d011afe9cac9938753a2194f1c16d5")
source_arm64=("https://github.com/anomalyco/${gives}/releases/download/v${pkgver}/${gives}-linux-arm64.tar.gz")
sha256sums_arm64=("c63486624621924bf43be5c01abd252885661a734814224f6d70188a33aea858")

package() {
  install -Dm755 "${srcdir}/opencode" "${pkgdir}/usr/bin/opencode"
}

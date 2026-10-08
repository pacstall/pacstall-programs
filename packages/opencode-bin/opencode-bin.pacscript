pkgname="opencode-bin"
arch=("amd64" "arm64")
gives="opencode"
pkgver="1.18.35"
url='https://github.com/anomalyco/opencode'
pkgdesc="AI coding agent built for the terminal"
project=("project: opencode")
depends=("ripgrep")
license=('MIT')
maintainer=("Christian F. Brinkmann <christian.brinkmann09@gmail.com>")
source_amd64=("https://github.com/anomalyco/${gives}/releases/download/v${pkgver}/${gives}-linux-x64.tar.gz")
sha256sums_amd64=("c8f888b451f5494a18f858fffb0e0b68f4e4baa9c241761c5f206884f0fa640d")
source_arm64=("https://github.com/anomalyco/${gives}/releases/download/v${pkgver}/${gives}-linux-arm64.tar.gz")
sha256sums_arm64=("f7f2ba59ee8aa94d388f9696575a32d20e71c2ee48def9f80fc693a60fec6c72")

package() {
  install -Dm755 "${srcdir}/opencode" "${pkgdir}/usr/bin/opencode"
}

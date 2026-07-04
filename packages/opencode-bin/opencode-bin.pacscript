pkgname="opencode-bin"
arch=("amd64" "arm64")
gives="opencode"
pkgver="1.17.11"
url='https://github.com/anomalyco/opencode'
pkgdesc="AI coding agent built for the terminal"
project=("project: opencode")
depends=("ripgrep")
license=('MIT')
maintainer=("Christian F. Brinkmann <christian.brinkmann09@gmail.com>")
source_amd64=("https://github.com/anomalyco/${gives}/releases/download/v${pkgver}/${gives}-linux-x64.tar.gz")
sha256sums_amd64=("6aefcbbb7f04cdb4642be5208ddbfabb3c3d274f816bf42bff72eea5c244dca2")
source_arm64=("https://github.com/anomalyco/${gives}/releases/download/v${pkgver}/${gives}-linux-arm64.tar.gz")
sha256sums_arm64=("6c0ae8212401c78f9dcddead35d385953c7a44eb1616309365b58503dbd1b4cd")

package() {
  install -Dm755 "${srcdir}/opencode" "${pkgdir}/usr/bin/opencode"
}

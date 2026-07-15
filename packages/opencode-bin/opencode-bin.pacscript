pkgname="opencode-bin"
arch=("amd64" "arm64")
gives="opencode"
pkgver="1.17.17"
url='https://github.com/anomalyco/opencode'
pkgdesc="AI coding agent built for the terminal"
project=("project: opencode")
depends=("ripgrep")
license=('MIT')
maintainer=("Christian F. Brinkmann <christian.brinkmann09@gmail.com>")
source_amd64=("https://github.com/anomalyco/${gives}/releases/download/v${pkgver}/${gives}-linux-x64.tar.gz")
sha256sums_amd64=("3957e8b9b80867633daf82cba43f17980c8daf71d4d265a40313fb21d5d58fac")
source_arm64=("https://github.com/anomalyco/${gives}/releases/download/v${pkgver}/${gives}-linux-arm64.tar.gz")
sha256sums_arm64=("5a03cf2abc71cef8c57cd03add3ff55a0c1d6e0d4af4b825efdc503cfce23ab3")

package() {
  install -Dm755 "${srcdir}/opencode" "${pkgdir}/usr/bin/opencode"
}

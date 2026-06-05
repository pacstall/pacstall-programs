pkgname="opencode-bin"
arch=("amd64" "arm64")
gives="opencode"
pkgver="1.16.0"
url='https://github.com/anomalyco/opencode'
pkgdesc="AI coding agent built for the terminal."
project=("project: opencode")
depends=("ripgrep")
license=('MIT')
maintainer=("Christian F. Brinkmann <christian.brinkmann09@gmail.com>")

source_amd64=("https://github.com/anomalyco/${gives}/releases/download/v${pkgver}/${gives}-linux-x64.tar.gz")
sha256sums_amd64=("a741c43e737b2033f5e7ee151b162341e441034d6a64b172272a3f3a3729e87d")
source_arm64=("https://github.com/anomalyco/${gives}/releases/download/v${pkgver}/${gives}-linux-arm64.tar.gz")
sha256sums_arm64=("06ef602b9bc8a624fdc8e927673e7daa4cb70f1e57c5584023ca93631c4a476e")

package() {
  install -Dm755 "${srcdir}/opencode" "${pkgdir}/usr/bin/opencode"
}

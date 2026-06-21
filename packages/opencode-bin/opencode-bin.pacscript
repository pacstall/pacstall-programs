pkgname="opencode-bin"
arch=("amd64" "arm64")
gives="opencode"
pkgver="1.17.8"
url='https://github.com/anomalyco/opencode'
pkgdesc="AI coding agent built for the terminal"
project=("project: opencode")
depends=("ripgrep")
license=('MIT')
maintainer=("Christian F. Brinkmann <christian.brinkmann09@gmail.com>")
source_amd64=("https://github.com/anomalyco/${gives}/releases/download/v${pkgver}/${gives}-linux-x64.tar.gz")
sha256sums_amd64=("13fffc29227093462b7d14777ea6b804cfd94c2612819c101bbf933d862b1e5f")
source_arm64=("https://github.com/anomalyco/${gives}/releases/download/v${pkgver}/${gives}-linux-arm64.tar.gz")
sha256sums_arm64=("cfb34a6a9a40f9a2adb0d0f3ab387b97307823d075572bfb54a553228adcebbd")

package() {
  install -Dm755 "${srcdir}/opencode" "${pkgdir}/usr/bin/opencode"
}

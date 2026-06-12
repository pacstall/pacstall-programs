pkgname="opencode-bin"
arch=("amd64" "arm64")
gives="opencode"
pkgver="1.17.3"
url='https://github.com/anomalyco/opencode'
pkgdesc="AI coding agent built for the terminal"
project=("project: opencode")
depends=("ripgrep")
license=('MIT')
maintainer=("Christian F. Brinkmann <christian.brinkmann09@gmail.com>")
source_amd64=("https://github.com/anomalyco/${gives}/releases/download/v${pkgver}/${gives}-linux-x64.tar.gz")
sha256sums_amd64=("d4bd238a2c1ff56aca1cd3397d21a0a317f5992234517a7f8e2afbbd72010a7d")
source_arm64=("https://github.com/anomalyco/${gives}/releases/download/v${pkgver}/${gives}-linux-arm64.tar.gz")
sha256sums_arm64=("861b8c66ced51d6d9a66ea773ce47ede663a44bd17d837b9c21acfa3468801e5")

package() {
  install -Dm755 "${srcdir}/opencode" "${pkgdir}/usr/bin/opencode"
}

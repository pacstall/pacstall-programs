pkgname="wgcf-bin"
pkgver="2.2.23"
source=("https://github.com/ViRb3/wgcf/releases/download/v${pkgver}/wgcf_${pkgver}_linux_amd64")
sha256sums=("2d4f9402c85982f5e6fdc64945b41491c651bbaca4e0aaf20bc31b63d3adab42")
arch=('amd64')
pkgdesc="Cross-platform, unofficial CLI for Cloudflare Warp"
maintainer=("Wildy Sheverando <hai@shiwildy.com>")

package() {
  cd "${srcdir}"
  install -Dm755 "wgcf_${pkgver}_linux_amd64" "${pkgdir}/usr/bin/wgcf"
}

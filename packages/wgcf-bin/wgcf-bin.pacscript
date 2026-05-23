pkgname="wgcf-bin"
pkgver="2.2.30"
source=("https://github.com/ViRb3/wgcf/releases/download/v${pkgver}/wgcf_${pkgver}_linux_amd64")
sha256sums=("fc443008fe29a6f0b05b45d27436b7ce89e87a6836718597ccb39e41da418304")
arch=('amd64')
pkgdesc="Cross-platform, unofficial CLI for Cloudflare Warp"
maintainer=("Wildy Sheverando <hai@shiwildy.com>")

package() {
  cd "${srcdir}"
  install -Dm755 "wgcf_${pkgver}_linux_amd64" "${pkgdir}/usr/bin/wgcf"
}

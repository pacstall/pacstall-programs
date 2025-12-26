pkgname="wgcf-bin"
pkgver="2.2.26"
source=("https://github.com/ViRb3/wgcf/releases/download/v${pkgver}/wgcf_${pkgver}_linux_amd64")
sha256sums=("b49e7c52307df1f0a9ccd13ad12f87bf7ee7092df4e189f064d81860ec6f4bf5")
arch=('amd64')
pkgdesc="Cross-platform, unofficial CLI for Cloudflare Warp"
maintainer=("Wildy Sheverando <hai@shiwildy.com>")

package() {
  cd "${srcdir}"
  install -Dm755 "wgcf_${pkgver}_linux_amd64" "${pkgdir}/usr/bin/wgcf"
}

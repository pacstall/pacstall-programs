name="wgcf"
pkgver="2.2.20"
url="https://github.com/ViRb3/wgcf/releases/download/v${pkgver}/wgcf_${pkgver}_linux_amd64"
hash="2a3ab38ace4d2284a3c810a28afcc0c5280d915372214246fe7da7245e06b0fa"
arch=('amd64')
pkgdesc="🚤 Cross-platform, unofficial CLI for Cloudflare Warp"
maintainer="Wildy Sheverando <hai@wildyrando.com>"

package() {
  sudo mv wgcf_${pkgver}_linux_amd64 wgcf
  sudo chmod +x wgcf
  sudo mkdir -p "${pkgdir}/wgcf/usr/bin"
  sudo mv wgcf "${pkgdir}/wgcf/usr/bin/"
}

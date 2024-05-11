pkgname="wgcf-bin"
pkgver="2.2.20"
source=("https://github.com/ViRb3/wgcf/releases/download/v${pkgver}/wgcf_${pkgver}_linux_amd64")
sha256sums=("2a3ab38ace4d2284a3c810a28afcc0c5280d915372214246fe7da7245e06b0fa")
arch=('amd64')
pkgdesc="Cross-platform, unofficial CLI for Cloudflare Warp"
maintainer=("Wildy Sheverando <hai@wildyrando.com>")

package() {
  cd "${_archive}"
  install -Dm755 "wgcf_${pkgver}_linux_amd64" "/usr/bin/wgcf"
}

pkgname="wgcf-bin"
pkgver="2.2.22"
source=("https://github.com/ViRb3/wgcf/releases/download/v${pkgver}/wgcf_${pkgver}_linux_amd64")
sha256sums=("268d187e649870b603ad2e5c1b74a696251f6c2f6f075c726a174a0039b0b1e2")
arch=('amd64')
pkgdesc="Cross-platform, unofficial CLI for Cloudflare Warp"
maintainer=("Wildy Sheverando <wildy@wildyverando.com>")

package() {
  cd "${_archive}"
  install -Dm755 "wgcf_${pkgver}_linux_amd64" "${pkgdir}/usr/bin/wgcf"
}

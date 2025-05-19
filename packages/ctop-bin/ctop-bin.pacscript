pkgname="ctop-bin"
gives="ctop"
pkgver="0.7.7"
pkgdesc="Top-like interface for container metrics"
url='https://github.com/bcicen/ctop'
arch=("amd64" "arm64" "armel" "ppc64el")

source_amd64=("https://github.com/bcicen/ctop/releases/download/v${pkgver}/ctop-${pkgver}-linux-amd64")
sha256sums_amd64=("b78374734ebe3d14b6edee3d5512c911c250d7fa7f3f964cb00acd3bc5a02a09")
source_arm64=("https://github.com/bcicen/ctop/releases/download/v${pkgver}/ctop-${pkgver}-linux-arm64")
sha256sums_arm64=("d8d91e0fea53a8c78fa81192f078272e5a92f0ea6c4f0e38ec7c944d76e6f02f")
source_armel=("https://github.com/bcicen/ctop/releases/download/v${pkgver}/ctop-${pkgver}-linux-arm")
sha256sums_armel=("47375f029ea9e2c55d28d993396816d10d5a3e9761664a5c1b8aaab3c83f6593")
source_ppc64el=("https://github.com/bcicen/ctop/releases/download/v${pkgver}/ctop-${pkgver}-linux-ppc64le")
sha256sums_ppc64el=("0cc97f735aa0be450f6db2b2cfda5383f742a06282d8647c9b2379e2fbf68ec4")

maintainer=("chrisb09 <christian.brinkmann09@gmail.com>")
repology=("project: ${gives}")

package() {
  cd "${pkgname}~${pkgver}"
  # find the ctop-... binary file and install it to /usr/bin
  find . -type f -name "ctop-*" -exec install -Dm755 {} "${pkgdir}/usr/bin/ctop" \;
}

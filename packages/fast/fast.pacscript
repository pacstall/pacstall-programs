pkgname="fast"
pkgver="0.0.4"
source=("https://github.com/ddo/fast/releases/download/v${pkgver}/fast_linux_amd64")
sha256sums=("2775964dc15c0d677eefa4a391559689ebd4c8c8169d3b6c717c15f804f89bf6")
arch=('amd64')
pkgdesc="Minimal zero-dependency utility for testing your internet download speed from terminal"
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  cd "${srcdir}"
  mv fast_linux_amd64 fast
  chmod +x fast
  mkdir -p "${pkgdir}/fast/usr/bin"
  mv fast "${pkgdir}/fast/usr/bin"
}

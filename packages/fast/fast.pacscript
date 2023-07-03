name="fast"
version="0.0.4"
url="https://github.com/ddo/fast/releases/download/v${version}/fast_linux_amd64"
hash="2775964dc15c0d677eefa4a391559689ebd4c8c8169d3b6c717c15f804f89bf6"
arch=('amd64')
description="Minimal zero-dependency utility for testing your internet download speed from terminal"
maintainer="Elsie19 <hwengerstickel@pm.me>"

package() {
  sudo mv fast_linux_amd64 fast
  sudo chmod +x fast
  sudo mkdir -p "${pkgdir}/fast/usr/bin"
  sudo mv fast "${pkgdir}/fast/usr/bin"
}

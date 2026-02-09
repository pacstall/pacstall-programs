pkgname="browseros-deb"
gives="browseros"
pkgver="0.34.0"
pkgdesc="BrowserOS - AI-powered browser"
arch=('amd64')
url="https://github.com/browseros-ai/BrowserOS"
maintainer=("TPM28 <contact@tpm28.com>")
source=("https://github.com/browseros-ai/BrowserOS/releases/download/v${pkgver}/BrowserOS_v${pkgver}_amd64.deb")
sha256sums=("SKIP")

package() {
  true
}

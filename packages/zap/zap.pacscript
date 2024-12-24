pkgname="zap"
gives="zap"
pkgver="2.2.1"
depends=("curl" "grep" "jq" "wget")
source=("https://github.com/srevinsaju/zap/releases/download/v2.2.1/zap-amd64")
sha256sums=("4972edd5da1be5c5dd2fa14619c7068b09fd9dc31c1feea50ed564cdb14df6bc")
arch=('amd64')
pkgdesc="A delightful AppImage package manager"
maintainer=("srevinsaju <hello@srev.in>")

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/bin"
  cp zap-amd64 "${pkgdir}/usr/bin/zap"
  chmod +x "${pkgdir}/usr/bin/zap"
}

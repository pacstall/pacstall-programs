maintainer=("Vladislav Prokopenko <vladislavprokopenko@disroot.org>")
pkgname="ufetch-debian"
arch=('amd64')
pkgver="0.4"
source=("https://gitlab.com/jschx/ufetch/-/raw/v${pkgver}/ufetch-debian")
sha256sums=("8bddd627952d965f6fc11010dd227c8bc3c7856df672db1e738e7e8f4f2d6a87")
license=('MIT')
pkgdesc="Tiny system info for Unix-like operating systems."

package() {
  install -Dm755 "ufetch-debian" -t "${pkgdir}/usr/bin"
}

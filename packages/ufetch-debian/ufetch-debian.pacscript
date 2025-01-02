maintainer=("Vladislav Prokopenko <vladislavprokopenko@disroot.org>")
pkgname="ufetch-debian"
arch=('amd64')
pkgver="0.4"
source=("https://gitlab.com/jschx/ufetch/-/raw/v${pkgver}/ufetch-debian")
license=('MIT')
pkgdesc="Tiny system info for Unix-like operating systems."

package() {
  install -Dm755 "ufetch-debian" -t "${pkgdir}/usr/bin"
}

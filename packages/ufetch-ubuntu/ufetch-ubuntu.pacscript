maintainer=("Vladislav Prokopenko <vladislavprokopenko@disroot.org>")
pkgname="ufetch-ubuntu"
arch=('amd64')
pkgver="0.4"
source=("https://gitlab.com/jschx/ufetch/-/raw/main/ufetch-ubuntu")
license=('MIT')
pkgdesc="Tiny system info for Unix-like operating systems."

package() {
  install -Dm755 "ufetch-ubuntu" -t "${pkgdir}/usr/bin"
}

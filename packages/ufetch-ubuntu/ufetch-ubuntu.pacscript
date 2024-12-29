maintainer=("Vladislav Prokopenko <vladislavprokopenko@disroot.org>")
pkgname="ufetch-ubuntu"
arch=('amd64')
pkgver="0.4"
source=("https://gitlab.com/jschx/ufetch/-/raw/main/ufetch-ubuntu?ref_type=heads&inline=false")
license=('MIT')
external_connection=true
pkgdesc="Tiny system info for Unix-like operating systems."

package() {
  install -Dm755 "ufetch-ubuntu" -t "${pkgdir}/usr/bin"
  # change the binary file name to ufetch (optional)
  # mv ${pkgdir}/usr/bin/ufetch-ubuntu ${pkgdir}/usr/bin/ufetch
}

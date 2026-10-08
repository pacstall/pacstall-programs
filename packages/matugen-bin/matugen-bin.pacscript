pkgname="matugen-bin"
repology=("project: matugen")
arch=("x86_64")
pkgver="4.2.0"
license=("GPL-2.0")
url='https://github.com/InioX/matugen'
pkgdesc='Material you color generation tool with templates'
source=("https://github.com/InioX/matugen/releases/download/v${pkgver}/matugen-${pkgver}-x86_64.tar.gz")
sha256sums=("a2e3b50e49ed6439999ba3c252ed04fabd98ee4e9d12e5e5dff2e66370569751")
replaces=("${pkgname}")
maintainer=("aKqir24 <aKqir24@github.com>")

package() {
  install -Dm755 matugen -t "${pkgdir}/usr/bin"
}

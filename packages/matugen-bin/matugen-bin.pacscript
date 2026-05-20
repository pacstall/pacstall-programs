pkgname="matugen-bin"
repology=("project: matugen")
arch=("x86_64")
pkgver="4.1.0"
license=("GPL-2.0")
url='https://github.com/InioX/matugen'
pkgdesc='Material you color generation tool with templates'
source=("https://github.com/InioX/matugen/releases/download/v${pkgver}/matugen-${pkgver}-x86_64.tar.gz")
sha256sums=("ba46c324d578c782d42644f526df559be81d53352926f5bb2826c98d1340beb0")
replaces=("${pkgname}") 
maintainer=("aKqir24 <aKqir24@github.com>")

package() {
    install -Dm755 matugen -t "${pkgdir}/usr/bin"
}
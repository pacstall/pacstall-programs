pkgname="rojo-bin"
repology=("project: rojo")
arch=('amd64')
pkgver="7.6.1"
url='https://rojo.space'
gives="rojo"
source=("@${gives}::https://github.com/rojo-rbx/rojo/releases/download/v${pkgver}/rojo-${pkgver}-linux-x86_64.zip")
sha256sums=("a9542a713036897fdbd0173e7a105ea409658333133c949025fcb6f1a7ca909d")
conflicts=("${gives}-git")
pkgdesc="Enable Roblox developers to use professional-grade software engineering tools"
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")

package() {
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin/"
}

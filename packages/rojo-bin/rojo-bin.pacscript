pkgname="rojo-bin"
repology=("project: rojo")
arch=('amd64')
pkgver="7.4.4"
url='https://rojo.space'
gives="rojo"
source=("@${gives}::https://github.com/rojo-rbx/rojo/releases/download/v${pkgver}/rojo-${pkgver}-linux-x86_64.zip")
sha256sums=("784e2cd42af3d565826c4910df94f45080fc7ed6206eb6808dbc79b516323652")
conflicts=("${gives}-git")
pkgdesc="Enable Roblox developers to use professional-grade software engineering tools"
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")

package() {
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin/"
}

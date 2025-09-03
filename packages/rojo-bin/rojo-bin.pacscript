pkgname="rojo-bin"
repology=("project: rojo")
arch=('amd64')
pkgver="7.5.1"
url='https://rojo.space'
gives="rojo"
source=("@${gives}::https://github.com/rojo-rbx/rojo/releases/download/v${pkgver}/rojo-${pkgver}-linux-x86_64.zip")
sha256sums=("0d600df6c4c48a9d09c701d0c2a109c55c2db833cd9766fd7d1e6e2684843d53")
conflicts=("${gives}-git")
pkgdesc="Enable Roblox developers to use professional-grade software engineering tools"
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")

package() {
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin/"
}

pkgname="rojo-bin"
repology=("project: rojo")
arch=('amd64')
pkgver="7.6.0"
url='https://rojo.space'
gives="rojo"
source=("@${gives}::https://github.com/rojo-rbx/rojo/releases/download/v${pkgver}/rojo-${pkgver}-linux-x86_64.zip")
sha256sums=("f0373a2f9653dd3ab724a36c6fabc6400a0732d49e4ad233c5353a72372f78f4")
conflicts=("${gives}-git")
pkgdesc="Enable Roblox developers to use professional-grade software engineering tools"
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")

package() {
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin/"
}

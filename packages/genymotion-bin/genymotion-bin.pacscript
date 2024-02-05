name="genymotion-bin"
gives="genymotion"
repology=("project: genymotion")
pkgver="3.6.0"
replace=("${gives}")
breaks=("${gives}" "${gives}-bin" "${gives}-git" "${gives}-app" "${gives}-deb")
arch=("amd64")
depends=("xdg-utils")
hash="092d40f6e76de3b6e1827609aaa9021b7cf85da3d51e6cf8d7b553b18d9c70e0"
url="https://dl.genymotion.com/releases/genymotion-${pkgver}/genymotion-${pkgver}-linux_x64.bin"
homepage="https://genymotion.com"
pkgdesc="Android virtual devices"
maintainer="Arrowsome <ramtintoosi@gmail.com>"

package() {
  sudo chmod +x "./genymotion-${pkgver}-linux_x64.bin"
  sudo "./genymotion-${pkgver}-linux_x64.bin" -y -d "${pkgdir}/opt"
}

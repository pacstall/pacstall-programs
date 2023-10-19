name="genymotion-bin"
gives="genymotion"
repology=("project: genymotion")
pkgver="3.5.1"
replace=("${gives}")
breaks=("${gives}" "${gives}-bin" "${gives}-git" "${gives}-app" "${gives}-deb")
arch=("amd64")
depends=("xdg-utils")
hash="060a76201f1a7f9155d96db61a5024cf26cb07fe546272520bad3b3991de8e3a"
url="https://dl.genymotion.com/releases/genymotion-${pkgver}/genymotion-${pkgver}-linux_x64.bin"
homepage="https://genymotion.com"
pkgdesc="Android virtual devices"
maintainer="Arrowsome <ramtintoosi@gmail.com>"

package() {
  sudo chmod +x "./genymotion-${pkgver}-linux_x64.bin"
  sudo "./genymotion-${pkgver}-linux_x64.bin" -y -d "${pkgdir}/opt"
}

name="genymotion-bin"
gives="genymotion"
repology=("project: genymotion")
version="3.4.0"
replace=("${gives}")
breaks=("${gives}" "${gives}-bin" "${gives}-git" "${gives}-app" "${gives}-deb")
arch=("amd64")
depends=("xdg-utils")
hash="da96278e3b24988c505cb5f04294b3fc7c680aabcad13b910c1a21fcaad54e93"
url="https://dl.genymotion.com/releases/genymotion-${version}/genymotion-${version}-linux_x64.bin"
homepage="https://genymotion.com"
description="Android virtual devices"
maintainer="Arrowsome <ramtintoosi@gmail.com>"

package() {
  sudo chmod +x "./genymotion-${version}-linux_x64.bin"
  sudo "./genymotion-${version}-linux_x64.bin" -y -d "${pkgdir}/opt"
}

pkgname="yafetch-git"
gives="yafetch"
breaks=("${gives}-deb" "${gives}-bin" "${gives}-app" "${gives}-git")
source=("https://github.com/Elsie19/yafetch.git")
arch=("all")
pkgver="0.1.0"
pkgdesc="Yet another fetch tool"
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  cd "yafetch"
  install -Dm755 yafetch "${pkgdir}/usr/bin/yafetch"
}

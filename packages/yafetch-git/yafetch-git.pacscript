name="yafetch-git"
gives="yafetch"
breaks=("${gives}-deb" "${gives}-bin" "${gives}-app" "${gives}-git")
url="https://github.com/Elsie19/yafetch.git"
pkgver="0.1.0"
pkgdesc="Yet another fetch tool"
maintainer="Elsie19 <elsie19@pm.me>"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

package() {
  sudo install -Dm755 yafetch "${pkgdir}/usr/bin/yafetch"
}

name="cortile-bin"
gives="cortile"
pkgdesc="Linux auto tiling manager with hot corner support"
maintainer="AJStrong <ajstrong.dev@gmail.com>"
pkgver="2.2.2"
replace=("${gives}" "${gives}-git")
arch=('arm64' 'amd64')
homepage='https://github.com/leukipp/cortile'
repology=("project: cortile")
if [[ ${CARCH} == arm64 ]]; then
  hash="fa498ffd7a222223b36605c3eceb5d552bb55a8f33c9a02f496e99509c02fd00"
else
  hash="57f7c6ea2ac53e1f5bcb4336f54743a2a80ab33d2b4513fa850fbc46bf149e03"
fi
url="https://github.com/leukipp/${gives}/releases/download/v${pkgver}/${gives}_${pkgver}_linux_${CARCH}.tar.gz"

package() {
  sudo install -Dm755 "cortile" -t "${pkgdir}/usr/bin"
}

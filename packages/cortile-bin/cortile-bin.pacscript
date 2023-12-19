name="cortile-bin"
gives="cortile"
pkgdesc="Linux auto tiling manager with hot corner support"
maintainer="AJStrong <ajstrong.dev@gmail.com>"
pkgver="2.3.1"
replace=("${gives}" "${gives}-git")
arch=('arm64' 'amd64')
homepage='https://github.com/leukipp/cortile'
repology=("project: cortile")
if [[ ${CARCH} == arm64 ]]; then
  hash="c8cdbb5da1061f20928baa5bbce765dbca9b0733603267ca090a822b0888d544"
else
  hash="914389898ef014518836d126b18f33c03d9abdf6673ca9ec40360f79e37dd8b0"
fi
url="https://github.com/leukipp/${gives}/releases/download/v${pkgver}/${gives}_${pkgver}_linux_${CARCH}.tar.gz"

package() {
  sudo install -Dm755 "cortile" -t "${pkgdir}/usr/bin"
}

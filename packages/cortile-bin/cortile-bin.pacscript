name="cortile-bin"
gives="cortile"
pkgdesc="Linux auto tiling manager with hot corner support"
maintainer="AJStrong <ajstrong.dev@gmail.com>"
pkgver="2.3.0"
replace=("${gives}" "${gives}-git")
arch=('arm64' 'amd64')
homepage='https://github.com/leukipp/cortile'
repology=("project: cortile")
if [[ ${CARCH} == arm64 ]]; then
  hash="8a3f5ba10d7513689fde04aab4d69d12b57a128b32889a22ae0999624d59195d"
else
  hash="2b48705a156083a5db9dbf3f023edb6de9c238ca1f6e2aed36d2995dfdac3b34"
fi
url="https://github.com/leukipp/${gives}/releases/download/v${pkgver}/${gives}_${pkgver}_linux_${CARCH}.tar.gz"

package() {
  sudo install -Dm755 "cortile" -t "${pkgdir}/usr/bin"
}

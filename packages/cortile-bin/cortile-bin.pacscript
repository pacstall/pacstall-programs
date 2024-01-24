name="cortile-bin"
gives="cortile"
pkgdesc="Linux auto tiling manager with hot corner support"
maintainer="AJStrong <ajstrong.dev@gmail.com>"
pkgver="2.3.3"
replace=("${gives}" "${gives}-git")
arch=('arm64' 'amd64')
homepage='https://github.com/leukipp/cortile'
repology=("project: cortile")
if [[ ${CARCH} == arm64 ]]; then
  hash="8c71971432ff01f77efdd89c8fdddf274c1d24e6848e394dc66e045a434c5296"
else
  hash="fb051398a246d2feebc00fa9c2a6e1f244ef134bcb6254510afdf89fef72be49"
fi
url="https://github.com/leukipp/${gives}/releases/download/v${pkgver}/${gives}_${pkgver}_linux_${CARCH}.tar.gz"

package() {
  sudo install -Dm755 "cortile" -t "${pkgdir}/usr/bin"
}

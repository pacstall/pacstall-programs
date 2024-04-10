name="cortile-bin"
gives="cortile"
pkgdesc="Linux auto tiling manager with hot corner support"
maintainer="AJStrong <ajstrong.dev@gmail.com>"
pkgver="2.4.0"
replace=("${gives}" "${gives}-git")
arch=('arm64' 'amd64')
homepage='https://github.com/leukipp/cortile'
repology=("project: cortile")
if [[ ${CARCH} == arm64 ]]; then
  hash="65396926a995c970d07dd71536f04d24b7eea12b53f892508c11848726bd8d22"
else
  hash="1a9c87737e6d212a15921ac5e10f21b64c7aa2051dbadc976f3c817674418537"
fi
url="https://github.com/leukipp/${gives}/releases/download/v${pkgver}/${gives}_${pkgver}_linux_${CARCH}.tar.gz"

package() {
  sudo install -Dm755 "cortile" -t "${pkgdir}/usr/bin"
}

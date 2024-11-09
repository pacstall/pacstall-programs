pkgname="cortile-bin"
gives="cortile"
pkgdesc="Linux auto tiling manager with hot corner support"
maintainer=("AJStrong <ajstrong.dev@gmail.com>")
pkgver="2.5.2"
replaces=("${gives}" "${gives}-git")
arch=('arm64' 'amd64')
url='https://github.com/leukipp/cortile'
repology=("project: cortile")
sha256sums_arm64=("22be6b2129765cb727d536818f19d6a3d2c9936315bab79e970106528bafcc95")
sha256sums_amd64=("f78bf9fc794d8a0068b77641c38c167fff6d338c2a6b987b88e62816d1390580")
source=("https://github.com/leukipp/${gives}/releases/download/v${pkgver}/${gives}_${pkgver}_linux_${CARCH}.tar.gz")

package() {
  cd "${_archive}"
  install -Dm755 "cortile" -t "${pkgdir}/usr/bin"
}

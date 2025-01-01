pkgname="cortile-bin"
gives="cortile"
pkgdesc="Linux auto tiling manager with hot corner support"
maintainer=("AJStrong <ajstrong.dev@gmail.com>")
pkgver="2.5.2"
replaces=("${gives}" "${gives}-git")
arch=('arm64' 'amd64')
url='https://github.com/leukipp/cortile'
repology=("project: cortile")
sha256sums_arm64=("acebab88ef9e2301a25ce754838b3e8a5f6d800312436e871f2fad73b6f6fc9a")
sha256sums_amd64=("dcc104bb2dbdf5596b6de5e578b8988347200759ca5c1134f9d0bec3b19ef3dd")
source=("@${pkgname}~${pkgver}::https://github.com/leukipp/${gives}/releases/download/v${pkgver}/${gives}_${pkgver}_linux_${CARCH}.tar.gz")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 "cortile" -t "${pkgdir}/usr/bin"
}

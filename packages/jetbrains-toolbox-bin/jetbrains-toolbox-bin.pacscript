pkgname="jetbrains-toolbox-bin"
gives="jetbrains-toolbox"
arch=("amd64")
pkgver="3.2.0.65851"
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
replaces=("${gives}")
pkgdesc="JetBrains Toolbox is a suite of professional development tools for a range of languages and technologies using JetBrains IDEs"
maintainer=("Paul Cosma (saenai) <paul.cosma97@gmail.com>")
sha256sums=("65a01f13773c1f235e568d0f33fbeb6f415b583aabedd32f83dec781f0303eba")
source=("@${pkgname}~${pkgver}::https://download-cdn.jetbrains.com/toolbox/${gives}-${pkgver}.tar.gz")

package() {
  cd "${pkgname}~${pkgver}"
  mkdir -p "${pkgdir}/usr/bin"
  mv "./${gives}" "${pkgdir}/usr/bin"
}

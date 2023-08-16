name="jetbrains-toolbox-bin"
pkgname="jetbrains-toolbox"
pkgver="2.0.2.16660"
breaks=("${pkgname}" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
replace=("${pkgname}")
gives="${pkgname}"
pkgdesc="JetBrains Toolbox is a suite of professional development tools for a range of languages and technologies using JetBrains IDEs"
maintainer="Paul Cosma (saenai) <paul.cosma97@gmail.com>"
hash="C3A50186D9A1D350A42E4972C9026E8FE63EB054488E88E8BE104D9D2E0BF858"
url="https://download-cdn.jetbrains.com/toolbox/${pkgname}-${pkgver}.tar.gz"

package() {
  sudo mkdir -p "${pkgdir}/usr/bin"
  sudo mv "./${pkgname}" "${pkgdir}/usr/bin"
}

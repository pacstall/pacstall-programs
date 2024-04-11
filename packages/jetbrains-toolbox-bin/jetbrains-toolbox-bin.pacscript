pkgname="jetbrains-toolbox-bin"
gives="jetbrains-toolbox"
pkgver="1.24.12080"
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
replaces=("${gives}")
pkgdesc="JetBrains Toolbox is a suite of professional development tools for a range of languages and technologies using JetBrains IDEs"
maintainer=("Paul Cosma (saenai) <paul.cosma97@gmail.com>")
sha256sums=("d819065a45d29d53646490fbd8ca45dbcaa3d544bdbc6da4494377460ddf6b79")
source=("https://download-cdn.jetbrains.com/toolbox/${gives}-${pkgver}.tar.gz")

package() {
  cd "${_archive}"
  mkdir -p "${pkgdir}/usr/bin"
  mv "./${gives}" "${pkgdir}/usr/bin"
}

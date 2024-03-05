name="jetbrains-toolbox-bin"
pkgname="jetbrains-toolbox"
pkgver="1.24.12080"
breaks=("${pkgname}" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
replaces=("${pkgname}")
gives="${pkgname}"
pkgdesc="JetBrains Toolbox is a suite of professional development tools for a range of languages and technologies using JetBrains IDEs"
maintainer="Paul Cosma (saenai) <paul.cosma97@gmail.com>"
hash=("d819065a45d29d53646490fbd8ca45dbcaa3d544bdbc6da4494377460ddf6b79")
source=("https://download-cdn.jetbrains.com/toolbox/${pkgname}-${pkgver}.tar.gz")

package() {
  sudo mkdir -p "${pkgdir}/usr/bin"
  sudo mv "./${pkgname}" "${pkgdir}/usr/bin"
}

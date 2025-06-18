pkgname="arduino-cli-bin"
gives="arduino-cli"
repology=("project: ${gives}")
arch=("amd64")
pkgver="1.2.2"
maintainer=("DismissedGuy <me@mikealmel.ooo>")
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git")
source=("@${pkgname}~${pkgver}::https://github.com/arduino/arduino-cli/releases/download/v${pkgver}/${gives}_${pkgver}_Linux_64bit.tar.gz")
pkgdesc="An all-in-one solution that provides Boards/Library Managers, sketch builder, board detection, uploader, and many other tools needed to use any Arduino compatible board and platform from command line or machine interfaces"
sha256sums=("a5ad085d1b02fd4010df18b1bbf20453276efe6c6e2ac323baa0cac4e96a85b4")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
